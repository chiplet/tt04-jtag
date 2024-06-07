![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg)

# Poor Person's Boundary Scan

Implements a small JTAG state machine with Test Data Registers for blinking leds.

## How to test

The design has been tested with the following steps, using [Glasgow](https://glasgow-embedded.org) as a JTAG dongle.

1. Select design 357 using [TinyTapeout Commander](https://commander.tinytapeout.com)

1. Connect a pullup resistor (10k or so) between `BIDIR3` and `3V3`. This is the `TRSTn` pin which should not be left floating.

1. Connect Glasgow interface explorer pins A[4:0] to bidirectional pins bidir[4:0].
   The order does not matter.

2. Probe JTAG pinout using `glasgow jtag-pinout`

```shell
$ glasgow run jtag-pinout -V 3.3 --pins-jtag 0,1,2,3,4
I: g.device.hardware: generating bitstream ID d7610100093cc8e961a2c9e0d4b1a6d6
I: g.cli: running handler for applet 'jtag-pinout'
I: g.applet.interface.jtag_pinout: port(s) A, B voltage set to 3.3 V
I: g.applet.interface.jtag_pinout: detecting pull resistors
I: g.applet.interface.jtag_pinout: pull-H: A0
I: g.applet.interface.jtag_pinout: pull-L: A1, A2, A3, A4
I: g.applet.interface.jtag_pinout: detecting TCK, TMS, and TDO
I: g.applet.interface.jtag_pinout: shifted 10 out of IR with TCK=A3 TMS=A2 TDO=A4
I: g.applet.interface.jtag_pinout: detecting TDI
I: g.applet.interface.jtag_pinout: shifted 3-bit IR with TCK=A3 TMS=A2 TDI=A1 TDO=A4
I: g.applet.interface.jtag_pinout: detecting TRST#
I: g.applet.interface.jtag_pinout: disabled TAP with TCK=A3 TMS=A2 TDI=A1 TDO=A4 TRST#=A0
I: g.applet.interface.jtag_pinout: JTAG interface with reset detected
I: g.applet.interface.jtag_pinout: use `jtag-probe -V 3.3 --pin-tck 3 --pin-tms 2 --pin-tdi 1 --pin-tdo 4 --pin-trst 0` as arguments
```

3. Start Glasgow as OpenOCD remote bitbang server on localhost port 2222 using the previously identified pinout

```shell
$ glasgow run jtag-openocd -V 3.3 --pin-tck 3 --pin-tms 2 --pin-tdi 1 --pin-tdo 4 --pin-trst 0 tcp:localhost:2222
```

4. Start OpenOCD with the provided `glasgow-remote-bitbang.cfg` that establishes a TCP connection to the Glasgow remote bitbang server. Note the name of the JTAG TAP. In this case it's `auto0.tap`
```shell
$ openocd -f glasgow-remote-bitbang.cfg
Open On-Chip Debugger 0.12.0
Licensed under GNU GPL v2
For bug reports, read
        http://openocd.org/doc/doxygen/bugs.html
Info : only one transport option; autoselect 'jtag'
Warn : Transport "jtag" was already selected
Info : Listening on port 6666 for tcl connections
Info : Listening on port 4444 for telnet connections
Warn : An adapter speed is not selected in the init scripts. OpenOCD will try to run the adapter at the low speed (100 kHz)
Warn : To remove this warnings and achieve reasonable communication speed with the target, set "adapter speed" or "jtag_rclk" in the init scripts.
Info : Initializing remote_bitbang driver
Info : Connecting to localhost:2222
Info : remote_bitbang driver initialized
Info : This adapter doesn't support configurable speed
Warn : There are no enabled taps.  AUTO PROBING MIGHT NOT WORK!!
Info : JTAG tap: auto0.tap tap/device found: 0x10001003 (mfg: 0x001 (AMD), part: 0x0001, ver: 0x1)
Warn : AUTO auto0.tap - use "jtag newtap auto0 tap -irlen 3 -expected-id 0x10001003"
Warn : gdb services need one or more targets defined
```

5. Finally, take a telnet connection to OpenOCD on localhost port 4444. This should land in an interactive OpenOCD command prompt. OpenOCD JTAG commands are documented [here](https://openocd.org/doc/html/JTAG-Commands.html).
```shell
$ telnet 127.0.0.1 4444

# Reset JTAG state machine, this should assert BIDIR5 pin
> pathmove reset

# shift 0b11 to blink_dir (TDR 4) to set blink pins as outputs
> irscan auto0.tap 4
> drscan auto0.tap 2 0x3

# shift values to blink_out (TDR 3) to update blink pin states
> irscan auto0.tap 3
> drscan auto0.tap 2 0x1
> drscan auto0.tap 2 0x2
> drscan auto0.tap 2 0x3
> drscan auto0.tap 2 0x0

# shift values to boundary_scan (TDR 1) to update output pins
# connected to the 7-segment display
> irscan auto0.tap 1
> drscan auto0.tap 8 0xAA
> drscan auto0.tap 8 0x55
> drscan auto0.tap 8 0xFF
> drscan auto0.tap 8 0x00
```


# What is Tiny Tapeout?

TinyTapeout is an educational project that aims to make it easier and cheaper than ever to get your digital designs manufactured on a real chip!

Go to https://tinytapeout.com for instructions!

## How to change the Wokwi project

Edit the [info.yaml](info.yaml) and change the wokwi_id to match your project.

## How to enable the GitHub actions to build the ASIC files

Please see the instructions for:

- [Enabling GitHub Actions](https://tinytapeout.com/faq/#when-i-commit-my-change-the-gds-action-isnt-running)
- [Enabling GitHub Pages](https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part)

## How does it work?

When you edit the info.yaml to choose a different ID, the [GitHub Action](.github/workflows/gds.yaml) will fetch the digital netlist of your design from Wokwi.

After that, the action uses the open source ASIC tool called [OpenLane](https://www.zerotoasiccourse.com/terminology/openlane/) to build the files needed to fabricate an ASIC.

## Resources

- [FAQ](https://tinytapeout.com/faq/)
- [Digital design lessons](https://tinytapeout.com/digital_design/)
- [Learn how semiconductors work](https://tinytapeout.com/siliwiz/)
- [Join the community](https://discord.gg/rPK2nSjxy8)

## What next?

- Share your GDS on Twitter, tag it [#tinytapeout](https://twitter.com/hashtag/tinytapeout?src=hashtag_click) and [link me](https://twitter.com/matthewvenn)!
