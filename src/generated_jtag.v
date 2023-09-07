module CaptureUpdateChain(
  input        clock,
  input        reset,
  input        io_chainIn_shift,
  input        io_chainIn_data,
  input        io_chainIn_capture,
  input        io_chainIn_update,
  output       io_chainOut_data,
  input  [7:0] io_capture_bits,
  output       io_update_valid,
  output [7:0] io_update_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg  regs_0; // @[JtagShifter.scala 253:43]
  reg  regs_1; // @[JtagShifter.scala 253:43]
  reg  regs_2; // @[JtagShifter.scala 253:43]
  reg  regs_3; // @[JtagShifter.scala 253:43]
  reg  regs_4; // @[JtagShifter.scala 253:43]
  reg  regs_5; // @[JtagShifter.scala 253:43]
  reg  regs_6; // @[JtagShifter.scala 253:43]
  reg  regs_7; // @[JtagShifter.scala 253:43]
  wire [3:0] updateBits_lo = {regs_3,regs_2,regs_1,regs_0}; // @[Cat.scala 31:58]
  wire [3:0] updateBits_hi = {regs_7,regs_6,regs_5,regs_4}; // @[Cat.scala 31:58]
  reg [7:0] captureBits; // @[JtagShifter.scala 260:28]
  wire  _T_1 = ~(io_chainIn_capture & io_chainIn_update); // @[JtagShifter.scala 281:10]
  wire  _T_4 = _T_1 & ~(io_chainIn_capture & io_chainIn_shift); // @[JtagShifter.scala 282:7]
  wire  _T_7 = _T_4 & ~(io_chainIn_update & io_chainIn_shift); // @[JtagShifter.scala 283:7]
  assign io_chainOut_data = regs_0; // @[JtagShifter.scala 255:20]
  assign io_update_valid = io_chainIn_capture ? 1'h0 : io_chainIn_update; // @[JtagShifter.scala 264:29 268:21]
  assign io_update_bits = {updateBits_hi,updateBits_lo}; // @[Cat.scala 31:58]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & ~_T_7) begin
          $fatal; // @[JtagShifter.scala 281:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~_T_7) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at JtagShifter.scala:281 assert(!(io.chainIn.capture && io.chainIn.update)\n"); // @[JtagShifter.scala 281:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 264:29]
      regs_0 <= 1'h0; // @[JtagShifter.scala 265:59]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 269:35]
      regs_0 <= captureBits[0]; // @[JtagShifter.scala 253:43]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 272:34]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 253:43]
        regs_0 <= regs_1;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 264:29]
      regs_1 <= 1'h0; // @[JtagShifter.scala 265:59]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 269:35]
      regs_1 <= captureBits[1]; // @[JtagShifter.scala 253:43]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 272:34]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 253:43]
        regs_1 <= regs_2;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 264:29]
      regs_2 <= 1'h0; // @[JtagShifter.scala 265:59]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 269:35]
      regs_2 <= captureBits[2]; // @[JtagShifter.scala 253:43]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 272:34]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 253:43]
        regs_2 <= regs_3;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 264:29]
      regs_3 <= 1'h0; // @[JtagShifter.scala 265:59]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 269:35]
      regs_3 <= captureBits[3]; // @[JtagShifter.scala 253:43]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 272:34]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 253:43]
        regs_3 <= regs_4;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 264:29]
      regs_4 <= 1'h0; // @[JtagShifter.scala 265:59]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 269:35]
      regs_4 <= captureBits[4]; // @[JtagShifter.scala 253:43]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 272:34]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 253:43]
        regs_4 <= regs_5;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 264:29]
      regs_5 <= 1'h0; // @[JtagShifter.scala 265:59]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 269:35]
      regs_5 <= captureBits[5]; // @[JtagShifter.scala 253:43]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 272:34]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 253:43]
        regs_5 <= regs_6;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 264:29]
      regs_6 <= 1'h0; // @[JtagShifter.scala 265:59]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 269:35]
      regs_6 <= captureBits[6]; // @[JtagShifter.scala 253:43]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 272:34]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 253:43]
        regs_6 <= regs_7;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 264:29]
      regs_7 <= 1'h0; // @[JtagShifter.scala 265:59]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 269:35]
      regs_7 <= captureBits[7]; // @[JtagShifter.scala 253:43]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 272:34]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 253:43]
        regs_7 <= io_chainIn_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 260:28]
      captureBits <= 8'h0; // @[JtagShifter.scala 260:28]
    end else begin
      captureBits <= io_capture_bits; // @[JtagShifter.scala 262:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  regs_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  regs_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  regs_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  regs_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  regs_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  captureBits = _RAND_8[7:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    regs_0 = 1'h0;
  end
  if (reset) begin
    regs_1 = 1'h0;
  end
  if (reset) begin
    regs_2 = 1'h0;
  end
  if (reset) begin
    regs_3 = 1'h0;
  end
  if (reset) begin
    regs_4 = 1'h0;
  end
  if (reset) begin
    regs_5 = 1'h0;
  end
  if (reset) begin
    regs_6 = 1'h0;
  end
  if (reset) begin
    regs_7 = 1'h0;
  end
  if (reset) begin
    captureBits = 8'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CaptureChain(
  input        clock,
  input        reset,
  input        io_chainIn_shift,
  input        io_chainIn_data,
  input        io_chainIn_capture,
  input        io_chainIn_update,
  output       io_chainOut_data,
  input  [1:0] io_capture_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  regs_0; // @[JtagShifter.scala 149:43]
  reg  regs_1; // @[JtagShifter.scala 149:43]
  reg [1:0] captureBits; // @[JtagShifter.scala 150:28]
  wire  _T_1 = ~(io_chainIn_capture & io_chainIn_update); // @[JtagShifter.scala 164:10]
  wire  _T_4 = _T_1 & ~(io_chainIn_capture & io_chainIn_shift); // @[JtagShifter.scala 165:7]
  wire  _T_7 = _T_4 & ~(io_chainIn_update & io_chainIn_shift); // @[JtagShifter.scala 166:7]
  assign io_chainOut_data = regs_0; // @[JtagShifter.scala 153:20]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & ~_T_7) begin
          $fatal; // @[JtagShifter.scala 164:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~_T_7) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at JtagShifter.scala:164 assert(!(io.chainIn.capture && io.chainIn.update)\n"); // @[JtagShifter.scala 164:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_0 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_0 <= captureBits[0]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_0 <= regs_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_1 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_1 <= captureBits[1]; // @[JtagShifter.scala 158:15]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_1 <= io_chainIn_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 150:28]
      captureBits <= 2'h0; // @[JtagShifter.scala 150:28]
    end else begin
      captureBits <= io_capture_bits; // @[JtagShifter.scala 152:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  regs_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  captureBits = _RAND_2[1:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    regs_0 = 1'h0;
  end
  if (reset) begin
    regs_1 = 1'h0;
  end
  if (reset) begin
    captureBits = 2'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module UpdateChain(
  input        clock,
  input        reset,
  input        io_chainIn_shift,
  input        io_chainIn_data,
  input        io_chainIn_capture,
  input        io_chainIn_update,
  output       io_chainOut_data,
  output       io_update_valid,
  output [1:0] io_update_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  regs_0; // @[JtagShifter.scala 196:43]
  reg  regs_1; // @[JtagShifter.scala 196:43]
  wire  _T_1 = ~(io_chainIn_capture & io_chainIn_update); // @[JtagShifter.scala 213:10]
  wire  _T_4 = _T_1 & ~(io_chainIn_capture & io_chainIn_shift); // @[JtagShifter.scala 214:7]
  wire  _T_7 = _T_4 & ~(io_chainIn_update & io_chainIn_shift); // @[JtagShifter.scala 215:7]
  assign io_chainOut_data = regs_0; // @[JtagShifter.scala 203:20]
  assign io_update_valid = io_chainIn_update; // @[JtagShifter.scala 204:28 205:21]
  assign io_update_bits = {regs_1,regs_0}; // @[Cat.scala 31:58]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & ~_T_7) begin
          $fatal; // @[JtagShifter.scala 213:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~_T_7) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at JtagShifter.scala:213 assert(!(io.chainIn.capture && io.chainIn.update)\n"); // @[JtagShifter.scala 213:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 204:28]
      regs_0 <= 1'h0; // @[JtagShifter.scala 196:43]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 206:34]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 196:43]
        regs_0 <= regs_1;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 204:28]
      regs_1 <= 1'h0; // @[JtagShifter.scala 196:43]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 206:34]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 196:43]
        regs_1 <= io_chainIn_data;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  regs_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    regs_0 = 1'h0;
  end
  if (reset) begin
    regs_1 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CaptureUpdateChain_1(
  input        clock,
  input        reset,
  input        io_chainIn_shift,
  input        io_chainIn_data,
  input        io_chainIn_capture,
  input        io_chainIn_update,
  output       io_chainOut_data,
  input  [1:0] io_capture_bits,
  output       io_update_valid,
  output [1:0] io_update_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  regs_0; // @[JtagShifter.scala 253:43]
  reg  regs_1; // @[JtagShifter.scala 253:43]
  reg [1:0] captureBits; // @[JtagShifter.scala 260:28]
  wire  _T_1 = ~(io_chainIn_capture & io_chainIn_update); // @[JtagShifter.scala 281:10]
  wire  _T_4 = _T_1 & ~(io_chainIn_capture & io_chainIn_shift); // @[JtagShifter.scala 282:7]
  wire  _T_7 = _T_4 & ~(io_chainIn_update & io_chainIn_shift); // @[JtagShifter.scala 283:7]
  assign io_chainOut_data = regs_0; // @[JtagShifter.scala 255:20]
  assign io_update_valid = io_chainIn_capture ? 1'h0 : io_chainIn_update; // @[JtagShifter.scala 264:29 268:21]
  assign io_update_bits = {regs_1,regs_0}; // @[Cat.scala 31:58]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & ~_T_7) begin
          $fatal; // @[JtagShifter.scala 281:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~_T_7) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at JtagShifter.scala:281 assert(!(io.chainIn.capture && io.chainIn.update)\n"); // @[JtagShifter.scala 281:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 264:29]
      regs_0 <= 1'h0; // @[JtagShifter.scala 265:59]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 269:35]
      regs_0 <= captureBits[0]; // @[JtagShifter.scala 253:43]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 272:34]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 253:43]
        regs_0 <= regs_1;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 264:29]
      regs_1 <= 1'h0; // @[JtagShifter.scala 265:59]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 269:35]
      regs_1 <= captureBits[1]; // @[JtagShifter.scala 253:43]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 272:34]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 253:43]
        regs_1 <= io_chainIn_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 260:28]
      captureBits <= 2'h0; // @[JtagShifter.scala 260:28]
    end else begin
      captureBits <= io_capture_bits; // @[JtagShifter.scala 262:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  regs_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  captureBits = _RAND_2[1:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    regs_0 = 1'h0;
  end
  if (reset) begin
    regs_1 = 1'h0;
  end
  if (reset) begin
    captureBits = 2'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CaptureChain_1(
  input   clock,
  input   reset,
  input   io_chainIn_shift,
  input   io_chainIn_data,
  input   io_chainIn_capture,
  input   io_chainIn_update,
  output  io_chainOut_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
