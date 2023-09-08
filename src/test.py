import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles


segments = [ 63, 6, 91, 79, 102, 109, 124, 7, 127, 103 ]



async def step_time(dut):
    await ClockCycles(dut.clk, 10)

# JTAG driver methods ported from: https://gitlab.com/a-core/a-core_thesydekick/jtag_kernel

# Convenience function for stepping a JTAG cycle (TCK high -> low -> high)
async def jtag_cycle(dut, tms, tdi=None):
    """
    Cycle ``TCK`` once while holding ``TMS`` and ``TDI`` at given values.

    Parameters
    ----------
    dut
        Instance of cocotb design under test.

    tms : int
        TMS value during cycle (``0`` or ``1``)

    tdi : int, None
        TDI value during cycle (``0`` or ``1``), 
        ``None`` to keep the current logic level unchanged.
    """
    # sanity checks
    assert tms==0 or tms==1
    assert tdi is None or tdi==0 or tdi==1

    # await step_time(dut)
    dut.uio_in[0].value = 0 # TCK = 0
    dut.uio_in[1].value = tms # set TMS
    if tdi is not None:
        dut.uio_in[2].value = tdi # set TDI

    await step_time(dut)
    dut.uio_in[0].value = 1 # TCK = 1
    await step_time(dut)
    # dut.uio_in[1].value = tms # set TMS
    # f.set_control_data(time=self.time, name='io_TMS', val=tms)

# switch to Test-Logic-Reset state
async def tms_reset(dut):
    """
    Move TAP controller FSM to *Test-Logic-Reset* state from any other state by
    performing 5 ``TCK`` cycles while holding ``TMS = 1``.

    """
    dut.uio_in[1].value = 1 # TMS = 1
    dut.uio_in[0].value = 1 # TCK = 1
    await step_time(dut)
    for i in range(5):
        dut.uio_in[0].value = 0 # TCK = 0
        await step_time(dut)
        dut.uio_in[0].value = 1 # TCK = 1
        await step_time(dut)

async def reset_to_idle(dut):
    """
    Move TAP controller FSM from *Test-Logic-Reset* state to *Run-Test/Idle* state.

    """
    await tms_reset(dut)
    await jtag_cycle(dut, 0) # state 15 = Test-Logic-Reset

async def idle_to_drshift(dut):
    """
    Move TAP controller FSM from *Run-Test/Idle* state to *ShiftDR* state.

    """
    await jtag_cycle(dut, 1) # state 12 = Run-Test/Idle
    await jtag_cycle(dut, 0) # state 7 = Select-DR-Scan
    await jtag_cycle(dut, 0) # state 6 = Capture-DR

async def idle_to_irshift(dut):
    """
    Move the TAP controller FSM from *Run-Test/Idle* state to *ShiftIR* state.

    """
    await jtag_cycle(dut, 1) # state 12 = Run-Test/Idle
    await jtag_cycle(dut, 1) # state 7 = Select-DR-Scan
    await jtag_cycle(dut, 0) # state 4 = Select-IR-Scan
    await jtag_cycle(dut, 0) # state 14 = Capture-IR

async def irshift_to_idle(dut):
    """
    Move the TAP controller FSM from *ShiftIR* state to *Run-Test/Idle* state.

    """
    await jtag_cycle(dut, 1) # state 9 = Exit1-IR
    await jtag_cycle(dut, 0) # state 13 = Update-IR


async def shift(dut, tdi_str):
    """
    Shift given data to ``TDI``.

    Parameters
    ----------
    tdi_str : str
        String representation of the binary number to be shifted in.

    """
    if len(tdi_str) > 0:
        tdi_str = tdi_str[::-1]
        for i in range(0, len(tdi_str) - 1):
            await jtag_cycle(dut, 0, int(tdi_str[i]))
        await jtag_cycle(dut, 1, int(tdi_str[len(tdi_str) - 1]))


async def shift_instruction(dut, tdi_str):
    """
    Shift one insctruction to the instruction register. Assumes that the JTAG
    machine is currently in the *Run-Test/Idle* state.

    Parameters
    ----------
    tdi_str : str
        String representation of the binary number to be shifted in.

    """
    await idle_to_irshift(dut)
    await shift(dut, tdi_str)
    await irshift_to_idle(dut)

async def drshift_to_idle(dut):
    """
    Move the TAP controller FSM from *ShiftDR* state to *Run-Test/Idle* state.

    Takes 2 cycles.
    """
    await jtag_cycle(dut, 1) # state 1 = Exit1-DR
    await jtag_cycle(dut, 0) # state 5 = Update-DR


async def shift_data(dut, tdi_str):
    """
    Shift data to the currently selected data register.

    Takes ``len(tdi_str) + 5`` cycles.

    Parameters
    ----------
    tdi_str : str
        String representation of the binary number to be shifted in.

    """
    await idle_to_drshift(dut)  # 3 cycles
    await shift(dut, tdi_str)     # len(tdi_str) cycles
    await drshift_to_idle(dut)  # 2 cycles


async def shift_to_chain(dut, icode_str, tdi_str):
    """
    Shift data to a specific data register.

    Takes ``len(icode_str) + len(tdi_str) + 11`` cycles.

    Parameters
    ----------
    tdi_str : str
        String representation of the binary number to be shifted in.
    icode_str : str
        String representation of the binary number to be shifted into the
        Instruction Register, which selects the corresponding Test Data Register.

    """
    await shift_instruction(dut, icode_str)   # len(icode_str) + 6 cycles
    await shift_data(dut, tdi_str)            # len(tdi_str) + 5 cycles



@cocotb.test()
async def test_jtag(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    dut.uio_in[0].value = 0 # TCK = 0
    dut.uio_in[1].value = 0 # TMS = 0
    dut.uio_in[2].value = 0 # TDI = 0

    # TRSTn reset
    # dut.uio_in[3].value = 0
    # await ClockCycles(dut.clk, 10)
    # dut.uio_in[3].value = 1
    # await ClockCycles(dut.clk, 100)
    # assert dut.uio_out[5] == 1

    # drive somewhere else
    # await jtag_cycle(dut, 1)
    # await jtag_cycle(dut, 0)
    # await jtag_cycle(dut, 1)
    # await jtag_cycle(dut, 0)

    # reset again, now with TMS reset sequence
    await tms_reset(dut)
    assert dut.uio_out[5] == 1

    await reset_to_idle(dut)

    # shift stuff to fixed outputs
    await shift_to_chain(dut, "001", "10101010")
    assert dut.uo_out.value == 0b10101010
    await shift_to_chain(dut, "001", "00001111")
    assert dut.uo_out.value == 0b00001111
    await shift_to_chain(dut, "001", "11110000")
    assert dut.uo_out.value == 0b11110000

    # shift stuff to blink outputs
    await shift_to_chain(dut, "011", "00")
    assert dut.uio_out[7].value == 0
    assert dut.uio_out[6].value == 0
    await shift_to_chain(dut, "011", "01")
    assert dut.uio_out[7].value == 0
    assert dut.uio_out[6].value == 1
    await shift_to_chain(dut, "011", "10")
    assert dut.uio_out[7].value == 1
    assert dut.uio_out[6].value == 0
    await shift_to_chain(dut, "011", "11")
    assert dut.uio_out[7].value == 1
    assert dut.uio_out[6].value == 1
    await step_time(dut)
