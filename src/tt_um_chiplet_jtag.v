`default_nettype none

// This design does simply connects the given user pins to a block of JTAG test logic.
// The JTAG test logic has its own clock and reset so `clk` and `rst_n` are left unused.

module tt_um_chiplet_jtag #( parameter MAX_COUNT = 24'd10_000_000 ) (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    // Use bidirectional pins for JTAG TAP
    // uio[0] = TCK (hardcode as input)
    // uio[1] = TMS (hardcode as input)
    // uio[2] = TDI (hardcode as input)
    // uio[3] = TRSTn (hardcode as input)
    // uio[4] = TDO (hardcode as output)
    // uio[5] = tapIsInTestLogicReset (hardcoded as output, useful for debug during bringup)
    wire TCK, TMS, TDI, TRSTn, TDO, tapIsInTestLogicReset;
    assign TCK   = uio_in[0];
    assign TMS   = uio_in[1];
    assign TDI   = uio_in[2];
    assign TRSTn = uio_in[3];
    assign uio_out[4] = TDO;
    assign uio_out[5] = tapIsInTestLogicReset;
    assign uio_oe[0] = 1'b0;
    assign uio_oe[1] = 1'b0;
    assign uio_oe[2] = 1'b0;
    assign uio_oe[3] = 1'b0;
    assign uio_oe[4] = 1'b1;
    assign uio_oe[5] = 1'b1;

    // blink blink for rest of the bidirectional IO
    wire [1:0] blink_in;
    wire [1:0] blink_out;
    wire [1:0] blink_oe;
    assign blink_in = uio_in[7:6];
    assign uio_out[7:6] = blink_out;
    assign uio_oe[7:6] = blink_oe;

    // JTAG test logic generated from the Chisel code in the JTAG submodule using
    // configuration given in `jtag-config.yml`.
    generated_jtag jtag(
        // input        tapio_TCK,
        // input        tapio_TMS,
        // input        tapio_TDI,
        // input        tapio_TRSTn,
        // output       tapio_TDO_data,
        // output       tapio_TDO_driven,
        // input  [1:0] tdrio_in_4,
        // input  [1:0] tdrio_in_2,
        // input  [7:0] tdrio_in_1,
        // output [1:0] tdrio_out_4,
        // output [1:0] tdrio_out_3,
        // output [7:0] tdrio_out_1,
        // output [3:0] io_state,
        // output [2:0] io_instruction,
        // output       io_tapIsInTestLogicReset
        .tapio_TCK                (TCK),
        .tapio_TMS                (TMS),
        .tapio_TDI                (TDI),
        .tapio_TRSTn              (TRSTn),
        .tapio_TDO_data           (TDO),
        // .tapio_TDO_driven         (),
        .tdrio_in_1               (ui_in),      // fixed user inputs capture
        .tdrio_out_1              (uo_out),     // fixed user outputs update
        .tdrio_in_2               (blink_in),   // blink_outputs update
        .tdrio_out_3              (blink_out),  // blink_inputs capture
        .tdrio_in_4               (blink_oe),   // blink_oe capture
        .tdrio_out_4              (blink_oe),   // blink_oe update
        // .io_state                 (),
        // .io_instruction           (),
        .io_tapIsInTestLogicReset (tapIsInTestLogicReset)
    );

endmodule