`endif // RANDOMIZE_REG_INIT
  reg  regs_0; // @[JtagShifter.scala 149:43]
  reg  regs_1; // @[JtagShifter.scala 149:43]
  reg  regs_2; // @[JtagShifter.scala 149:43]
  reg  regs_3; // @[JtagShifter.scala 149:43]
  reg  regs_4; // @[JtagShifter.scala 149:43]
  reg  regs_5; // @[JtagShifter.scala 149:43]
  reg  regs_6; // @[JtagShifter.scala 149:43]
  reg  regs_7; // @[JtagShifter.scala 149:43]
  reg  regs_8; // @[JtagShifter.scala 149:43]
  reg  regs_9; // @[JtagShifter.scala 149:43]
  reg  regs_10; // @[JtagShifter.scala 149:43]
  reg  regs_11; // @[JtagShifter.scala 149:43]
  reg  regs_12; // @[JtagShifter.scala 149:43]
  reg  regs_13; // @[JtagShifter.scala 149:43]
  reg  regs_14; // @[JtagShifter.scala 149:43]
  reg  regs_15; // @[JtagShifter.scala 149:43]
  reg  regs_16; // @[JtagShifter.scala 149:43]
  reg  regs_17; // @[JtagShifter.scala 149:43]
  reg  regs_18; // @[JtagShifter.scala 149:43]
  reg  regs_19; // @[JtagShifter.scala 149:43]
  reg  regs_20; // @[JtagShifter.scala 149:43]
  reg  regs_21; // @[JtagShifter.scala 149:43]
  reg  regs_22; // @[JtagShifter.scala 149:43]
  reg  regs_23; // @[JtagShifter.scala 149:43]
  reg  regs_24; // @[JtagShifter.scala 149:43]
  reg  regs_25; // @[JtagShifter.scala 149:43]
  reg  regs_26; // @[JtagShifter.scala 149:43]
  reg  regs_27; // @[JtagShifter.scala 149:43]
  reg  regs_28; // @[JtagShifter.scala 149:43]
  reg  regs_29; // @[JtagShifter.scala 149:43]
  reg  regs_30; // @[JtagShifter.scala 149:43]
  reg  regs_31; // @[JtagShifter.scala 149:43]
  reg [31:0] captureBits; // @[JtagShifter.scala 150:28]
  wire  _T_1 = ~(io_chainIn_capture & io_chainIn_update); // @[JtagShifter.scala 164:10]
  wire  _T_4 = _T_1 & ~(io_chainIn_capture & io_chainIn_shift); // @[JtagShifter.scala 165:7]
  wire  _T_7 = _T_4 & ~(io_chainIn_update & io_chainIn_shift); // @[JtagShifter.scala 166:7]
  assign io_chainOut_data = regs_0; // @[JtagShifter.scala 153:20]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & ~_T_7) begin
          $fatal; // @[JtagShifter.scala 164:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~_T_7) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at JtagShifter.scala:164 assert(!(io.chainIn.capture && io.chainIn.update)\n"); // @[JtagShifter.scala 164:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_0 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_0 <= captureBits[0]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_0 <= regs_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_1 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_1 <= captureBits[1]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_1 <= regs_2;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_2 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_2 <= captureBits[2]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_2 <= regs_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_3 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_3 <= captureBits[3]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_3 <= regs_4;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_4 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_4 <= captureBits[4]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_4 <= regs_5;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_5 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_5 <= captureBits[5]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_5 <= regs_6;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_6 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_6 <= captureBits[6]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_6 <= regs_7;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_7 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_7 <= captureBits[7]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_7 <= regs_8;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_8 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_8 <= captureBits[8]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_8 <= regs_9;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_9 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_9 <= captureBits[9]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_9 <= regs_10;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_10 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_10 <= captureBits[10]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_10 <= regs_11;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_11 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_11 <= captureBits[11]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_11 <= regs_12;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_12 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_12 <= captureBits[12]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_12 <= regs_13;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_13 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_13 <= captureBits[13]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_13 <= regs_14;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_14 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_14 <= captureBits[14]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_14 <= regs_15;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_15 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_15 <= captureBits[15]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_15 <= regs_16;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_16 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_16 <= captureBits[16]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_16 <= regs_17;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_17 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_17 <= captureBits[17]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_17 <= regs_18;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_18 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_18 <= captureBits[18]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_18 <= regs_19;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_19 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_19 <= captureBits[19]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_19 <= regs_20;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_20 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_20 <= captureBits[20]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_20 <= regs_21;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_21 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_21 <= captureBits[21]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_21 <= regs_22;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_22 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_22 <= captureBits[22]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_22 <= regs_23;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_23 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_23 <= captureBits[23]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_23 <= regs_24;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_24 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_24 <= captureBits[24]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_24 <= regs_25;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_25 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_25 <= captureBits[25]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_25 <= regs_26;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_26 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_26 <= captureBits[26]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_26 <= regs_27;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_27 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_27 <= captureBits[27]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_27 <= regs_28;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_28 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_28 <= captureBits[28]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_28 <= regs_29;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_29 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_29 <= captureBits[29]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_29 <= regs_30;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_30 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_30 <= captureBits[30]; // @[JtagShifter.scala 159:37]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_30 <= regs_31;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 154:29]
      regs_31 <= 1'h0; // @[JtagShifter.scala 155:35]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 157:34]
      regs_31 <= captureBits[31]; // @[JtagShifter.scala 158:15]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 149:43]
      regs_31 <= io_chainIn_data;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 152:40]
      captureBits <= 32'h0;
    end else begin
      captureBits <= 32'h10001003;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  regs_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  regs_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  regs_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  regs_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  regs_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  regs_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  regs_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  regs_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  regs_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  regs_12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  regs_13 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  regs_14 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  regs_15 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  regs_16 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  regs_17 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  regs_18 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  regs_19 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  regs_20 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  regs_21 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  regs_22 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  regs_23 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  regs_24 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  regs_25 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  regs_26 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  regs_27 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  regs_28 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  regs_29 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  regs_30 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  regs_31 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  captureBits = _RAND_32[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    regs_0 = 1'h0;
  end
  if (reset) begin
    regs_1 = 1'h0;
  end
  if (reset) begin
    regs_2 = 1'h0;
  end
  if (reset) begin
    regs_3 = 1'h0;
  end
  if (reset) begin
    regs_4 = 1'h0;
  end
  if (reset) begin
    regs_5 = 1'h0;
  end
  if (reset) begin
    regs_6 = 1'h0;
  end
  if (reset) begin
    regs_7 = 1'h0;
  end
  if (reset) begin
    regs_8 = 1'h0;
  end
  if (reset) begin
    regs_9 = 1'h0;
  end
  if (reset) begin
    regs_10 = 1'h0;
  end
  if (reset) begin
    regs_11 = 1'h0;
  end
  if (reset) begin
    regs_12 = 1'h0;
  end
  if (reset) begin
    regs_13 = 1'h0;
  end
  if (reset) begin
    regs_14 = 1'h0;
  end
  if (reset) begin
    regs_15 = 1'h0;
  end
  if (reset) begin
    regs_16 = 1'h0;
  end
  if (reset) begin
    regs_17 = 1'h0;
  end
  if (reset) begin
    regs_18 = 1'h0;
  end
  if (reset) begin
    regs_19 = 1'h0;
  end
  if (reset) begin
    regs_20 = 1'h0;
  end
  if (reset) begin
    regs_21 = 1'h0;
  end
  if (reset) begin
    regs_22 = 1'h0;
  end
  if (reset) begin
    regs_23 = 1'h0;
  end
  if (reset) begin
    regs_24 = 1'h0;
  end
  if (reset) begin
    regs_25 = 1'h0;
  end
  if (reset) begin
    regs_26 = 1'h0;
  end
  if (reset) begin
    regs_27 = 1'h0;
  end
  if (reset) begin
    regs_28 = 1'h0;
  end
  if (reset) begin
    regs_29 = 1'h0;
  end
  if (reset) begin
    regs_30 = 1'h0;
  end
  if (reset) begin
    regs_31 = 1'h0;
  end
  if (reset) begin
    captureBits = 32'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module JtagStateMachine(
  input        clock,
  input        reset,
  input        io_tms,
  output [3:0] io_currState
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] currState; // @[JtagStateMachine.scala 97:26]
  wire [3:0] _nextState_T_1 = io_tms ? 4'h7 : 4'hc; // @[JtagStateMachine.scala 104:23]
  wire [3:0] _nextState_T_3 = io_tms ? 4'h1 : 4'h2; // @[JtagStateMachine.scala 110:23]
  wire [3:0] _nextState_T_5 = io_tms ? 4'h5 : 4'h3; // @[JtagStateMachine.scala 116:23]
  wire [3:0] _nextState_T_6 = io_tms ? 4'h0 : 4'h3; // @[JtagStateMachine.scala 119:23]
  wire [3:0] _nextState_T_7 = io_tms ? 4'h5 : 4'h2; // @[JtagStateMachine.scala 122:23]
  wire [3:0] _nextState_T_9 = io_tms ? 4'hf : 4'he; // @[JtagStateMachine.scala 128:23]
  wire [3:0] _nextState_T_10 = io_tms ? 4'h9 : 4'ha; // @[JtagStateMachine.scala 131:23]
  wire [3:0] _nextState_T_12 = io_tms ? 4'hd : 4'hb; // @[JtagStateMachine.scala 137:23]
  wire [3:0] _nextState_T_13 = io_tms ? 4'h8 : 4'hb; // @[JtagStateMachine.scala 140:23]
  wire [3:0] _nextState_T_14 = io_tms ? 4'hd : 4'ha; // @[JtagStateMachine.scala 143:23]
  wire [3:0] _GEN_0 = 4'hd == currState ? _nextState_T_1 : 4'hf; // @[JtagStateMachine.scala 146:17 99:22]
  wire [3:0] _GEN_1 = 4'h8 == currState ? _nextState_T_14 : _GEN_0; // @[JtagStateMachine.scala 143:17 99:22]
  wire [3:0] _GEN_2 = 4'hb == currState ? _nextState_T_13 : _GEN_1; // @[JtagStateMachine.scala 140:17 99:22]
  wire [3:0] _GEN_3 = 4'h9 == currState ? _nextState_T_12 : _GEN_2; // @[JtagStateMachine.scala 137:17 99:22]
  wire [3:0] _GEN_4 = 4'ha == currState ? _nextState_T_10 : _GEN_3; // @[JtagStateMachine.scala 134:17 99:22]
  wire [3:0] _GEN_5 = 4'he == currState ? _nextState_T_10 : _GEN_4; // @[JtagStateMachine.scala 131:17 99:22]
  wire [3:0] _GEN_6 = 4'h4 == currState ? _nextState_T_9 : _GEN_5; // @[JtagStateMachine.scala 128:17 99:22]
  wire [3:0] _GEN_7 = 4'h5 == currState ? _nextState_T_1 : _GEN_6; // @[JtagStateMachine.scala 125:17 99:22]
  wire [3:0] _GEN_8 = 4'h0 == currState ? _nextState_T_7 : _GEN_7; // @[JtagStateMachine.scala 122:17 99:22]
  wire [3:0] _GEN_9 = 4'h3 == currState ? _nextState_T_6 : _GEN_8; // @[JtagStateMachine.scala 119:17 99:22]
  wire [3:0] _GEN_10 = 4'h1 == currState ? _nextState_T_5 : _GEN_9; // @[JtagStateMachine.scala 116:17 99:22]
  wire [3:0] _GEN_11 = 4'h2 == currState ? _nextState_T_3 : _GEN_10; // @[JtagStateMachine.scala 113:17 99:22]
  assign io_currState = currState; // @[JtagStateMachine.scala 149:16]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagStateMachine.scala 99:22]
      currState <= 4'hf; // @[JtagStateMachine.scala 101:23]
    end else if (4'hf == currState) begin // @[JtagStateMachine.scala 99:22]
      if (io_tms) begin // @[JtagStateMachine.scala 104:23]
        currState <= 4'hf;
      end else begin
        currState <= 4'hc;
      end
    end else if (4'hc == currState) begin // @[JtagStateMachine.scala 99:22]
      if (io_tms) begin // @[JtagStateMachine.scala 107:23]
        currState <= 4'h7;
      end else begin
        currState <= 4'hc;
      end
    end else if (4'h7 == currState) begin // @[JtagStateMachine.scala 99:22]
      if (io_tms) begin // @[JtagStateMachine.scala 110:17]
        currState <= 4'h4;
      end else begin
        currState <= 4'h6;
      end
    end else if (4'h6 == currState) begin
      currState <= _nextState_T_3;
    end else begin
      currState <= _GEN_11;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  currState = _RAND_0[3:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    currState = 4'hf;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CaptureUpdateChain_2(
  input        clock,
  input        reset,
  input        io_chainIn_shift,
  input        io_chainIn_data,
  input        io_chainIn_capture,
  input        io_chainIn_update,
  output       io_chainOut_data,
  output [2:0] io_update_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg  regs_0; // @[JtagShifter.scala 253:43]
  reg  regs_1; // @[JtagShifter.scala 253:43]
  reg  regs_2; // @[JtagShifter.scala 253:43]
  wire [1:0] updateBits_hi = {regs_2,regs_1}; // @[Cat.scala 31:58]
  reg [2:0] captureBits; // @[JtagShifter.scala 260:28]
  wire  _T_1 = ~(io_chainIn_capture & io_chainIn_update); // @[JtagShifter.scala 281:10]
  wire  _T_4 = _T_1 & ~(io_chainIn_capture & io_chainIn_shift); // @[JtagShifter.scala 282:7]
  wire  _T_7 = _T_4 & ~(io_chainIn_update & io_chainIn_shift); // @[JtagShifter.scala 283:7]
  assign io_chainOut_data = regs_0; // @[JtagShifter.scala 255:20]
  assign io_update_bits = {updateBits_hi,regs_0}; // @[Cat.scala 31:58]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & ~_T_7) begin
          $fatal; // @[JtagShifter.scala 281:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~_T_7) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at JtagShifter.scala:281 assert(!(io.chainIn.capture && io.chainIn.update)\n"); // @[JtagShifter.scala 281:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 264:29]
      regs_0 <= 1'h0; // @[JtagShifter.scala 265:59]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 269:35]
      regs_0 <= captureBits[0]; // @[JtagShifter.scala 253:43]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 272:34]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 253:43]
        regs_0 <= regs_1;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 264:29]
      regs_1 <= 1'h0; // @[JtagShifter.scala 265:59]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 269:35]
      regs_1 <= captureBits[1]; // @[JtagShifter.scala 253:43]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 272:34]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 253:43]
        regs_1 <= regs_2;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 264:29]
      regs_2 <= 1'h0; // @[JtagShifter.scala 265:59]
    end else if (io_chainIn_capture) begin // @[JtagShifter.scala 269:35]
      regs_2 <= captureBits[2]; // @[JtagShifter.scala 253:43]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 272:34]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 253:43]
        regs_2 <= io_chainIn_data;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[JtagShifter.scala 260:28]
      captureBits <= 3'h0; // @[JtagShifter.scala 260:28]
    end else begin
      captureBits <= 3'h1; // @[JtagShifter.scala 262:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  regs_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  captureBits = _RAND_3[2:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    regs_0 = 1'h0;
  end
  if (reset) begin
    regs_1 = 1'h0;
  end
  if (reset) begin
    regs_2 = 1'h0;
  end
  if (reset) begin
    captureBits = 3'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module JtagTapController(
  input        clock,
  input        reset,
  input        io_tap_TCK,
  input        io_tap_TMS,
  input        io_tap_TDI,
  output       io_tap_TDO_data,
  output       io_tap_TDO_driven,
  output [3:0] io_output_state,
  output [2:0] io_output_instruction,
  output       io_output_tapIsInTestLogicReset,
  output       io_dataChainOut_shift,
  output       io_dataChainOut_data,
  output       io_dataChainOut_capture,
  output       io_dataChainOut_update,
  input        io_dataChainIn_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  stateMachine_clock; // @[JtagTap.scala 69:28]
  wire  stateMachine_reset; // @[JtagTap.scala 69:28]
  wire  stateMachine_io_tms; // @[JtagTap.scala 69:28]
  wire [3:0] stateMachine_io_currState; // @[JtagTap.scala 69:28]
  wire  irChain_clock; // @[JtagTap.scala 89:23]
  wire  irChain_reset; // @[JtagTap.scala 89:23]
  wire  irChain_io_chainIn_shift; // @[JtagTap.scala 89:23]
  wire  irChain_io_chainIn_data; // @[JtagTap.scala 89:23]
  wire  irChain_io_chainIn_capture; // @[JtagTap.scala 89:23]
  wire  irChain_io_chainIn_update; // @[JtagTap.scala 89:23]
  wire  irChain_io_chainOut_data; // @[JtagTap.scala 89:23]
  wire [2:0] irChain_io_update_bits; // @[JtagTap.scala 89:23]
  wire  clock_falling = ~io_tap_TCK; // @[JtagTap.scala 59:56]
  reg  tdoReg; // @[JtagTap.scala 77:28]
  reg  tdoeReg; // @[JtagTap.scala 78:28]
  wire [3:0] currState = stateMachine_io_currState; // @[JtagTap.scala 67:23 72:13]
  wire  _irChain_io_chainIn_shift_T = currState == 4'ha; // @[JtagTap.scala 91:41]
  wire  _irChain_io_chainIn_update_T = currState == 4'hd; // @[JtagTap.scala 94:42]
  reg [2:0] activeInstruction; // @[JtagTap.scala 98:36]
  wire  tapIsInTestLogicReset = currState == 4'hf; // @[JtagTap.scala 106:38]
  wire  _io_dataChainOut_shift_T = currState == 4'h2; // @[JtagTap.scala 113:38]
  wire  _GEN_2 = _irChain_io_chainIn_shift_T & irChain_io_chainOut_data; // @[JtagTap.scala 125:51 126:9 129:9]
  JtagStateMachine stateMachine ( // @[JtagTap.scala 69:28]
    .clock(stateMachine_clock),
    .reset(stateMachine_reset),
    .io_tms(stateMachine_io_tms),
    .io_currState(stateMachine_io_currState)
  );
  CaptureUpdateChain_2 irChain ( // @[JtagTap.scala 89:23]
    .clock(irChain_clock),
    .reset(irChain_reset),
    .io_chainIn_shift(irChain_io_chainIn_shift),
    .io_chainIn_data(irChain_io_chainIn_data),
    .io_chainIn_capture(irChain_io_chainIn_capture),
    .io_chainIn_update(irChain_io_chainIn_update),
    .io_chainOut_data(irChain_io_chainOut_data),
    .io_update_bits(irChain_io_update_bits)
  );
  assign io_tap_TDO_data = tdoReg; // @[JtagTap.scala 79:23]
  assign io_tap_TDO_driven = tdoeReg; // @[JtagTap.scala 80:23]
  assign io_output_state = stateMachine_io_currState; // @[JtagTap.scala 73:19]
  assign io_output_instruction = activeInstruction; // @[JtagTap.scala 104:27]
  assign io_output_tapIsInTestLogicReset = currState == 4'hf; // @[JtagTap.scala 106:38]
  assign io_dataChainOut_shift = currState == 4'h2; // @[JtagTap.scala 113:38]
  assign io_dataChainOut_data = io_tap_TDI; // @[JtagTap.scala 114:24]
  assign io_dataChainOut_capture = currState == 4'h6; // @[JtagTap.scala 115:40]
  assign io_dataChainOut_update = currState == 4'h5; // @[JtagTap.scala 116:39]
  assign stateMachine_clock = clock;
  assign stateMachine_reset = reset;
  assign stateMachine_io_tms = io_tap_TMS; // @[JtagTap.scala 71:23]
  assign irChain_clock = clock;
  assign irChain_reset = reset;
  assign irChain_io_chainIn_shift = currState == 4'ha; // @[JtagTap.scala 91:41]
  assign irChain_io_chainIn_data = io_tap_TDI; // @[JtagTap.scala 92:27]
  assign irChain_io_chainIn_capture = currState == 4'he; // @[JtagTap.scala 93:43]
  assign irChain_io_chainIn_update = currState == 4'hd; // @[JtagTap.scala 94:42]
  always @(posedge clock_falling or posedge reset) begin
    if (reset) begin // @[JtagTap.scala 122:44]
      tdoReg <= 1'h0; // @[JtagTap.scala 123:9]
    end else if (_io_dataChainOut_shift_T) begin
      tdoReg <= io_dataChainIn_data;
    end else begin
      tdoReg <= _GEN_2;
    end
  end
  always @(posedge clock_falling or posedge reset) begin
    if (reset) begin // @[JtagTap.scala 122:44]
      tdoeReg <= 1'h0; // @[JtagTap.scala 124:16]
    end else begin
      tdoeReg <= _io_dataChainOut_shift_T | _irChain_io_chainIn_shift_T;
    end
  end
  always @(posedge clock_falling or posedge reset) begin
    if (reset) begin // @[JtagTap.scala 99:34]
      activeInstruction <= 3'h0; // @[JtagTap.scala 100:25]
    end else if (tapIsInTestLogicReset) begin // @[JtagTap.scala 101:53]
      activeInstruction <= 3'h0; // @[JtagTap.scala 102:25]
    end else if (_irChain_io_chainIn_update_T) begin // @[JtagTap.scala 98:36]
      activeInstruction <= irChain_io_update_bits;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  tdoReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  tdoeReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  activeInstruction = _RAND_2[2:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    tdoReg = 1'h0;
  end
  if (reset) begin
    tdoeReg = 1'h0;
  end
  if (reset) begin
    activeInstruction = 3'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module JtagBypassChain(
  input   clock,
  input   reset,
  input   io_chainIn_shift,
  input   io_chainIn_data,
  input   io_chainIn_capture,
  input   io_chainIn_update,
  output  io_chainOut_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  reg_; // @[JtagShifter.scala 69:16]
  wire  _T_1 = ~(io_chainIn_capture & io_chainIn_update); // @[JtagShifter.scala 78:10]
  wire  _T_4 = _T_1 & ~(io_chainIn_capture & io_chainIn_shift); // @[JtagShifter.scala 79:7]
  wire  _T_7 = _T_4 & ~(io_chainIn_update & io_chainIn_shift); // @[JtagShifter.scala 80:7]
  assign io_chainOut_data = reg_; // @[JtagShifter.scala 71:20]
  always @(posedge clock) begin
    if (io_chainIn_capture) begin // @[JtagShifter.scala 73:29]
      reg_ <= 1'h0; // @[JtagShifter.scala 74:9]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 75:34]
      reg_ <= io_chainIn_data; // @[JtagShifter.scala 76:9]
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & ~_T_7) begin
          $fatal; // @[JtagShifter.scala 78:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~_T_7) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at JtagShifter.scala:78 assert(!(io.chainIn.capture && io.chainIn.update)\n"); // @[JtagShifter.scala 78:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module generated_jtag(
  input        tapio_TCK,
  input        tapio_TMS,
  input        tapio_TDI,
  input        tapio_TRSTn,
  output       tapio_TDO_data,
  output       tapio_TDO_driven,
  input  [1:0] tdrio_in_4,
  input  [1:0] tdrio_in_2,
  input  [7:0] tdrio_in_1,
  output [1:0] tdrio_out_4,
  output [1:0] tdrio_out_3,
  output [7:0] tdrio_out_1,
  output [3:0] io_state,
  output [2:0] io_instruction,
  output       io_tapIsInTestLogicReset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  TDRChain_clock; // @[JTAG.scala 83:30]
  wire  TDRChain_reset; // @[JTAG.scala 83:30]
  wire  TDRChain_io_chainIn_shift; // @[JTAG.scala 83:30]
  wire  TDRChain_io_chainIn_data; // @[JTAG.scala 83:30]
  wire  TDRChain_io_chainIn_capture; // @[JTAG.scala 83:30]
  wire  TDRChain_io_chainIn_update; // @[JTAG.scala 83:30]
  wire  TDRChain_io_chainOut_data; // @[JTAG.scala 83:30]
  wire [7:0] TDRChain_io_capture_bits; // @[JTAG.scala 83:30]
  wire  TDRChain_io_update_valid; // @[JTAG.scala 83:30]
  wire [7:0] TDRChain_io_update_bits; // @[JTAG.scala 83:30]
  wire  TDRChain_1_clock; // @[JTAG.scala 92:30]
  wire  TDRChain_1_reset; // @[JTAG.scala 92:30]
  wire  TDRChain_1_io_chainIn_shift; // @[JTAG.scala 92:30]
  wire  TDRChain_1_io_chainIn_data; // @[JTAG.scala 92:30]
  wire  TDRChain_1_io_chainIn_capture; // @[JTAG.scala 92:30]
  wire  TDRChain_1_io_chainIn_update; // @[JTAG.scala 92:30]
  wire  TDRChain_1_io_chainOut_data; // @[JTAG.scala 92:30]
  wire [1:0] TDRChain_1_io_capture_bits; // @[JTAG.scala 92:30]
  wire  TDRChain_2_clock; // @[JTAG.scala 98:30]
  wire  TDRChain_2_reset; // @[JTAG.scala 98:30]
  wire  TDRChain_2_io_chainIn_shift; // @[JTAG.scala 98:30]
  wire  TDRChain_2_io_chainIn_data; // @[JTAG.scala 98:30]
  wire  TDRChain_2_io_chainIn_capture; // @[JTAG.scala 98:30]
  wire  TDRChain_2_io_chainIn_update; // @[JTAG.scala 98:30]
  wire  TDRChain_2_io_chainOut_data; // @[JTAG.scala 98:30]
  wire  TDRChain_2_io_update_valid; // @[JTAG.scala 98:30]
  wire [1:0] TDRChain_2_io_update_bits; // @[JTAG.scala 98:30]
  wire  TDRChain_3_clock; // @[JTAG.scala 83:30]
  wire  TDRChain_3_reset; // @[JTAG.scala 83:30]
  wire  TDRChain_3_io_chainIn_shift; // @[JTAG.scala 83:30]
  wire  TDRChain_3_io_chainIn_data; // @[JTAG.scala 83:30]
  wire  TDRChain_3_io_chainIn_capture; // @[JTAG.scala 83:30]
  wire  TDRChain_3_io_chainIn_update; // @[JTAG.scala 83:30]
  wire  TDRChain_3_io_chainOut_data; // @[JTAG.scala 83:30]
  wire [1:0] TDRChain_3_io_capture_bits; // @[JTAG.scala 83:30]
  wire  TDRChain_3_io_update_valid; // @[JTAG.scala 83:30]
  wire [1:0] TDRChain_3_io_update_bits; // @[JTAG.scala 83:30]
  wire  TAP_idcodeChain_clock; // @[JtagTap.scala 166:33]
  wire  TAP_idcodeChain_reset; // @[JtagTap.scala 166:33]
  wire  TAP_idcodeChain_io_chainIn_shift; // @[JtagTap.scala 166:33]
  wire  TAP_idcodeChain_io_chainIn_data; // @[JtagTap.scala 166:33]
  wire  TAP_idcodeChain_io_chainIn_capture; // @[JtagTap.scala 166:33]
  wire  TAP_idcodeChain_io_chainIn_update; // @[JtagTap.scala 166:33]
  wire  TAP_idcodeChain_io_chainOut_data; // @[JtagTap.scala 166:33]
  wire  TAP_controllerInternal_clock; // @[JtagTap.scala 183:36]
  wire  TAP_controllerInternal_reset; // @[JtagTap.scala 183:36]
  wire  TAP_controllerInternal_io_tap_TCK; // @[JtagTap.scala 183:36]
  wire  TAP_controllerInternal_io_tap_TMS; // @[JtagTap.scala 183:36]
  wire  TAP_controllerInternal_io_tap_TDI; // @[JtagTap.scala 183:36]
  wire  TAP_controllerInternal_io_tap_TDO_data; // @[JtagTap.scala 183:36]
  wire  TAP_controllerInternal_io_tap_TDO_driven; // @[JtagTap.scala 183:36]
  wire [3:0] TAP_controllerInternal_io_output_state; // @[JtagTap.scala 183:36]
  wire [2:0] TAP_controllerInternal_io_output_instruction; // @[JtagTap.scala 183:36]
  wire  TAP_controllerInternal_io_output_tapIsInTestLogicReset; // @[JtagTap.scala 183:36]
  wire  TAP_controllerInternal_io_dataChainOut_shift; // @[JtagTap.scala 183:36]
  wire  TAP_controllerInternal_io_dataChainOut_data; // @[JtagTap.scala 183:36]
  wire  TAP_controllerInternal_io_dataChainOut_capture; // @[JtagTap.scala 183:36]
  wire  TAP_controllerInternal_io_dataChainOut_update; // @[JtagTap.scala 183:36]
  wire  TAP_controllerInternal_io_dataChainIn_data; // @[JtagTap.scala 183:36]
  wire  TAP_bypassChain_clock; // @[JtagTap.scala 191:29]
  wire  TAP_bypassChain_reset; // @[JtagTap.scala 191:29]
  wire  TAP_bypassChain_io_chainIn_shift; // @[JtagTap.scala 191:29]
  wire  TAP_bypassChain_io_chainIn_data; // @[JtagTap.scala 191:29]
  wire  TAP_bypassChain_io_chainIn_capture; // @[JtagTap.scala 191:29]
  wire  TAP_bypassChain_io_chainIn_update; // @[JtagTap.scala 191:29]
  wire  TAP_bypassChain_io_chainOut_data; // @[JtagTap.scala 191:29]
  wire  TCK_falling = ~tapio_TCK; // @[JTAG.scala 74:53]
  reg [7:0] TDRreg; // @[Reg.scala 28:20]
  reg [1:0] TDRreg_1; // @[Reg.scala 28:20]
  reg [1:0] TDRreg_2; // @[Reg.scala 28:20]
  wire [11:0] _TAP_T_3 = 12'h800 - 12'h1; // @[JtagTap.scala 169:41]
  wire [30:0] _GEN_47 = {{19'd0}, _TAP_T_3}; // @[JtagTap.scala 169:26]
  wire [30:0] _TAP_T_4 = 31'h8000801 & _GEN_47; // @[JtagTap.scala 169:26]
  wire  TAP_icodeSelects_0 = TAP_controllerInternal_io_output_instruction == 3'h0; // @[JtagTap.scala 207:82]
  wire  TAP_icodeSelects_0_1 = TAP_controllerInternal_io_output_instruction == 3'h1; // @[JtagTap.scala 207:82]
  wire  TAP_icodeSelects_0_2 = TAP_controllerInternal_io_output_instruction == 3'h2; // @[JtagTap.scala 207:82]
  wire  TAP_icodeSelects_0_3 = TAP_controllerInternal_io_output_instruction == 3'h3; // @[JtagTap.scala 207:82]
  wire  TAP_icodeSelects_0_4 = TAP_controllerInternal_io_output_instruction == 3'h4; // @[JtagTap.scala 207:82]
  wire  _GEN_5 = TAP_icodeSelects_0_4 ? TDRChain_3_io_chainOut_data : TAP_bypassChain_io_chainOut_data; // @[JtagTap.scala 217:28 218:43 224:41]
  wire  _GEN_9 = TAP_icodeSelects_0_3 ? TDRChain_2_io_chainOut_data : _GEN_5; // @[JtagTap.scala 217:28 218:43]
  wire  _GEN_13 = TAP_icodeSelects_0_2 ? TDRChain_1_io_chainOut_data : _GEN_9; // @[JtagTap.scala 217:28 218:43]
  wire  _GEN_17 = TAP_icodeSelects_0_1 ? TDRChain_io_chainOut_data : _GEN_13; // @[JtagTap.scala 217:28 218:43]
  CaptureUpdateChain TDRChain ( // @[JTAG.scala 83:30]
    .clock(TDRChain_clock),
    .reset(TDRChain_reset),
    .io_chainIn_shift(TDRChain_io_chainIn_shift),
    .io_chainIn_data(TDRChain_io_chainIn_data),
    .io_chainIn_capture(TDRChain_io_chainIn_capture),
    .io_chainIn_update(TDRChain_io_chainIn_update),
    .io_chainOut_data(TDRChain_io_chainOut_data),
    .io_capture_bits(TDRChain_io_capture_bits),
    .io_update_valid(TDRChain_io_update_valid),
    .io_update_bits(TDRChain_io_update_bits)
  );
  CaptureChain TDRChain_1 ( // @[JTAG.scala 92:30]
    .clock(TDRChain_1_clock),
    .reset(TDRChain_1_reset),
    .io_chainIn_shift(TDRChain_1_io_chainIn_shift),
    .io_chainIn_data(TDRChain_1_io_chainIn_data),
    .io_chainIn_capture(TDRChain_1_io_chainIn_capture),
    .io_chainIn_update(TDRChain_1_io_chainIn_update),
    .io_chainOut_data(TDRChain_1_io_chainOut_data),
    .io_capture_bits(TDRChain_1_io_capture_bits)
  );
  UpdateChain TDRChain_2 ( // @[JTAG.scala 98:30]
    .clock(TDRChain_2_clock),
    .reset(TDRChain_2_reset),
    .io_chainIn_shift(TDRChain_2_io_chainIn_shift),
    .io_chainIn_data(TDRChain_2_io_chainIn_data),
    .io_chainIn_capture(TDRChain_2_io_chainIn_capture),
    .io_chainIn_update(TDRChain_2_io_chainIn_update),
    .io_chainOut_data(TDRChain_2_io_chainOut_data),
    .io_update_valid(TDRChain_2_io_update_valid),
    .io_update_bits(TDRChain_2_io_update_bits)
  );
  CaptureUpdateChain_1 TDRChain_3 ( // @[JTAG.scala 83:30]
    .clock(TDRChain_3_clock),
    .reset(TDRChain_3_reset),
    .io_chainIn_shift(TDRChain_3_io_chainIn_shift),
    .io_chainIn_data(TDRChain_3_io_chainIn_data),
    .io_chainIn_capture(TDRChain_3_io_chainIn_capture),
    .io_chainIn_update(TDRChain_3_io_chainIn_update),
    .io_chainOut_data(TDRChain_3_io_chainOut_data),
    .io_capture_bits(TDRChain_3_io_capture_bits),
    .io_update_valid(TDRChain_3_io_update_valid),
    .io_update_bits(TDRChain_3_io_update_bits)
  );
  CaptureChain_1 TAP_idcodeChain ( // @[JtagTap.scala 166:33]
    .clock(TAP_idcodeChain_clock),
    .reset(TAP_idcodeChain_reset),
    .io_chainIn_shift(TAP_idcodeChain_io_chainIn_shift),
    .io_chainIn_data(TAP_idcodeChain_io_chainIn_data),
    .io_chainIn_capture(TAP_idcodeChain_io_chainIn_capture),
    .io_chainIn_update(TAP_idcodeChain_io_chainIn_update),
    .io_chainOut_data(TAP_idcodeChain_io_chainOut_data)
  );
  JtagTapController TAP_controllerInternal ( // @[JtagTap.scala 183:36]
    .clock(TAP_controllerInternal_clock),
    .reset(TAP_controllerInternal_reset),
    .io_tap_TCK(TAP_controllerInternal_io_tap_TCK),
    .io_tap_TMS(TAP_controllerInternal_io_tap_TMS),
    .io_tap_TDI(TAP_controllerInternal_io_tap_TDI),
    .io_tap_TDO_data(TAP_controllerInternal_io_tap_TDO_data),
    .io_tap_TDO_driven(TAP_controllerInternal_io_tap_TDO_driven),
    .io_output_state(TAP_controllerInternal_io_output_state),
    .io_output_instruction(TAP_controllerInternal_io_output_instruction),
    .io_output_tapIsInTestLogicReset(TAP_controllerInternal_io_output_tapIsInTestLogicReset),
    .io_dataChainOut_shift(TAP_controllerInternal_io_dataChainOut_shift),
    .io_dataChainOut_data(TAP_controllerInternal_io_dataChainOut_data),
    .io_dataChainOut_capture(TAP_controllerInternal_io_dataChainOut_capture),
    .io_dataChainOut_update(TAP_controllerInternal_io_dataChainOut_update),
    .io_dataChainIn_data(TAP_controllerInternal_io_dataChainIn_data)
  );
  JtagBypassChain TAP_bypassChain ( // @[JtagTap.scala 191:29]
    .clock(TAP_bypassChain_clock),
    .reset(TAP_bypassChain_reset),
    .io_chainIn_shift(TAP_bypassChain_io_chainIn_shift),
    .io_chainIn_data(TAP_bypassChain_io_chainIn_data),
    .io_chainIn_capture(TAP_bypassChain_io_chainIn_capture),
    .io_chainIn_update(TAP_bypassChain_io_chainIn_update),
    .io_chainOut_data(TAP_bypassChain_io_chainOut_data)
  );
  assign tapio_TDO_data = TAP_controllerInternal_io_tap_TDO_data; // @[JtagTap.scala 160:26 238:20]
  assign tapio_TDO_driven = TAP_controllerInternal_io_tap_TDO_driven; // @[JtagTap.scala 160:26 238:20]
  assign tdrio_out_4 = TDRreg_2; // @[JTAG.scala 86:28]
  assign tdrio_out_3 = TDRreg_1; // @[JTAG.scala 101:28]
  assign tdrio_out_1 = TDRreg; // @[JTAG.scala 86:28]
  assign io_state = TAP_controllerInternal_io_output_state; // @[JtagTap.scala 160:26 239:23]
  assign io_instruction = TAP_controllerInternal_io_output_instruction; // @[JtagTap.scala 160:26 239:23]
  assign io_tapIsInTestLogicReset = TAP_controllerInternal_io_output_tapIsInTestLogicReset; // @[JtagTap.scala 160:26 239:23]
  assign TDRChain_clock = tapio_TCK;
  assign TDRChain_reset = tapio_TRSTn;
  assign TDRChain_io_chainIn_shift = TAP_icodeSelects_0_1 & TAP_controllerInternal_io_dataChainOut_shift; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TDRChain_io_chainIn_data = TAP_icodeSelects_0_1 & TAP_controllerInternal_io_dataChainOut_data; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TDRChain_io_chainIn_capture = TAP_icodeSelects_0_1 & TAP_controllerInternal_io_dataChainOut_capture; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TDRChain_io_chainIn_update = TAP_icodeSelects_0_1 & TAP_controllerInternal_io_dataChainOut_update; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TDRChain_io_capture_bits = tdrio_in_1; // @[JTAG.scala 88:34]
  assign TDRChain_1_clock = tapio_TCK;
  assign TDRChain_1_reset = tapio_TRSTn;
  assign TDRChain_1_io_chainIn_shift = TAP_icodeSelects_0_2 & TAP_controllerInternal_io_dataChainOut_shift; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TDRChain_1_io_chainIn_data = TAP_icodeSelects_0_2 & TAP_controllerInternal_io_dataChainOut_data; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TDRChain_1_io_chainIn_capture = TAP_icodeSelects_0_2 & TAP_controllerInternal_io_dataChainOut_capture; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TDRChain_1_io_chainIn_update = TAP_icodeSelects_0_2 & TAP_controllerInternal_io_dataChainOut_update; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TDRChain_1_io_capture_bits = tdrio_in_2; // @[JTAG.scala 93:34]
  assign TDRChain_2_clock = tapio_TCK;
  assign TDRChain_2_reset = tapio_TRSTn;
  assign TDRChain_2_io_chainIn_shift = TAP_icodeSelects_0_3 & TAP_controllerInternal_io_dataChainOut_shift; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TDRChain_2_io_chainIn_data = TAP_icodeSelects_0_3 & TAP_controllerInternal_io_dataChainOut_data; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TDRChain_2_io_chainIn_capture = TAP_icodeSelects_0_3 & TAP_controllerInternal_io_dataChainOut_capture; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TDRChain_2_io_chainIn_update = TAP_icodeSelects_0_3 & TAP_controllerInternal_io_dataChainOut_update; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TDRChain_3_clock = tapio_TCK;
  assign TDRChain_3_reset = tapio_TRSTn;
  assign TDRChain_3_io_chainIn_shift = TAP_icodeSelects_0_4 & TAP_controllerInternal_io_dataChainOut_shift; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TDRChain_3_io_chainIn_data = TAP_icodeSelects_0_4 & TAP_controllerInternal_io_dataChainOut_data; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TDRChain_3_io_chainIn_capture = TAP_icodeSelects_0_4 & TAP_controllerInternal_io_dataChainOut_capture; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TDRChain_3_io_chainIn_update = TAP_icodeSelects_0_4 & TAP_controllerInternal_io_dataChainOut_update; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TDRChain_3_io_capture_bits = tdrio_in_4; // @[JTAG.scala 88:34]
  assign TAP_idcodeChain_clock = tapio_TCK;
  assign TAP_idcodeChain_reset = tapio_TRSTn;
  assign TAP_idcodeChain_io_chainIn_shift = TAP_icodeSelects_0 & TAP_controllerInternal_io_dataChainOut_shift; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TAP_idcodeChain_io_chainIn_data = TAP_icodeSelects_0 & TAP_controllerInternal_io_dataChainOut_data; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TAP_idcodeChain_io_chainIn_capture = TAP_icodeSelects_0 & TAP_controllerInternal_io_dataChainOut_capture; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TAP_idcodeChain_io_chainIn_update = TAP_icodeSelects_0 & TAP_controllerInternal_io_dataChainOut_update; // @[JtagTap.scala 229:21 230:26 232:26]
  assign TAP_controllerInternal_clock = tapio_TCK;
  assign TAP_controllerInternal_reset = tapio_TRSTn;
  assign TAP_controllerInternal_io_tap_TCK = tapio_TCK; // @[JTAG.scala 142:11 JtagTap.scala 160:26]
  assign TAP_controllerInternal_io_tap_TMS = tapio_TMS; // @[JTAG.scala 142:11 JtagTap.scala 160:26]
  assign TAP_controllerInternal_io_tap_TDI = tapio_TDI; // @[JTAG.scala 142:11 JtagTap.scala 160:26]
  assign TAP_controllerInternal_io_dataChainIn_data = TAP_icodeSelects_0 ? TAP_idcodeChain_io_chainOut_data : _GEN_17; // @[JtagTap.scala 217:28 218:43]
  assign TAP_bypassChain_clock = tapio_TCK;
  assign TAP_bypassChain_reset = tapio_TRSTn;
  assign TAP_bypassChain_io_chainIn_shift = TAP_controllerInternal_io_dataChainOut_shift; // @[JtagTap.scala 194:28]
  assign TAP_bypassChain_io_chainIn_data = TAP_controllerInternal_io_dataChainOut_data; // @[JtagTap.scala 194:28]
  assign TAP_bypassChain_io_chainIn_capture = TAP_controllerInternal_io_dataChainOut_capture; // @[JtagTap.scala 194:28]
  assign TAP_bypassChain_io_chainIn_update = TAP_controllerInternal_io_dataChainOut_update; // @[JtagTap.scala 194:28]
  always @(posedge tapio_TCK) begin
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~tapio_TRSTn & ~(_TAP_T_4 != 31'h7f)) begin
          $fatal; // @[JtagTap.scala 169:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~tapio_TRSTn & ~(_TAP_T_4 != 31'h7f)) begin
          $fwrite(32'h80000002,
            "Assertion failed: IDCODE must not have 0b00001111111 as manufacturer identity, see 12.2.1b\n    at JtagTap.scala:169 assert(((i >> 1) & ((1.U << 11) - 1.U)) =/= JtagIdcode.dummyMfrId.U,\n"
            ); // @[JtagTap.scala 169:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge TCK_falling or posedge tapio_TRSTn) begin
    if (tapio_TRSTn) begin // @[Reg.scala 29:18]
      TDRreg <= 8'h0; // @[Reg.scala 29:22]
    end else if (TDRChain_io_update_valid) begin // @[Reg.scala 28:20]
      TDRreg <= TDRChain_io_update_bits;
    end
  end
  always @(posedge TCK_falling or posedge tapio_TRSTn) begin
    if (tapio_TRSTn) begin // @[Reg.scala 29:18]
      TDRreg_1 <= 2'h0; // @[Reg.scala 29:22]
    end else if (TDRChain_2_io_update_valid) begin // @[Reg.scala 28:20]
      TDRreg_1 <= TDRChain_2_io_update_bits;
    end
  end
  always @(posedge TCK_falling or posedge tapio_TRSTn) begin
    if (tapio_TRSTn) begin // @[Reg.scala 29:18]
      TDRreg_2 <= 2'h0; // @[Reg.scala 29:22]
    end else if (TDRChain_3_io_update_valid) begin // @[Reg.scala 28:20]
      TDRreg_2 <= TDRChain_3_io_update_bits;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  TDRreg = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  TDRreg_1 = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  TDRreg_2 = _RAND_2[1:0];
`endif // RANDOMIZE_REG_INIT
  if (tapio_TRSTn) begin
    TDRreg = 8'h0;
  end
  if (tapio_TRSTn) begin
    TDRreg_1 = 2'h0;
  end
  if (tapio_TRSTn) begin
    TDRreg_2 = 2'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
