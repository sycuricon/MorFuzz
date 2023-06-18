module Queue_12_tb(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [63:0] io_enq_bits_data,
  input  [7:0]  io_enq_bits_strb,
  input         io_enq_bits_last,
  input         io_deq_ready,
  output        io_deq_valid,
  output [63:0] io_deq_bits_data,
  output [7:0]  io_deq_bits_strb,
  output        io_deq_bits_last
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram_data [0:0]; // @[Decoupled.scala 259:95]
  wire  ram_data_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_data_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [63:0] ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [63:0] ram_data_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_data_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_data_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_data_MPORT_en; // @[Decoupled.scala 259:95]
  reg [7:0] ram_strb [0:0]; // @[Decoupled.scala 259:95]
  wire  ram_strb_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_strb_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [7:0] ram_strb_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [7:0] ram_strb_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_strb_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_strb_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_strb_MPORT_en; // @[Decoupled.scala 259:95]
  reg  ram_last [0:0]; // @[Decoupled.scala 259:95]
  wire  ram_last_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_last_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_last_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_last_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_last_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_last_MPORT_en; // @[Decoupled.scala 259:95]
  reg  maybe_full; // @[Decoupled.scala 262:27]
  wire  empty = ~maybe_full; // @[Decoupled.scala 264:28]
  wire  _do_enq_T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 50:35]
  wire  _do_deq_T = io_deq_ready & io_deq_valid; // @[Decoupled.scala 50:35]
  wire  _GEN_11 = io_deq_ready ? 1'h0 : _do_enq_T; // @[Decoupled.scala 304:{26,35}]
  wire  do_enq = empty ? _GEN_11 : _do_enq_T; // @[Decoupled.scala 301:17]
  wire  do_deq = empty ? 1'h0 : _do_deq_T; // @[Decoupled.scala 301:17 303:14]
  assign ram_data_io_deq_bits_MPORT_en = 1'h1;
  assign ram_data_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = 1'h0;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = empty ? _GEN_11 : _do_enq_T;
  assign ram_strb_io_deq_bits_MPORT_en = 1'h1;
  assign ram_strb_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_strb_io_deq_bits_MPORT_data = ram_strb[ram_strb_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_strb_MPORT_data = io_enq_bits_strb;
  assign ram_strb_MPORT_addr = 1'h0;
  assign ram_strb_MPORT_mask = 1'h1;
  assign ram_strb_MPORT_en = empty ? _GEN_11 : _do_enq_T;
  assign ram_last_io_deq_bits_MPORT_en = 1'h1;
  assign ram_last_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_last_io_deq_bits_MPORT_data = ram_last[ram_last_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_last_MPORT_data = io_enq_bits_last;
  assign ram_last_MPORT_addr = 1'h0;
  assign ram_last_MPORT_mask = 1'h1;
  assign ram_last_MPORT_en = empty ? _GEN_11 : _do_enq_T;
  assign io_enq_ready = ~maybe_full; // @[Decoupled.scala 289:19]
  assign io_deq_valid = io_enq_valid | ~empty; // @[Decoupled.scala 288:16 300:{24,39}]
  assign io_deq_bits_data = empty ? io_enq_bits_data : ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17 301:17 302:19]
  assign io_deq_bits_strb = empty ? io_enq_bits_strb : ram_strb_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17 301:17 302:19]
  assign io_deq_bits_last = empty ? io_enq_bits_last : ram_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17 301:17 302:19]
  always @(posedge clock) begin
    if (ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_strb_MPORT_en & ram_strb_MPORT_mask) begin
      ram_strb[ram_strb_MPORT_addr] <= ram_strb_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_last_MPORT_en & ram_last_MPORT_mask) begin
      ram_last[ram_last_MPORT_addr] <= ram_last_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (reset) begin // @[Decoupled.scala 262:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 262:27]
    end else if (do_enq != do_deq) begin
      if (empty) begin
        if (io_deq_ready) begin
          maybe_full <= 1'h0;
        end else begin
          maybe_full <= _do_enq_T;
        end
      end else begin
        maybe_full <= _do_enq_T;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_data[initvar] = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_strb[initvar] = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_last[initvar] = _RAND_2[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AXI4RAM_tb(
  input         clock,
  input         reset,
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input  [3:0]  auto_in_aw_bits_id,
  input  [31:0] auto_in_aw_bits_addr,
  input         auto_in_aw_bits_echo_real_last,
  output        auto_in_w_ready,
  input         auto_in_w_valid,
  input  [63:0] auto_in_w_bits_data,
  input  [7:0]  auto_in_w_bits_strb,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output [3:0]  auto_in_b_bits_id,
  output [1:0]  auto_in_b_bits_resp,
  output        auto_in_b_bits_echo_real_last,
  output        auto_in_ar_ready,
  input         auto_in_ar_valid,
  input  [3:0]  auto_in_ar_bits_id,
  input  [31:0] auto_in_ar_bits_addr,
  input         auto_in_ar_bits_echo_real_last,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output [3:0]  auto_in_r_bits_id,
  output [63:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output        auto_in_r_bits_echo_real_last
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
`endif // RANDOMIZE_REG_INIT
  wire [27:0] mem_R0_addr; // @[DescribedSRAM.scala 19:26]
  wire  mem_R0_en; // @[DescribedSRAM.scala 19:26]
  wire  mem_R0_clk; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_R0_data_0; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_R0_data_1; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_R0_data_2; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_R0_data_3; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_R0_data_4; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_R0_data_5; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_R0_data_6; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_R0_data_7; // @[DescribedSRAM.scala 19:26]
  wire [27:0] mem_W0_addr; // @[DescribedSRAM.scala 19:26]
  wire  mem_W0_en; // @[DescribedSRAM.scala 19:26]
  wire  mem_W0_clk; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_W0_data_0; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_W0_data_1; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_W0_data_2; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_W0_data_3; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_W0_data_4; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_W0_data_5; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_W0_data_6; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_W0_data_7; // @[DescribedSRAM.scala 19:26]
  wire  mem_W0_mask_0; // @[DescribedSRAM.scala 19:26]
  wire  mem_W0_mask_1; // @[DescribedSRAM.scala 19:26]
  wire  mem_W0_mask_2; // @[DescribedSRAM.scala 19:26]
  wire  mem_W0_mask_3; // @[DescribedSRAM.scala 19:26]
  wire  mem_W0_mask_4; // @[DescribedSRAM.scala 19:26]
  wire  mem_W0_mask_5; // @[DescribedSRAM.scala 19:26]
  wire  mem_W0_mask_6; // @[DescribedSRAM.scala 19:26]
  wire  mem_W0_mask_7; // @[DescribedSRAM.scala 19:26]
  wire [6:0] r_addr_lo_lo = {auto_in_ar_bits_addr[9],auto_in_ar_bits_addr[8],auto_in_ar_bits_addr[7],
    auto_in_ar_bits_addr[6],auto_in_ar_bits_addr[5],auto_in_ar_bits_addr[4],auto_in_ar_bits_addr[3]}; // @[Cat.scala 31:58]
  wire [13:0] r_addr_lo = {auto_in_ar_bits_addr[16],auto_in_ar_bits_addr[15],auto_in_ar_bits_addr[14],
    auto_in_ar_bits_addr[13],auto_in_ar_bits_addr[12],auto_in_ar_bits_addr[11],auto_in_ar_bits_addr[10],r_addr_lo_lo}; // @[Cat.scala 31:58]
  wire [6:0] r_addr_hi_lo = {auto_in_ar_bits_addr[23],auto_in_ar_bits_addr[22],auto_in_ar_bits_addr[21],
    auto_in_ar_bits_addr[20],auto_in_ar_bits_addr[19],auto_in_ar_bits_addr[18],auto_in_ar_bits_addr[17]}; // @[Cat.scala 31:58]
  wire [13:0] r_addr_hi = {auto_in_ar_bits_addr[30],auto_in_ar_bits_addr[29],auto_in_ar_bits_addr[28],
    auto_in_ar_bits_addr[27],auto_in_ar_bits_addr[26],auto_in_ar_bits_addr[25],auto_in_ar_bits_addr[24],r_addr_hi_lo}; // @[Cat.scala 31:58]
  wire [6:0] w_addr_lo_lo = {auto_in_aw_bits_addr[9],auto_in_aw_bits_addr[8],auto_in_aw_bits_addr[7],
    auto_in_aw_bits_addr[6],auto_in_aw_bits_addr[5],auto_in_aw_bits_addr[4],auto_in_aw_bits_addr[3]}; // @[Cat.scala 31:58]
  wire [13:0] w_addr_lo = {auto_in_aw_bits_addr[16],auto_in_aw_bits_addr[15],auto_in_aw_bits_addr[14],
    auto_in_aw_bits_addr[13],auto_in_aw_bits_addr[12],auto_in_aw_bits_addr[11],auto_in_aw_bits_addr[10],w_addr_lo_lo}; // @[Cat.scala 31:58]
  wire [6:0] w_addr_hi_lo = {auto_in_aw_bits_addr[23],auto_in_aw_bits_addr[22],auto_in_aw_bits_addr[21],
    auto_in_aw_bits_addr[20],auto_in_aw_bits_addr[19],auto_in_aw_bits_addr[18],auto_in_aw_bits_addr[17]}; // @[Cat.scala 31:58]
  wire [13:0] w_addr_hi = {auto_in_aw_bits_addr[30],auto_in_aw_bits_addr[29],auto_in_aw_bits_addr[28],
    auto_in_aw_bits_addr[27],auto_in_aw_bits_addr[26],auto_in_aw_bits_addr[25],auto_in_aw_bits_addr[24],w_addr_hi_lo}; // @[Cat.scala 31:58]
  wire [31:0] _r_sel0_T = auto_in_ar_bits_addr ^ 32'h80000000; // @[Parameters.scala 137:31]
  wire [32:0] _r_sel0_T_1 = {1'b0,$signed(_r_sel0_T)}; // @[Parameters.scala 137:49]
  wire [32:0] _r_sel0_T_3 = $signed(_r_sel0_T_1) & -33'sh80000000; // @[Parameters.scala 137:52]
  wire  r_sel0 = $signed(_r_sel0_T_3) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _w_sel0_T = auto_in_aw_bits_addr ^ 32'h80000000; // @[Parameters.scala 137:31]
  wire [32:0] _w_sel0_T_1 = {1'b0,$signed(_w_sel0_T)}; // @[Parameters.scala 137:49]
  wire [32:0] _w_sel0_T_3 = $signed(_w_sel0_T_1) & -33'sh80000000; // @[Parameters.scala 137:52]
  wire  w_sel0 = $signed(_w_sel0_T_3) == 33'sh0; // @[Parameters.scala 137:67]
  reg  w_full; // @[SRAM.scala 70:25]
  reg [3:0] w_id; // @[SRAM.scala 71:21]
  reg  w_echo_real_last; // @[SRAM.scala 72:21]
  reg  r_sel1; // @[SRAM.scala 73:21]
  reg  w_sel1; // @[SRAM.scala 74:21]
  wire  _T = auto_in_b_ready & w_full; // @[Decoupled.scala 50:35]
  wire  _GEN_0 = _T ? 1'h0 : w_full; // @[SRAM.scala 70:25 76:{25,34}]
  wire  _bundleIn_0_aw_ready_T_1 = auto_in_b_ready | ~w_full; // @[SRAM.scala 92:47]
  wire  in_aw_ready = auto_in_w_valid & (auto_in_b_ready | ~w_full); // @[SRAM.scala 92:32]
  wire  _T_1 = in_aw_ready & auto_in_aw_valid; // @[Decoupled.scala 50:35]
  wire  _GEN_1 = _T_1 | _GEN_0; // @[SRAM.scala 77:{25,34}]
  reg  r_full; // @[SRAM.scala 99:25]
  reg [3:0] r_id; // @[SRAM.scala 100:21]
  reg  r_echo_real_last; // @[SRAM.scala 101:21]
  wire  _T_13 = auto_in_r_ready & r_full; // @[Decoupled.scala 50:35]
  wire  _GEN_40 = _T_13 ? 1'h0 : r_full; // @[SRAM.scala 103:{25,34} 99:25]
  wire  in_ar_ready = auto_in_r_ready | ~r_full; // @[SRAM.scala 117:31]
  wire  _T_14 = in_ar_ready & auto_in_ar_valid; // @[Decoupled.scala 50:35]
  wire  _GEN_41 = _T_14 | _GEN_40; // @[SRAM.scala 104:{25,34}]
  reg  rdata_REG; // @[package.scala 91:91]
  reg [7:0] rdata_r_0; // @[Reg.scala 16:16]
  reg [7:0] rdata_r_1; // @[Reg.scala 16:16]
  reg [7:0] rdata_r_2; // @[Reg.scala 16:16]
  reg [7:0] rdata_r_3; // @[Reg.scala 16:16]
  reg [7:0] rdata_r_4; // @[Reg.scala 16:16]
  reg [7:0] rdata_r_5; // @[Reg.scala 16:16]
  reg [7:0] rdata_r_6; // @[Reg.scala 16:16]
  reg [7:0] rdata_r_7; // @[Reg.scala 16:16]
  wire [7:0] _GEN_49 = rdata_REG ? mem_R0_data_0 : rdata_r_0; // @[Reg.scala 16:16 17:{18,22}]
  wire [7:0] _GEN_50 = rdata_REG ? mem_R0_data_1 : rdata_r_1; // @[Reg.scala 16:16 17:{18,22}]
  wire [7:0] _GEN_51 = rdata_REG ? mem_R0_data_2 : rdata_r_2; // @[Reg.scala 16:16 17:{18,22}]
  wire [7:0] _GEN_52 = rdata_REG ? mem_R0_data_3 : rdata_r_3; // @[Reg.scala 16:16 17:{18,22}]
  wire [7:0] _GEN_53 = rdata_REG ? mem_R0_data_4 : rdata_r_4; // @[Reg.scala 16:16 17:{18,22}]
  wire [7:0] _GEN_54 = rdata_REG ? mem_R0_data_5 : rdata_r_5; // @[Reg.scala 16:16 17:{18,22}]
  wire [7:0] _GEN_55 = rdata_REG ? mem_R0_data_6 : rdata_r_6; // @[Reg.scala 16:16 17:{18,22}]
  wire [7:0] _GEN_56 = rdata_REG ? mem_R0_data_7 : rdata_r_7; // @[Reg.scala 16:16 17:{18,22}]
  wire [31:0] bundleIn_0_r_bits_data_lo = {_GEN_52,_GEN_51,_GEN_50,_GEN_49}; // @[Cat.scala 31:58]
  wire [31:0] bundleIn_0_r_bits_data_hi = {_GEN_56,_GEN_55,_GEN_54,_GEN_53}; // @[Cat.scala 31:58]
  mem_tb mem ( // @[DescribedSRAM.scala 19:26]
    .R0_addr(mem_R0_addr),
    .R0_en(mem_R0_en),
    .R0_clk(mem_R0_clk),
    .R0_data_0(mem_R0_data_0),
    .R0_data_1(mem_R0_data_1),
    .R0_data_2(mem_R0_data_2),
    .R0_data_3(mem_R0_data_3),
    .R0_data_4(mem_R0_data_4),
    .R0_data_5(mem_R0_data_5),
    .R0_data_6(mem_R0_data_6),
    .R0_data_7(mem_R0_data_7),
    .W0_addr(mem_W0_addr),
    .W0_en(mem_W0_en),
    .W0_clk(mem_W0_clk),
    .W0_data_0(mem_W0_data_0),
    .W0_data_1(mem_W0_data_1),
    .W0_data_2(mem_W0_data_2),
    .W0_data_3(mem_W0_data_3),
    .W0_data_4(mem_W0_data_4),
    .W0_data_5(mem_W0_data_5),
    .W0_data_6(mem_W0_data_6),
    .W0_data_7(mem_W0_data_7),
    .W0_mask_0(mem_W0_mask_0),
    .W0_mask_1(mem_W0_mask_1),
    .W0_mask_2(mem_W0_mask_2),
    .W0_mask_3(mem_W0_mask_3),
    .W0_mask_4(mem_W0_mask_4),
    .W0_mask_5(mem_W0_mask_5),
    .W0_mask_6(mem_W0_mask_6),
    .W0_mask_7(mem_W0_mask_7)
  );
  assign auto_in_aw_ready = auto_in_w_valid & (auto_in_b_ready | ~w_full); // @[SRAM.scala 92:32]
  assign auto_in_w_ready = auto_in_aw_valid & _bundleIn_0_aw_ready_T_1; // @[SRAM.scala 93:32]
  assign auto_in_b_valid = w_full; // @[Nodes.scala 1210:84 SRAM.scala 91:17]
  assign auto_in_b_bits_id = w_id; // @[Nodes.scala 1210:84 SRAM.scala 95:20]
  assign auto_in_b_bits_resp = w_sel1 ? 2'h0 : 2'h3; // @[SRAM.scala 96:26]
  assign auto_in_b_bits_echo_real_last = w_echo_real_last; // @[Nodes.scala 1210:84 BundleMap.scala 247:19]
  assign auto_in_ar_ready = auto_in_r_ready | ~r_full; // @[SRAM.scala 117:31]
  assign auto_in_r_valid = r_full; // @[Nodes.scala 1210:84 SRAM.scala 116:17]
  assign auto_in_r_bits_id = r_id; // @[Nodes.scala 1210:84 SRAM.scala 119:20]
  assign auto_in_r_bits_data = {bundleIn_0_r_bits_data_hi,bundleIn_0_r_bits_data_lo}; // @[Cat.scala 31:58]
  assign auto_in_r_bits_resp = r_sel1 ? 2'h0 : 2'h3; // @[SRAM.scala 120:26]
  assign auto_in_r_bits_echo_real_last = r_echo_real_last; // @[Nodes.scala 1210:84 BundleMap.scala 247:19]
  assign mem_R0_addr = {r_addr_hi,r_addr_lo}; // @[Cat.scala 31:58]
  assign mem_R0_en = in_ar_ready & auto_in_ar_valid; // @[Decoupled.scala 50:35]
  assign mem_R0_clk = clock; // @[package.scala 91:{58,58}]
  assign mem_W0_addr = {w_addr_hi,w_addr_lo}; // @[Cat.scala 31:58]
  assign mem_W0_en = _T_1 & w_sel0; // @[SRAM.scala 86:24]
  assign mem_W0_clk = clock; // @[SRAM.scala 86:35]
  assign mem_W0_data_0 = auto_in_w_bits_data[7:0]; // @[SRAM.scala 85:62]
  assign mem_W0_data_1 = auto_in_w_bits_data[15:8]; // @[SRAM.scala 85:62]
  assign mem_W0_data_2 = auto_in_w_bits_data[23:16]; // @[SRAM.scala 85:62]
  assign mem_W0_data_3 = auto_in_w_bits_data[31:24]; // @[SRAM.scala 85:62]
  assign mem_W0_data_4 = auto_in_w_bits_data[39:32]; // @[SRAM.scala 85:62]
  assign mem_W0_data_5 = auto_in_w_bits_data[47:40]; // @[SRAM.scala 85:62]
  assign mem_W0_data_6 = auto_in_w_bits_data[55:48]; // @[SRAM.scala 85:62]
  assign mem_W0_data_7 = auto_in_w_bits_data[63:56]; // @[SRAM.scala 85:62]
  assign mem_W0_mask_0 = auto_in_w_bits_strb[0]; // @[SRAM.scala 87:47]
  assign mem_W0_mask_1 = auto_in_w_bits_strb[1]; // @[SRAM.scala 87:47]
  assign mem_W0_mask_2 = auto_in_w_bits_strb[2]; // @[SRAM.scala 87:47]
  assign mem_W0_mask_3 = auto_in_w_bits_strb[3]; // @[SRAM.scala 87:47]
  assign mem_W0_mask_4 = auto_in_w_bits_strb[4]; // @[SRAM.scala 87:47]
  assign mem_W0_mask_5 = auto_in_w_bits_strb[5]; // @[SRAM.scala 87:47]
  assign mem_W0_mask_6 = auto_in_w_bits_strb[6]; // @[SRAM.scala 87:47]
  assign mem_W0_mask_7 = auto_in_w_bits_strb[7]; // @[SRAM.scala 87:47]
  always @(posedge clock) begin
    if (reset) begin // @[SRAM.scala 70:25]
      w_full <= 1'h0; // @[SRAM.scala 70:25]
    end else begin
      w_full <= _GEN_1;
    end
    if (_T_1) begin // @[SRAM.scala 79:25]
      w_id <= auto_in_aw_bits_id; // @[SRAM.scala 80:12]
    end
    if (_T_1) begin // @[SRAM.scala 79:25]
      w_echo_real_last <= auto_in_aw_bits_echo_real_last; // @[BundleMap.scala 247:19]
    end
    if (_T_14) begin // @[SRAM.scala 106:25]
      r_sel1 <= r_sel0; // @[SRAM.scala 108:14]
    end
    if (_T_1) begin // @[SRAM.scala 79:25]
      w_sel1 <= w_sel0; // @[SRAM.scala 81:14]
    end
    if (reset) begin // @[SRAM.scala 99:25]
      r_full <= 1'h0; // @[SRAM.scala 99:25]
    end else begin
      r_full <= _GEN_41;
    end
    if (_T_14) begin // @[SRAM.scala 106:25]
      r_id <= auto_in_ar_bits_id; // @[SRAM.scala 107:12]
    end
    if (_T_14) begin // @[SRAM.scala 106:25]
      r_echo_real_last <= auto_in_ar_bits_echo_real_last; // @[BundleMap.scala 247:19]
    end
    rdata_REG <= in_ar_ready & auto_in_ar_valid; // @[Decoupled.scala 50:35]
    if (rdata_REG) begin // @[Reg.scala 17:18]
      rdata_r_0 <= mem_R0_data_0; // @[Reg.scala 17:22]
    end
    if (rdata_REG) begin // @[Reg.scala 17:18]
      rdata_r_1 <= mem_R0_data_1; // @[Reg.scala 17:22]
    end
    if (rdata_REG) begin // @[Reg.scala 17:18]
      rdata_r_2 <= mem_R0_data_2; // @[Reg.scala 17:22]
    end
    if (rdata_REG) begin // @[Reg.scala 17:18]
      rdata_r_3 <= mem_R0_data_3; // @[Reg.scala 17:22]
    end
    if (rdata_REG) begin // @[Reg.scala 17:18]
      rdata_r_4 <= mem_R0_data_4; // @[Reg.scala 17:22]
    end
    if (rdata_REG) begin // @[Reg.scala 17:18]
      rdata_r_5 <= mem_R0_data_5; // @[Reg.scala 17:22]
    end
    if (rdata_REG) begin // @[Reg.scala 17:18]
      rdata_r_6 <= mem_R0_data_6; // @[Reg.scala 17:22]
    end
    if (rdata_REG) begin // @[Reg.scala 17:18]
      rdata_r_7 <= mem_R0_data_7; // @[Reg.scala 17:22]
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
  w_full = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  w_id = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  w_echo_real_last = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  r_sel1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  w_sel1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  r_full = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  r_id = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  r_echo_real_last = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  rdata_REG = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  rdata_r_0 = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  rdata_r_1 = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  rdata_r_2 = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  rdata_r_3 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  rdata_r_4 = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  rdata_r_5 = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  rdata_r_6 = _RAND_15[7:0];
  _RAND_16 = {1{`RANDOM}};
  rdata_r_7 = _RAND_16[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AXI4Xbar_tb(
  input         clock,
  input         reset,
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input  [3:0]  auto_in_aw_bits_id,
  input  [31:0] auto_in_aw_bits_addr,
  input  [7:0]  auto_in_aw_bits_len,
  input  [2:0]  auto_in_aw_bits_size,
  input  [1:0]  auto_in_aw_bits_burst,
  output        auto_in_w_ready,
  input         auto_in_w_valid,
  input  [63:0] auto_in_w_bits_data,
  input  [7:0]  auto_in_w_bits_strb,
  input         auto_in_w_bits_last,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output [3:0]  auto_in_b_bits_id,
  output [1:0]  auto_in_b_bits_resp,
  output        auto_in_ar_ready,
  input         auto_in_ar_valid,
  input  [3:0]  auto_in_ar_bits_id,
  input  [31:0] auto_in_ar_bits_addr,
  input  [7:0]  auto_in_ar_bits_len,
  input  [2:0]  auto_in_ar_bits_size,
  input  [1:0]  auto_in_ar_bits_burst,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output [3:0]  auto_in_r_bits_id,
  output [63:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output        auto_in_r_bits_last,
  input         auto_out_aw_ready,
  output        auto_out_aw_valid,
  output [3:0]  auto_out_aw_bits_id,
  output [31:0] auto_out_aw_bits_addr,
  output [7:0]  auto_out_aw_bits_len,
  output [2:0]  auto_out_aw_bits_size,
  output [1:0]  auto_out_aw_bits_burst,
  input         auto_out_w_ready,
  output        auto_out_w_valid,
  output [63:0] auto_out_w_bits_data,
  output [7:0]  auto_out_w_bits_strb,
  output        auto_out_w_bits_last,
  output        auto_out_b_ready,
  input         auto_out_b_valid,
  input  [3:0]  auto_out_b_bits_id,
  input  [1:0]  auto_out_b_bits_resp,
  input         auto_out_ar_ready,
  output        auto_out_ar_valid,
  output [3:0]  auto_out_ar_bits_id,
  output [31:0] auto_out_ar_bits_addr,
  output [7:0]  auto_out_ar_bits_len,
  output [2:0]  auto_out_ar_bits_size,
  output [1:0]  auto_out_ar_bits_burst,
  output        auto_out_r_ready,
  input         auto_out_r_valid,
  input  [3:0]  auto_out_r_bits_id,
  input  [63:0] auto_out_r_bits_data,
  input  [1:0]  auto_out_r_bits_resp,
  input         auto_out_r_bits_last
);
  wire  _awOut_0_io_enq_bits_T_1 = ~auto_in_aw_valid; // @[Xbar.scala 263:60]
  wire  _awOut_0_io_enq_bits_T_4 = ~reset; // @[Xbar.scala 263:11]
  wire  _T_1 = ~auto_in_ar_valid; // @[Xbar.scala 263:60]
  wire  _T_14 = ~auto_out_r_valid; // @[Xbar.scala 263:60]
  wire  _T_26 = ~auto_out_b_valid; // @[Xbar.scala 263:60]
  assign auto_in_aw_ready = auto_out_aw_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_w_ready = auto_out_w_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_b_valid = auto_out_b_valid; // @[Xbar.scala 285:22]
  assign auto_in_b_bits_id = auto_out_b_bits_id; // @[Xbar.scala 83:69]
  assign auto_in_b_bits_resp = auto_out_b_bits_resp; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_ar_ready = auto_out_ar_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_r_valid = auto_out_r_valid; // @[Xbar.scala 285:22]
  assign auto_in_r_bits_id = auto_out_r_bits_id; // @[Xbar.scala 83:69]
  assign auto_in_r_bits_data = auto_out_r_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_r_bits_resp = auto_out_r_bits_resp; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_r_bits_last = auto_out_r_bits_last; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_out_aw_valid = auto_in_aw_valid; // @[Xbar.scala 285:22]
  assign auto_out_aw_bits_id = auto_in_aw_bits_id; // @[Xbar.scala 86:47]
  assign auto_out_aw_bits_addr = auto_in_aw_bits_addr; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_aw_bits_len = auto_in_aw_bits_len; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_aw_bits_size = auto_in_aw_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_aw_bits_burst = auto_in_aw_bits_burst; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_w_valid = auto_in_w_valid; // @[Xbar.scala 229:40]
  assign auto_out_w_bits_data = auto_in_w_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_w_bits_strb = auto_in_w_bits_strb; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_w_bits_last = auto_in_w_bits_last; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_b_ready = auto_in_b_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_ar_valid = auto_in_ar_valid; // @[Xbar.scala 285:22]
  assign auto_out_ar_bits_id = auto_in_ar_bits_id; // @[Xbar.scala 87:47]
  assign auto_out_ar_bits_addr = auto_in_ar_bits_addr; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_ar_bits_len = auto_in_ar_bits_len; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_ar_bits_size = auto_in_ar_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_ar_bits_burst = auto_in_ar_bits_burst; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_r_ready = auto_in_r_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~1'h1 & ~reset) begin
          $fatal; // @[Xbar.scala 263:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_awOut_0_io_enq_bits_T_1 | auto_in_aw_valid) & _awOut_0_io_enq_bits_T_4) begin
          $fatal; // @[Xbar.scala 265:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_awOut_0_io_enq_bits_T_4 & ~(_awOut_0_io_enq_bits_T_1 | auto_in_aw_valid)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:265 assert (!anyValid || winner.reduce(_||_))\n"); // @[Xbar.scala 265:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~1'h1 & ~reset) begin
          $fatal; // @[Xbar.scala 263:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_1 | auto_in_ar_valid) & _awOut_0_io_enq_bits_T_4) begin
          $fatal; // @[Xbar.scala 265:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_awOut_0_io_enq_bits_T_4 & ~(_T_1 | auto_in_ar_valid)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:265 assert (!anyValid || winner.reduce(_||_))\n"); // @[Xbar.scala 265:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~1'h1 & ~reset) begin
          $fatal; // @[Xbar.scala 263:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_14 | auto_out_r_valid) & _awOut_0_io_enq_bits_T_4) begin
          $fatal; // @[Xbar.scala 265:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_awOut_0_io_enq_bits_T_4 & ~(_T_14 | auto_out_r_valid)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:265 assert (!anyValid || winner.reduce(_||_))\n"); // @[Xbar.scala 265:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~1'h1 & ~reset) begin
          $fatal; // @[Xbar.scala 263:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_26 | auto_out_b_valid) & _awOut_0_io_enq_bits_T_4) begin
          $fatal; // @[Xbar.scala 265:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_awOut_0_io_enq_bits_T_4 & ~(_T_26 | auto_out_b_valid)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:265 assert (!anyValid || winner.reduce(_||_))\n"); // @[Xbar.scala 265:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module Queue_36_tb(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [3:0]  io_enq_bits_id,
  input  [31:0] io_enq_bits_addr,
  input         io_enq_bits_echo_real_last,
  input         io_deq_ready,
  output        io_deq_valid,
  output [3:0]  io_deq_bits_id,
  output [31:0] io_deq_bits_addr,
  output        io_deq_bits_echo_real_last
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] ram_id [0:1]; // @[Decoupled.scala 259:95]
  wire  ram_id_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_id_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [3:0] ram_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [3:0] ram_id_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_id_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_id_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_id_MPORT_en; // @[Decoupled.scala 259:95]
  reg [31:0] ram_addr [0:1]; // @[Decoupled.scala 259:95]
  wire  ram_addr_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_addr_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [31:0] ram_addr_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [31:0] ram_addr_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_addr_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_addr_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_addr_MPORT_en; // @[Decoupled.scala 259:95]
  reg  ram_echo_real_last [0:1]; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_MPORT_en; // @[Decoupled.scala 259:95]
  reg  value; // @[Counter.scala 62:40]
  reg  value_1; // @[Counter.scala 62:40]
  reg  maybe_full; // @[Decoupled.scala 262:27]
  wire  ptr_match = value == value_1; // @[Decoupled.scala 263:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 264:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 265:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 50:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 50:35]
  assign ram_id_io_deq_bits_MPORT_en = 1'h1;
  assign ram_id_io_deq_bits_MPORT_addr = value_1;
  assign ram_id_io_deq_bits_MPORT_data = ram_id[ram_id_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_id_MPORT_data = io_enq_bits_id;
  assign ram_id_MPORT_addr = value;
  assign ram_id_MPORT_mask = 1'h1;
  assign ram_id_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_addr_io_deq_bits_MPORT_en = 1'h1;
  assign ram_addr_io_deq_bits_MPORT_addr = value_1;
  assign ram_addr_io_deq_bits_MPORT_data = ram_addr[ram_addr_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_addr_MPORT_data = io_enq_bits_addr;
  assign ram_addr_MPORT_addr = value;
  assign ram_addr_MPORT_mask = 1'h1;
  assign ram_addr_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_echo_real_last_io_deq_bits_MPORT_en = 1'h1;
  assign ram_echo_real_last_io_deq_bits_MPORT_addr = value_1;
  assign ram_echo_real_last_io_deq_bits_MPORT_data = ram_echo_real_last[ram_echo_real_last_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_echo_real_last_MPORT_data = io_enq_bits_echo_real_last;
  assign ram_echo_real_last_MPORT_addr = value;
  assign ram_echo_real_last_MPORT_mask = 1'h1;
  assign ram_echo_real_last_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 289:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 288:19]
  assign io_deq_bits_id = ram_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  assign io_deq_bits_addr = ram_addr_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  assign io_deq_bits_echo_real_last = ram_echo_real_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  always @(posedge clock) begin
    if (ram_id_MPORT_en & ram_id_MPORT_mask) begin
      ram_id[ram_id_MPORT_addr] <= ram_id_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_addr_MPORT_en & ram_addr_MPORT_mask) begin
      ram_addr[ram_addr_MPORT_addr] <= ram_addr_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_echo_real_last_MPORT_en & ram_echo_real_last_MPORT_mask) begin
      ram_echo_real_last[ram_echo_real_last_MPORT_addr] <= ram_echo_real_last_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (reset) begin // @[Counter.scala 62:40]
      value <= 1'h0; // @[Counter.scala 62:40]
    end else if (do_enq) begin
      value <= value + 1'h1;
    end
    if (reset) begin // @[Counter.scala 62:40]
      value_1 <= 1'h0; // @[Counter.scala 62:40]
    end else if (do_deq) begin
      value_1 <= value_1 + 1'h1;
    end
    if (reset) begin // @[Decoupled.scala 262:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 262:27]
    end else if (do_enq != do_deq) begin
      maybe_full <= do_enq;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_id[initvar] = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_addr[initvar] = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_echo_real_last[initvar] = _RAND_2[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  value = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  value_1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  maybe_full = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_37_tb(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [63:0] io_enq_bits_data,
  input  [7:0]  io_enq_bits_strb,
  input         io_deq_ready,
  output        io_deq_valid,
  output [63:0] io_deq_bits_data,
  output [7:0]  io_deq_bits_strb
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram_data [0:1]; // @[Decoupled.scala 259:95]
  wire  ram_data_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_data_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [63:0] ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [63:0] ram_data_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_data_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_data_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_data_MPORT_en; // @[Decoupled.scala 259:95]
  reg [7:0] ram_strb [0:1]; // @[Decoupled.scala 259:95]
  wire  ram_strb_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_strb_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [7:0] ram_strb_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [7:0] ram_strb_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_strb_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_strb_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_strb_MPORT_en; // @[Decoupled.scala 259:95]
  reg  value; // @[Counter.scala 62:40]
  reg  value_1; // @[Counter.scala 62:40]
  reg  maybe_full; // @[Decoupled.scala 262:27]
  wire  ptr_match = value == value_1; // @[Decoupled.scala 263:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 264:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 265:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 50:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 50:35]
  assign ram_data_io_deq_bits_MPORT_en = 1'h1;
  assign ram_data_io_deq_bits_MPORT_addr = value_1;
  assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = value;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_strb_io_deq_bits_MPORT_en = 1'h1;
  assign ram_strb_io_deq_bits_MPORT_addr = value_1;
  assign ram_strb_io_deq_bits_MPORT_data = ram_strb[ram_strb_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_strb_MPORT_data = io_enq_bits_strb;
  assign ram_strb_MPORT_addr = value;
  assign ram_strb_MPORT_mask = 1'h1;
  assign ram_strb_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 289:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 288:19]
  assign io_deq_bits_data = ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  assign io_deq_bits_strb = ram_strb_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  always @(posedge clock) begin
    if (ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_strb_MPORT_en & ram_strb_MPORT_mask) begin
      ram_strb[ram_strb_MPORT_addr] <= ram_strb_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (reset) begin // @[Counter.scala 62:40]
      value <= 1'h0; // @[Counter.scala 62:40]
    end else if (do_enq) begin
      value <= value + 1'h1;
    end
    if (reset) begin // @[Counter.scala 62:40]
      value_1 <= 1'h0; // @[Counter.scala 62:40]
    end else if (do_deq) begin
      value_1 <= value_1 + 1'h1;
    end
    if (reset) begin // @[Decoupled.scala 262:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 262:27]
    end else if (do_enq != do_deq) begin
      maybe_full <= do_enq;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_data[initvar] = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_strb[initvar] = _RAND_1[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  value_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_38_tb(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [3:0] io_enq_bits_id,
  input  [1:0] io_enq_bits_resp,
  input        io_enq_bits_echo_real_last,
  input        io_deq_ready,
  output       io_deq_valid,
  output [3:0] io_deq_bits_id,
  output [1:0] io_deq_bits_resp,
  output       io_deq_bits_echo_real_last
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] ram_id [0:1]; // @[Decoupled.scala 259:95]
  wire  ram_id_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_id_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [3:0] ram_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [3:0] ram_id_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_id_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_id_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_id_MPORT_en; // @[Decoupled.scala 259:95]
  reg [1:0] ram_resp [0:1]; // @[Decoupled.scala 259:95]
  wire  ram_resp_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_resp_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [1:0] ram_resp_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [1:0] ram_resp_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_resp_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_resp_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_resp_MPORT_en; // @[Decoupled.scala 259:95]
  reg  ram_echo_real_last [0:1]; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_MPORT_en; // @[Decoupled.scala 259:95]
  reg  value; // @[Counter.scala 62:40]
  reg  value_1; // @[Counter.scala 62:40]
  reg  maybe_full; // @[Decoupled.scala 262:27]
  wire  ptr_match = value == value_1; // @[Decoupled.scala 263:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 264:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 265:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 50:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 50:35]
  assign ram_id_io_deq_bits_MPORT_en = 1'h1;
  assign ram_id_io_deq_bits_MPORT_addr = value_1;
  assign ram_id_io_deq_bits_MPORT_data = ram_id[ram_id_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_id_MPORT_data = io_enq_bits_id;
  assign ram_id_MPORT_addr = value;
  assign ram_id_MPORT_mask = 1'h1;
  assign ram_id_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_resp_io_deq_bits_MPORT_en = 1'h1;
  assign ram_resp_io_deq_bits_MPORT_addr = value_1;
  assign ram_resp_io_deq_bits_MPORT_data = ram_resp[ram_resp_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_resp_MPORT_data = io_enq_bits_resp;
  assign ram_resp_MPORT_addr = value;
  assign ram_resp_MPORT_mask = 1'h1;
  assign ram_resp_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_echo_real_last_io_deq_bits_MPORT_en = 1'h1;
  assign ram_echo_real_last_io_deq_bits_MPORT_addr = value_1;
  assign ram_echo_real_last_io_deq_bits_MPORT_data = ram_echo_real_last[ram_echo_real_last_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_echo_real_last_MPORT_data = io_enq_bits_echo_real_last;
  assign ram_echo_real_last_MPORT_addr = value;
  assign ram_echo_real_last_MPORT_mask = 1'h1;
  assign ram_echo_real_last_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 289:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 288:19]
  assign io_deq_bits_id = ram_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  assign io_deq_bits_resp = ram_resp_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  assign io_deq_bits_echo_real_last = ram_echo_real_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  always @(posedge clock) begin
    if (ram_id_MPORT_en & ram_id_MPORT_mask) begin
      ram_id[ram_id_MPORT_addr] <= ram_id_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_resp_MPORT_en & ram_resp_MPORT_mask) begin
      ram_resp[ram_resp_MPORT_addr] <= ram_resp_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_echo_real_last_MPORT_en & ram_echo_real_last_MPORT_mask) begin
      ram_echo_real_last[ram_echo_real_last_MPORT_addr] <= ram_echo_real_last_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (reset) begin // @[Counter.scala 62:40]
      value <= 1'h0; // @[Counter.scala 62:40]
    end else if (do_enq) begin
      value <= value + 1'h1;
    end
    if (reset) begin // @[Counter.scala 62:40]
      value_1 <= 1'h0; // @[Counter.scala 62:40]
    end else if (do_deq) begin
      value_1 <= value_1 + 1'h1;
    end
    if (reset) begin // @[Decoupled.scala 262:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 262:27]
    end else if (do_enq != do_deq) begin
      maybe_full <= do_enq;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_id[initvar] = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_resp[initvar] = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_echo_real_last[initvar] = _RAND_2[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  value = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  value_1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  maybe_full = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_40_tb(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [3:0]  io_enq_bits_id,
  input  [63:0] io_enq_bits_data,
  input  [1:0]  io_enq_bits_resp,
  input         io_enq_bits_echo_real_last,
  input         io_deq_ready,
  output        io_deq_valid,
  output [3:0]  io_deq_bits_id,
  output [63:0] io_deq_bits_data,
  output [1:0]  io_deq_bits_resp,
  output        io_deq_bits_echo_real_last,
  output        io_deq_bits_last
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] ram_id [0:1]; // @[Decoupled.scala 259:95]
  wire  ram_id_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_id_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [3:0] ram_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [3:0] ram_id_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_id_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_id_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_id_MPORT_en; // @[Decoupled.scala 259:95]
  reg [63:0] ram_data [0:1]; // @[Decoupled.scala 259:95]
  wire  ram_data_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_data_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [63:0] ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [63:0] ram_data_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_data_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_data_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_data_MPORT_en; // @[Decoupled.scala 259:95]
  reg [1:0] ram_resp [0:1]; // @[Decoupled.scala 259:95]
  wire  ram_resp_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_resp_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [1:0] ram_resp_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [1:0] ram_resp_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_resp_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_resp_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_resp_MPORT_en; // @[Decoupled.scala 259:95]
  reg  ram_echo_real_last [0:1]; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_echo_real_last_MPORT_en; // @[Decoupled.scala 259:95]
  reg  ram_last [0:1]; // @[Decoupled.scala 259:95]
  wire  ram_last_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_last_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_last_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_last_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_last_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_last_MPORT_en; // @[Decoupled.scala 259:95]
  reg  value; // @[Counter.scala 62:40]
  reg  value_1; // @[Counter.scala 62:40]
  reg  maybe_full; // @[Decoupled.scala 262:27]
  wire  ptr_match = value == value_1; // @[Decoupled.scala 263:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 264:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 265:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 50:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 50:35]
  assign ram_id_io_deq_bits_MPORT_en = 1'h1;
  assign ram_id_io_deq_bits_MPORT_addr = value_1;
  assign ram_id_io_deq_bits_MPORT_data = ram_id[ram_id_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_id_MPORT_data = io_enq_bits_id;
  assign ram_id_MPORT_addr = value;
  assign ram_id_MPORT_mask = 1'h1;
  assign ram_id_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_data_io_deq_bits_MPORT_en = 1'h1;
  assign ram_data_io_deq_bits_MPORT_addr = value_1;
  assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = value;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_resp_io_deq_bits_MPORT_en = 1'h1;
  assign ram_resp_io_deq_bits_MPORT_addr = value_1;
  assign ram_resp_io_deq_bits_MPORT_data = ram_resp[ram_resp_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_resp_MPORT_data = io_enq_bits_resp;
  assign ram_resp_MPORT_addr = value;
  assign ram_resp_MPORT_mask = 1'h1;
  assign ram_resp_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_echo_real_last_io_deq_bits_MPORT_en = 1'h1;
  assign ram_echo_real_last_io_deq_bits_MPORT_addr = value_1;
  assign ram_echo_real_last_io_deq_bits_MPORT_data = ram_echo_real_last[ram_echo_real_last_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_echo_real_last_MPORT_data = io_enq_bits_echo_real_last;
  assign ram_echo_real_last_MPORT_addr = value;
  assign ram_echo_real_last_MPORT_mask = 1'h1;
  assign ram_echo_real_last_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_last_io_deq_bits_MPORT_en = 1'h1;
  assign ram_last_io_deq_bits_MPORT_addr = value_1;
  assign ram_last_io_deq_bits_MPORT_data = ram_last[ram_last_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_last_MPORT_data = 1'h1;
  assign ram_last_MPORT_addr = value;
  assign ram_last_MPORT_mask = 1'h1;
  assign ram_last_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 289:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 288:19]
  assign io_deq_bits_id = ram_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  assign io_deq_bits_data = ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  assign io_deq_bits_resp = ram_resp_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  assign io_deq_bits_echo_real_last = ram_echo_real_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  assign io_deq_bits_last = ram_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  always @(posedge clock) begin
    if (ram_id_MPORT_en & ram_id_MPORT_mask) begin
      ram_id[ram_id_MPORT_addr] <= ram_id_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_resp_MPORT_en & ram_resp_MPORT_mask) begin
      ram_resp[ram_resp_MPORT_addr] <= ram_resp_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_echo_real_last_MPORT_en & ram_echo_real_last_MPORT_mask) begin
      ram_echo_real_last[ram_echo_real_last_MPORT_addr] <= ram_echo_real_last_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_last_MPORT_en & ram_last_MPORT_mask) begin
      ram_last[ram_last_MPORT_addr] <= ram_last_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (reset) begin // @[Counter.scala 62:40]
      value <= 1'h0; // @[Counter.scala 62:40]
    end else if (do_enq) begin
      value <= value + 1'h1;
    end
    if (reset) begin // @[Counter.scala 62:40]
      value_1 <= 1'h0; // @[Counter.scala 62:40]
    end else if (do_deq) begin
      value_1 <= value_1 + 1'h1;
    end
    if (reset) begin // @[Decoupled.scala 262:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 262:27]
    end else if (do_enq != do_deq) begin
      maybe_full <= do_enq;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_id[initvar] = _RAND_0[3:0];
  _RAND_1 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_data[initvar] = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_resp[initvar] = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_echo_real_last[initvar] = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_last[initvar] = _RAND_4[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  value = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  value_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  maybe_full = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AXI4Buffer_tb(
  input         clock,
  input         reset,
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input  [3:0]  auto_in_aw_bits_id,
  input  [31:0] auto_in_aw_bits_addr,
  input         auto_in_aw_bits_echo_real_last,
  output        auto_in_w_ready,
  input         auto_in_w_valid,
  input  [63:0] auto_in_w_bits_data,
  input  [7:0]  auto_in_w_bits_strb,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output [3:0]  auto_in_b_bits_id,
  output [1:0]  auto_in_b_bits_resp,
  output        auto_in_b_bits_echo_real_last,
  output        auto_in_ar_ready,
  input         auto_in_ar_valid,
  input  [3:0]  auto_in_ar_bits_id,
  input  [31:0] auto_in_ar_bits_addr,
  input         auto_in_ar_bits_echo_real_last,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output [3:0]  auto_in_r_bits_id,
  output [63:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output        auto_in_r_bits_echo_real_last,
  output        auto_in_r_bits_last,
  input         auto_out_aw_ready,
  output        auto_out_aw_valid,
  output [3:0]  auto_out_aw_bits_id,
  output [31:0] auto_out_aw_bits_addr,
  output        auto_out_aw_bits_echo_real_last,
  input         auto_out_w_ready,
  output        auto_out_w_valid,
  output [63:0] auto_out_w_bits_data,
  output [7:0]  auto_out_w_bits_strb,
  output        auto_out_b_ready,
  input         auto_out_b_valid,
  input  [3:0]  auto_out_b_bits_id,
  input  [1:0]  auto_out_b_bits_resp,
  input         auto_out_b_bits_echo_real_last,
  input         auto_out_ar_ready,
  output        auto_out_ar_valid,
  output [3:0]  auto_out_ar_bits_id,
  output [31:0] auto_out_ar_bits_addr,
  output        auto_out_ar_bits_echo_real_last,
  output        auto_out_r_ready,
  input         auto_out_r_valid,
  input  [3:0]  auto_out_r_bits_id,
  input  [63:0] auto_out_r_bits_data,
  input  [1:0]  auto_out_r_bits_resp,
  input         auto_out_r_bits_echo_real_last
);
  wire  bundleOut_0_aw_deq_clock; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_aw_deq_reset; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_aw_deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_aw_deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_aw_deq_io_enq_bits_id; // @[Decoupled.scala 361:21]
  wire [31:0] bundleOut_0_aw_deq_io_enq_bits_addr; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_aw_deq_io_enq_bits_echo_real_last; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_aw_deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_aw_deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_aw_deq_io_deq_bits_id; // @[Decoupled.scala 361:21]
  wire [31:0] bundleOut_0_aw_deq_io_deq_bits_addr; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_aw_deq_io_deq_bits_echo_real_last; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_w_deq_clock; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_w_deq_reset; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_w_deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_w_deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [63:0] bundleOut_0_w_deq_io_enq_bits_data; // @[Decoupled.scala 361:21]
  wire [7:0] bundleOut_0_w_deq_io_enq_bits_strb; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_w_deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_w_deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [63:0] bundleOut_0_w_deq_io_deq_bits_data; // @[Decoupled.scala 361:21]
  wire [7:0] bundleOut_0_w_deq_io_deq_bits_strb; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_deq_clock; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_deq_reset; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] bundleIn_0_b_deq_io_enq_bits_id; // @[Decoupled.scala 361:21]
  wire [1:0] bundleIn_0_b_deq_io_enq_bits_resp; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_deq_io_enq_bits_echo_real_last; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] bundleIn_0_b_deq_io_deq_bits_id; // @[Decoupled.scala 361:21]
  wire [1:0] bundleIn_0_b_deq_io_deq_bits_resp; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_deq_io_deq_bits_echo_real_last; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_ar_deq_clock; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_ar_deq_reset; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_ar_deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_ar_deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_ar_deq_io_enq_bits_id; // @[Decoupled.scala 361:21]
  wire [31:0] bundleOut_0_ar_deq_io_enq_bits_addr; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_ar_deq_io_enq_bits_echo_real_last; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_ar_deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_ar_deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_ar_deq_io_deq_bits_id; // @[Decoupled.scala 361:21]
  wire [31:0] bundleOut_0_ar_deq_io_deq_bits_addr; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_ar_deq_io_deq_bits_echo_real_last; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_r_deq_clock; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_r_deq_reset; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_r_deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_r_deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] bundleIn_0_r_deq_io_enq_bits_id; // @[Decoupled.scala 361:21]
  wire [63:0] bundleIn_0_r_deq_io_enq_bits_data; // @[Decoupled.scala 361:21]
  wire [1:0] bundleIn_0_r_deq_io_enq_bits_resp; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_r_deq_io_enq_bits_echo_real_last; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_r_deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_r_deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] bundleIn_0_r_deq_io_deq_bits_id; // @[Decoupled.scala 361:21]
  wire [63:0] bundleIn_0_r_deq_io_deq_bits_data; // @[Decoupled.scala 361:21]
  wire [1:0] bundleIn_0_r_deq_io_deq_bits_resp; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_r_deq_io_deq_bits_echo_real_last; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_r_deq_io_deq_bits_last; // @[Decoupled.scala 361:21]
  Queue_36_tb bundleOut_0_aw_deq ( // @[Decoupled.scala 361:21]
    .clock(bundleOut_0_aw_deq_clock),
    .reset(bundleOut_0_aw_deq_reset),
    .io_enq_ready(bundleOut_0_aw_deq_io_enq_ready),
    .io_enq_valid(bundleOut_0_aw_deq_io_enq_valid),
    .io_enq_bits_id(bundleOut_0_aw_deq_io_enq_bits_id),
    .io_enq_bits_addr(bundleOut_0_aw_deq_io_enq_bits_addr),
    .io_enq_bits_echo_real_last(bundleOut_0_aw_deq_io_enq_bits_echo_real_last),
    .io_deq_ready(bundleOut_0_aw_deq_io_deq_ready),
    .io_deq_valid(bundleOut_0_aw_deq_io_deq_valid),
    .io_deq_bits_id(bundleOut_0_aw_deq_io_deq_bits_id),
    .io_deq_bits_addr(bundleOut_0_aw_deq_io_deq_bits_addr),
    .io_deq_bits_echo_real_last(bundleOut_0_aw_deq_io_deq_bits_echo_real_last)
  );
  Queue_37_tb bundleOut_0_w_deq ( // @[Decoupled.scala 361:21]
    .clock(bundleOut_0_w_deq_clock),
    .reset(bundleOut_0_w_deq_reset),
    .io_enq_ready(bundleOut_0_w_deq_io_enq_ready),
    .io_enq_valid(bundleOut_0_w_deq_io_enq_valid),
    .io_enq_bits_data(bundleOut_0_w_deq_io_enq_bits_data),
    .io_enq_bits_strb(bundleOut_0_w_deq_io_enq_bits_strb),
    .io_deq_ready(bundleOut_0_w_deq_io_deq_ready),
    .io_deq_valid(bundleOut_0_w_deq_io_deq_valid),
    .io_deq_bits_data(bundleOut_0_w_deq_io_deq_bits_data),
    .io_deq_bits_strb(bundleOut_0_w_deq_io_deq_bits_strb)
  );
  Queue_38_tb bundleIn_0_b_deq ( // @[Decoupled.scala 361:21]
    .clock(bundleIn_0_b_deq_clock),
    .reset(bundleIn_0_b_deq_reset),
    .io_enq_ready(bundleIn_0_b_deq_io_enq_ready),
    .io_enq_valid(bundleIn_0_b_deq_io_enq_valid),
    .io_enq_bits_id(bundleIn_0_b_deq_io_enq_bits_id),
    .io_enq_bits_resp(bundleIn_0_b_deq_io_enq_bits_resp),
    .io_enq_bits_echo_real_last(bundleIn_0_b_deq_io_enq_bits_echo_real_last),
    .io_deq_ready(bundleIn_0_b_deq_io_deq_ready),
    .io_deq_valid(bundleIn_0_b_deq_io_deq_valid),
    .io_deq_bits_id(bundleIn_0_b_deq_io_deq_bits_id),
    .io_deq_bits_resp(bundleIn_0_b_deq_io_deq_bits_resp),
    .io_deq_bits_echo_real_last(bundleIn_0_b_deq_io_deq_bits_echo_real_last)
  );
  Queue_36_tb bundleOut_0_ar_deq ( // @[Decoupled.scala 361:21]
    .clock(bundleOut_0_ar_deq_clock),
    .reset(bundleOut_0_ar_deq_reset),
    .io_enq_ready(bundleOut_0_ar_deq_io_enq_ready),
    .io_enq_valid(bundleOut_0_ar_deq_io_enq_valid),
    .io_enq_bits_id(bundleOut_0_ar_deq_io_enq_bits_id),
    .io_enq_bits_addr(bundleOut_0_ar_deq_io_enq_bits_addr),
    .io_enq_bits_echo_real_last(bundleOut_0_ar_deq_io_enq_bits_echo_real_last),
    .io_deq_ready(bundleOut_0_ar_deq_io_deq_ready),
    .io_deq_valid(bundleOut_0_ar_deq_io_deq_valid),
    .io_deq_bits_id(bundleOut_0_ar_deq_io_deq_bits_id),
    .io_deq_bits_addr(bundleOut_0_ar_deq_io_deq_bits_addr),
    .io_deq_bits_echo_real_last(bundleOut_0_ar_deq_io_deq_bits_echo_real_last)
  );
  Queue_40_tb bundleIn_0_r_deq ( // @[Decoupled.scala 361:21]
    .clock(bundleIn_0_r_deq_clock),
    .reset(bundleIn_0_r_deq_reset),
    .io_enq_ready(bundleIn_0_r_deq_io_enq_ready),
    .io_enq_valid(bundleIn_0_r_deq_io_enq_valid),
    .io_enq_bits_id(bundleIn_0_r_deq_io_enq_bits_id),
    .io_enq_bits_data(bundleIn_0_r_deq_io_enq_bits_data),
    .io_enq_bits_resp(bundleIn_0_r_deq_io_enq_bits_resp),
    .io_enq_bits_echo_real_last(bundleIn_0_r_deq_io_enq_bits_echo_real_last),
    .io_deq_ready(bundleIn_0_r_deq_io_deq_ready),
    .io_deq_valid(bundleIn_0_r_deq_io_deq_valid),
    .io_deq_bits_id(bundleIn_0_r_deq_io_deq_bits_id),
    .io_deq_bits_data(bundleIn_0_r_deq_io_deq_bits_data),
    .io_deq_bits_resp(bundleIn_0_r_deq_io_deq_bits_resp),
    .io_deq_bits_echo_real_last(bundleIn_0_r_deq_io_deq_bits_echo_real_last),
    .io_deq_bits_last(bundleIn_0_r_deq_io_deq_bits_last)
  );
  assign auto_in_aw_ready = bundleOut_0_aw_deq_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign auto_in_w_ready = bundleOut_0_w_deq_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign auto_in_b_valid = bundleIn_0_b_deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  assign auto_in_b_bits_id = bundleIn_0_b_deq_io_deq_bits_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_in_b_bits_resp = bundleIn_0_b_deq_io_deq_bits_resp; // @[Decoupled.scala 401:19 402:14]
  assign auto_in_b_bits_echo_real_last = bundleIn_0_b_deq_io_deq_bits_echo_real_last; // @[Decoupled.scala 401:19 402:14]
  assign auto_in_ar_ready = bundleOut_0_ar_deq_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign auto_in_r_valid = bundleIn_0_r_deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  assign auto_in_r_bits_id = bundleIn_0_r_deq_io_deq_bits_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_in_r_bits_data = bundleIn_0_r_deq_io_deq_bits_data; // @[Decoupled.scala 401:19 402:14]
  assign auto_in_r_bits_resp = bundleIn_0_r_deq_io_deq_bits_resp; // @[Decoupled.scala 401:19 402:14]
  assign auto_in_r_bits_echo_real_last = bundleIn_0_r_deq_io_deq_bits_echo_real_last; // @[Decoupled.scala 401:19 402:14]
  assign auto_in_r_bits_last = bundleIn_0_r_deq_io_deq_bits_last; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_valid = bundleOut_0_aw_deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  assign auto_out_aw_bits_id = bundleOut_0_aw_deq_io_deq_bits_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_addr = bundleOut_0_aw_deq_io_deq_bits_addr; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_echo_real_last = bundleOut_0_aw_deq_io_deq_bits_echo_real_last; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_w_valid = bundleOut_0_w_deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  assign auto_out_w_bits_data = bundleOut_0_w_deq_io_deq_bits_data; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_w_bits_strb = bundleOut_0_w_deq_io_deq_bits_strb; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_b_ready = bundleIn_0_b_deq_io_enq_ready; // @[Nodes.scala 1207:84 Decoupled.scala 365:17]
  assign auto_out_ar_valid = bundleOut_0_ar_deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  assign auto_out_ar_bits_id = bundleOut_0_ar_deq_io_deq_bits_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_addr = bundleOut_0_ar_deq_io_deq_bits_addr; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_echo_real_last = bundleOut_0_ar_deq_io_deq_bits_echo_real_last; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_r_ready = bundleIn_0_r_deq_io_enq_ready; // @[Nodes.scala 1207:84 Decoupled.scala 365:17]
  assign bundleOut_0_aw_deq_clock = clock;
  assign bundleOut_0_aw_deq_reset = reset;
  assign bundleOut_0_aw_deq_io_enq_valid = auto_in_aw_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_aw_deq_io_enq_bits_id = auto_in_aw_bits_id; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_aw_deq_io_enq_bits_addr = auto_in_aw_bits_addr; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_aw_deq_io_enq_bits_echo_real_last = auto_in_aw_bits_echo_real_last; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_aw_deq_io_deq_ready = auto_out_aw_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleOut_0_w_deq_clock = clock;
  assign bundleOut_0_w_deq_reset = reset;
  assign bundleOut_0_w_deq_io_enq_valid = auto_in_w_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_w_deq_io_enq_bits_data = auto_in_w_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_w_deq_io_enq_bits_strb = auto_in_w_bits_strb; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_w_deq_io_deq_ready = auto_out_w_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_b_deq_clock = clock;
  assign bundleIn_0_b_deq_reset = reset;
  assign bundleIn_0_b_deq_io_enq_valid = auto_out_b_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_b_deq_io_enq_bits_id = auto_out_b_bits_id; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_b_deq_io_enq_bits_resp = auto_out_b_bits_resp; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_b_deq_io_enq_bits_echo_real_last = auto_out_b_bits_echo_real_last; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_b_deq_io_deq_ready = auto_in_b_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_ar_deq_clock = clock;
  assign bundleOut_0_ar_deq_reset = reset;
  assign bundleOut_0_ar_deq_io_enq_valid = auto_in_ar_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_ar_deq_io_enq_bits_id = auto_in_ar_bits_id; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_ar_deq_io_enq_bits_addr = auto_in_ar_bits_addr; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_ar_deq_io_enq_bits_echo_real_last = auto_in_ar_bits_echo_real_last; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_ar_deq_io_deq_ready = auto_out_ar_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_r_deq_clock = clock;
  assign bundleIn_0_r_deq_reset = reset;
  assign bundleIn_0_r_deq_io_enq_valid = auto_out_r_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_r_deq_io_enq_bits_id = auto_out_r_bits_id; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_r_deq_io_enq_bits_data = auto_out_r_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_r_deq_io_enq_bits_resp = auto_out_r_bits_resp; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_r_deq_io_enq_bits_echo_real_last = auto_out_r_bits_echo_real_last; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_r_deq_io_deq_ready = auto_in_r_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule
module Queue_41_tb(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [3:0]  io_enq_bits_id,
  input  [31:0] io_enq_bits_addr,
  input  [7:0]  io_enq_bits_len,
  input  [2:0]  io_enq_bits_size,
  input  [1:0]  io_enq_bits_burst,
  input         io_deq_ready,
  output        io_deq_valid,
  output [3:0]  io_deq_bits_id,
  output [31:0] io_deq_bits_addr,
  output [7:0]  io_deq_bits_len,
  output [2:0]  io_deq_bits_size,
  output [1:0]  io_deq_bits_burst
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] ram_id [0:0]; // @[Decoupled.scala 259:95]
  wire  ram_id_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_id_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [3:0] ram_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [3:0] ram_id_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_id_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_id_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_id_MPORT_en; // @[Decoupled.scala 259:95]
  reg [31:0] ram_addr [0:0]; // @[Decoupled.scala 259:95]
  wire  ram_addr_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_addr_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [31:0] ram_addr_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [31:0] ram_addr_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_addr_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_addr_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_addr_MPORT_en; // @[Decoupled.scala 259:95]
  reg [7:0] ram_len [0:0]; // @[Decoupled.scala 259:95]
  wire  ram_len_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_len_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [7:0] ram_len_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [7:0] ram_len_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_len_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_len_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_len_MPORT_en; // @[Decoupled.scala 259:95]
  reg [2:0] ram_size [0:0]; // @[Decoupled.scala 259:95]
  wire  ram_size_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_size_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [2:0] ram_size_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [2:0] ram_size_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_size_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_size_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_size_MPORT_en; // @[Decoupled.scala 259:95]
  reg [1:0] ram_burst [0:0]; // @[Decoupled.scala 259:95]
  wire  ram_burst_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire  ram_burst_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [1:0] ram_burst_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [1:0] ram_burst_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_burst_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_burst_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_burst_MPORT_en; // @[Decoupled.scala 259:95]
  reg  maybe_full; // @[Decoupled.scala 262:27]
  wire  empty = ~maybe_full; // @[Decoupled.scala 264:28]
  wire  _do_enq_T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 50:35]
  wire  _do_deq_T = io_deq_ready & io_deq_valid; // @[Decoupled.scala 50:35]
  wire  _GEN_17 = io_deq_ready ? 1'h0 : _do_enq_T; // @[Decoupled.scala 304:{26,35}]
  wire  do_enq = empty ? _GEN_17 : _do_enq_T; // @[Decoupled.scala 301:17]
  wire  do_deq = empty ? 1'h0 : _do_deq_T; // @[Decoupled.scala 301:17 303:14]
  assign ram_id_io_deq_bits_MPORT_en = 1'h1;
  assign ram_id_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_id_io_deq_bits_MPORT_data = ram_id[ram_id_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_id_MPORT_data = io_enq_bits_id;
  assign ram_id_MPORT_addr = 1'h0;
  assign ram_id_MPORT_mask = 1'h1;
  assign ram_id_MPORT_en = empty ? _GEN_17 : _do_enq_T;
  assign ram_addr_io_deq_bits_MPORT_en = 1'h1;
  assign ram_addr_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_addr_io_deq_bits_MPORT_data = ram_addr[ram_addr_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_addr_MPORT_data = io_enq_bits_addr;
  assign ram_addr_MPORT_addr = 1'h0;
  assign ram_addr_MPORT_mask = 1'h1;
  assign ram_addr_MPORT_en = empty ? _GEN_17 : _do_enq_T;
  assign ram_len_io_deq_bits_MPORT_en = 1'h1;
  assign ram_len_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_len_io_deq_bits_MPORT_data = ram_len[ram_len_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_len_MPORT_data = io_enq_bits_len;
  assign ram_len_MPORT_addr = 1'h0;
  assign ram_len_MPORT_mask = 1'h1;
  assign ram_len_MPORT_en = empty ? _GEN_17 : _do_enq_T;
  assign ram_size_io_deq_bits_MPORT_en = 1'h1;
  assign ram_size_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_size_io_deq_bits_MPORT_data = ram_size[ram_size_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_size_MPORT_data = io_enq_bits_size;
  assign ram_size_MPORT_addr = 1'h0;
  assign ram_size_MPORT_mask = 1'h1;
  assign ram_size_MPORT_en = empty ? _GEN_17 : _do_enq_T;
  assign ram_burst_io_deq_bits_MPORT_en = 1'h1;
  assign ram_burst_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_burst_io_deq_bits_MPORT_data = ram_burst[ram_burst_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_burst_MPORT_data = io_enq_bits_burst;
  assign ram_burst_MPORT_addr = 1'h0;
  assign ram_burst_MPORT_mask = 1'h1;
  assign ram_burst_MPORT_en = empty ? _GEN_17 : _do_enq_T;
  assign io_enq_ready = ~maybe_full; // @[Decoupled.scala 289:19]
  assign io_deq_valid = io_enq_valid | ~empty; // @[Decoupled.scala 288:16 300:{24,39}]
  assign io_deq_bits_id = empty ? io_enq_bits_id : ram_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17 301:17 302:19]
  assign io_deq_bits_addr = empty ? io_enq_bits_addr : ram_addr_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17 301:17 302:19]
  assign io_deq_bits_len = empty ? io_enq_bits_len : ram_len_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17 301:17 302:19]
  assign io_deq_bits_size = empty ? io_enq_bits_size : ram_size_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17 301:17 302:19]
  assign io_deq_bits_burst = empty ? io_enq_bits_burst : ram_burst_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17 301:17 302:19]
  always @(posedge clock) begin
    if (ram_id_MPORT_en & ram_id_MPORT_mask) begin
      ram_id[ram_id_MPORT_addr] <= ram_id_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_addr_MPORT_en & ram_addr_MPORT_mask) begin
      ram_addr[ram_addr_MPORT_addr] <= ram_addr_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_len_MPORT_en & ram_len_MPORT_mask) begin
      ram_len[ram_len_MPORT_addr] <= ram_len_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_size_MPORT_en & ram_size_MPORT_mask) begin
      ram_size[ram_size_MPORT_addr] <= ram_size_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_burst_MPORT_en & ram_burst_MPORT_mask) begin
      ram_burst[ram_burst_MPORT_addr] <= ram_burst_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (reset) begin // @[Decoupled.scala 262:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 262:27]
    end else if (do_enq != do_deq) begin
      if (empty) begin
        if (io_deq_ready) begin
          maybe_full <= 1'h0;
        end else begin
          maybe_full <= _do_enq_T;
        end
      end else begin
        maybe_full <= _do_enq_T;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_id[initvar] = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_addr[initvar] = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_len[initvar] = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_size[initvar] = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_burst[initvar] = _RAND_4[1:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  maybe_full = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AXI4Fragmenter_1_tb(
  input         clock,
  input         reset,
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input  [3:0]  auto_in_aw_bits_id,
  input  [31:0] auto_in_aw_bits_addr,
  input  [7:0]  auto_in_aw_bits_len,
  input  [2:0]  auto_in_aw_bits_size,
  input  [1:0]  auto_in_aw_bits_burst,
  output        auto_in_w_ready,
  input         auto_in_w_valid,
  input  [63:0] auto_in_w_bits_data,
  input  [7:0]  auto_in_w_bits_strb,
  input         auto_in_w_bits_last,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output [3:0]  auto_in_b_bits_id,
  output [1:0]  auto_in_b_bits_resp,
  output        auto_in_ar_ready,
  input         auto_in_ar_valid,
  input  [3:0]  auto_in_ar_bits_id,
  input  [31:0] auto_in_ar_bits_addr,
  input  [7:0]  auto_in_ar_bits_len,
  input  [2:0]  auto_in_ar_bits_size,
  input  [1:0]  auto_in_ar_bits_burst,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output [3:0]  auto_in_r_bits_id,
  output [63:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output        auto_in_r_bits_last,
  input         auto_out_aw_ready,
  output        auto_out_aw_valid,
  output [3:0]  auto_out_aw_bits_id,
  output [31:0] auto_out_aw_bits_addr,
  output        auto_out_aw_bits_echo_real_last,
  input         auto_out_w_ready,
  output        auto_out_w_valid,
  output [63:0] auto_out_w_bits_data,
  output [7:0]  auto_out_w_bits_strb,
  output        auto_out_b_ready,
  input         auto_out_b_valid,
  input  [3:0]  auto_out_b_bits_id,
  input  [1:0]  auto_out_b_bits_resp,
  input         auto_out_b_bits_echo_real_last,
  input         auto_out_ar_ready,
  output        auto_out_ar_valid,
  output [3:0]  auto_out_ar_bits_id,
  output [31:0] auto_out_ar_bits_addr,
  output        auto_out_ar_bits_echo_real_last,
  output        auto_out_r_ready,
  input         auto_out_r_valid,
  input  [3:0]  auto_out_r_bits_id,
  input  [63:0] auto_out_r_bits_data,
  input  [1:0]  auto_out_r_bits_resp,
  input         auto_out_r_bits_echo_real_last,
  input         auto_out_r_bits_last
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
`endif // RANDOMIZE_REG_INIT
  wire  deq_clock; // @[Decoupled.scala 361:21]
  wire  deq_reset; // @[Decoupled.scala 361:21]
  wire  deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] deq_io_enq_bits_id; // @[Decoupled.scala 361:21]
  wire [31:0] deq_io_enq_bits_addr; // @[Decoupled.scala 361:21]
  wire [7:0] deq_io_enq_bits_len; // @[Decoupled.scala 361:21]
  wire [2:0] deq_io_enq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] deq_io_enq_bits_burst; // @[Decoupled.scala 361:21]
  wire  deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] deq_io_deq_bits_id; // @[Decoupled.scala 361:21]
  wire [31:0] deq_io_deq_bits_addr; // @[Decoupled.scala 361:21]
  wire [7:0] deq_io_deq_bits_len; // @[Decoupled.scala 361:21]
  wire [2:0] deq_io_deq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] deq_io_deq_bits_burst; // @[Decoupled.scala 361:21]
  wire  deq_1_clock; // @[Decoupled.scala 361:21]
  wire  deq_1_reset; // @[Decoupled.scala 361:21]
  wire  deq_1_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  deq_1_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] deq_1_io_enq_bits_id; // @[Decoupled.scala 361:21]
  wire [31:0] deq_1_io_enq_bits_addr; // @[Decoupled.scala 361:21]
  wire [7:0] deq_1_io_enq_bits_len; // @[Decoupled.scala 361:21]
  wire [2:0] deq_1_io_enq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] deq_1_io_enq_bits_burst; // @[Decoupled.scala 361:21]
  wire  deq_1_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  deq_1_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] deq_1_io_deq_bits_id; // @[Decoupled.scala 361:21]
  wire [31:0] deq_1_io_deq_bits_addr; // @[Decoupled.scala 361:21]
  wire [7:0] deq_1_io_deq_bits_len; // @[Decoupled.scala 361:21]
  wire [2:0] deq_1_io_deq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] deq_1_io_deq_bits_burst; // @[Decoupled.scala 361:21]
  wire  in_w_deq_clock; // @[Decoupled.scala 361:21]
  wire  in_w_deq_reset; // @[Decoupled.scala 361:21]
  wire  in_w_deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  in_w_deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [63:0] in_w_deq_io_enq_bits_data; // @[Decoupled.scala 361:21]
  wire [7:0] in_w_deq_io_enq_bits_strb; // @[Decoupled.scala 361:21]
  wire  in_w_deq_io_enq_bits_last; // @[Decoupled.scala 361:21]
  wire  in_w_deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  in_w_deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [63:0] in_w_deq_io_deq_bits_data; // @[Decoupled.scala 361:21]
  wire [7:0] in_w_deq_io_deq_bits_strb; // @[Decoupled.scala 361:21]
  wire  in_w_deq_io_deq_bits_last; // @[Decoupled.scala 361:21]
  reg  busy; // @[Fragmenter.scala 60:29]
  reg [31:0] r_addr; // @[Fragmenter.scala 61:25]
  reg [7:0] r_len; // @[Fragmenter.scala 62:25]
  wire [7:0] irr_bits_len = deq_io_deq_bits_len; // @[Decoupled.scala 401:19 402:14]
  wire [7:0] len = busy ? r_len : irr_bits_len; // @[Fragmenter.scala 64:23]
  wire [31:0] irr_bits_addr = deq_io_deq_bits_addr; // @[Decoupled.scala 401:19 402:14]
  wire [31:0] addr = busy ? r_addr : irr_bits_addr; // @[Fragmenter.scala 65:23]
  wire [1:0] irr_bits_burst = deq_io_deq_bits_burst; // @[Decoupled.scala 401:19 402:14]
  wire  fixed = irr_bits_burst == 2'h0; // @[Fragmenter.scala 92:34]
  wire [2:0] irr_bits_size = deq_io_deq_bits_size; // @[Decoupled.scala 401:19 402:14]
  wire [15:0] _inc_addr_T = 16'h1 << irr_bits_size; // @[Fragmenter.scala 100:38]
  wire [31:0] _GEN_48 = {{16'd0}, _inc_addr_T}; // @[Fragmenter.scala 100:29]
  wire [31:0] inc_addr = addr + _GEN_48; // @[Fragmenter.scala 100:29]
  wire [15:0] _wrapMask_T = {irr_bits_len,8'hff}; // @[Cat.scala 31:58]
  wire [22:0] _GEN_0 = {{7'd0}, _wrapMask_T}; // @[Bundles.scala 31:21]
  wire [22:0] _wrapMask_T_1 = _GEN_0 << irr_bits_size; // @[Bundles.scala 31:21]
  wire [14:0] wrapMask = _wrapMask_T_1[22:8]; // @[Bundles.scala 31:30]
  wire [31:0] _GEN_49 = {{17'd0}, wrapMask}; // @[Fragmenter.scala 104:33]
  wire [31:0] _mux_addr_T = inc_addr & _GEN_49; // @[Fragmenter.scala 104:33]
  wire [31:0] _mux_addr_T_1 = ~irr_bits_addr; // @[Fragmenter.scala 104:49]
  wire [31:0] _mux_addr_T_2 = _mux_addr_T_1 | _GEN_49; // @[Fragmenter.scala 104:62]
  wire [31:0] _mux_addr_T_3 = ~_mux_addr_T_2; // @[Fragmenter.scala 104:47]
  wire [31:0] _mux_addr_T_4 = _mux_addr_T | _mux_addr_T_3; // @[Fragmenter.scala 104:45]
  wire  ar_last = 8'h0 == len; // @[Fragmenter.scala 110:27]
  wire [31:0] _out_bits_addr_T = ~addr; // @[Fragmenter.scala 122:28]
  wire [9:0] _out_bits_addr_T_2 = 10'h7 << irr_bits_size; // @[package.scala 234:77]
  wire [2:0] _out_bits_addr_T_4 = ~_out_bits_addr_T_2[2:0]; // @[package.scala 234:46]
  wire [31:0] _GEN_51 = {{29'd0}, _out_bits_addr_T_4}; // @[Fragmenter.scala 122:34]
  wire [31:0] _out_bits_addr_T_5 = _out_bits_addr_T | _GEN_51; // @[Fragmenter.scala 122:34]
  wire  irr_valid = deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  wire  _T_2 = auto_out_ar_ready & irr_valid; // @[Decoupled.scala 50:35]
  wire [8:0] _GEN_52 = {{1'd0}, len}; // @[Fragmenter.scala 127:25]
  wire [8:0] _r_len_T_1 = _GEN_52 - 9'h1; // @[Fragmenter.scala 127:25]
  wire [8:0] _GEN_4 = _T_2 ? _r_len_T_1 : {{1'd0}, r_len}; // @[Fragmenter.scala 124:27 127:18 62:25]
  reg  busy_1; // @[Fragmenter.scala 60:29]
  reg [31:0] r_addr_1; // @[Fragmenter.scala 61:25]
  reg [7:0] r_len_1; // @[Fragmenter.scala 62:25]
  wire [7:0] irr_1_bits_len = deq_1_io_deq_bits_len; // @[Decoupled.scala 401:19 402:14]
  wire [7:0] len_1 = busy_1 ? r_len_1 : irr_1_bits_len; // @[Fragmenter.scala 64:23]
  wire [31:0] irr_1_bits_addr = deq_1_io_deq_bits_addr; // @[Decoupled.scala 401:19 402:14]
  wire [31:0] addr_1 = busy_1 ? r_addr_1 : irr_1_bits_addr; // @[Fragmenter.scala 65:23]
  wire [1:0] irr_1_bits_burst = deq_1_io_deq_bits_burst; // @[Decoupled.scala 401:19 402:14]
  wire  fixed_1 = irr_1_bits_burst == 2'h0; // @[Fragmenter.scala 92:34]
  wire [2:0] irr_1_bits_size = deq_1_io_deq_bits_size; // @[Decoupled.scala 401:19 402:14]
  wire [15:0] _inc_addr_T_2 = 16'h1 << irr_1_bits_size; // @[Fragmenter.scala 100:38]
  wire [31:0] _GEN_57 = {{16'd0}, _inc_addr_T_2}; // @[Fragmenter.scala 100:29]
  wire [31:0] inc_addr_1 = addr_1 + _GEN_57; // @[Fragmenter.scala 100:29]
  wire [15:0] _wrapMask_T_2 = {irr_1_bits_len,8'hff}; // @[Cat.scala 31:58]
  wire [22:0] _GEN_2 = {{7'd0}, _wrapMask_T_2}; // @[Bundles.scala 31:21]
  wire [22:0] _wrapMask_T_3 = _GEN_2 << irr_1_bits_size; // @[Bundles.scala 31:21]
  wire [14:0] wrapMask_1 = _wrapMask_T_3[22:8]; // @[Bundles.scala 31:30]
  wire [31:0] _GEN_58 = {{17'd0}, wrapMask_1}; // @[Fragmenter.scala 104:33]
  wire [31:0] _mux_addr_T_5 = inc_addr_1 & _GEN_58; // @[Fragmenter.scala 104:33]
  wire [31:0] _mux_addr_T_6 = ~irr_1_bits_addr; // @[Fragmenter.scala 104:49]
  wire [31:0] _mux_addr_T_7 = _mux_addr_T_6 | _GEN_58; // @[Fragmenter.scala 104:62]
  wire [31:0] _mux_addr_T_8 = ~_mux_addr_T_7; // @[Fragmenter.scala 104:47]
  wire [31:0] _mux_addr_T_9 = _mux_addr_T_5 | _mux_addr_T_8; // @[Fragmenter.scala 104:45]
  wire  aw_last = 8'h0 == len_1; // @[Fragmenter.scala 110:27]
  reg [8:0] w_counter; // @[Fragmenter.scala 164:30]
  wire  w_idle = w_counter == 9'h0; // @[Fragmenter.scala 165:30]
  reg  wbeats_latched; // @[Fragmenter.scala 150:35]
  wire  _in_aw_ready_T = w_idle | wbeats_latched; // @[Fragmenter.scala 158:52]
  wire  in_aw_ready = auto_out_aw_ready & (w_idle | wbeats_latched); // @[Fragmenter.scala 158:35]
  wire [31:0] _out_bits_addr_T_7 = ~addr_1; // @[Fragmenter.scala 122:28]
  wire [9:0] _out_bits_addr_T_9 = 10'h7 << irr_1_bits_size; // @[package.scala 234:77]
  wire [2:0] _out_bits_addr_T_11 = ~_out_bits_addr_T_9[2:0]; // @[package.scala 234:46]
  wire [31:0] _GEN_60 = {{29'd0}, _out_bits_addr_T_11}; // @[Fragmenter.scala 122:34]
  wire [31:0] _out_bits_addr_T_12 = _out_bits_addr_T_7 | _GEN_60; // @[Fragmenter.scala 122:34]
  wire  irr_1_valid = deq_1_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  wire  _T_5 = in_aw_ready & irr_1_valid; // @[Decoupled.scala 50:35]
  wire [8:0] _GEN_61 = {{1'd0}, len_1}; // @[Fragmenter.scala 127:25]
  wire [8:0] _r_len_T_3 = _GEN_61 - 9'h1; // @[Fragmenter.scala 127:25]
  wire [8:0] _GEN_9 = _T_5 ? _r_len_T_3 : {{1'd0}, r_len_1}; // @[Fragmenter.scala 124:27 127:18 62:25]
  wire  wbeats_valid = irr_1_valid & ~wbeats_latched; // @[Fragmenter.scala 159:35]
  wire  _GEN_10 = wbeats_valid & w_idle | wbeats_latched; // @[Fragmenter.scala 150:35 153:{43,60}]
  wire  bundleOut_0_aw_valid = irr_1_valid & _in_aw_ready_T; // @[Fragmenter.scala 157:35]
  wire  _T_7 = auto_out_aw_ready & bundleOut_0_aw_valid; // @[Decoupled.scala 50:35]
  wire [8:0] _w_todo_T = wbeats_valid ? 9'h1 : 9'h0; // @[Fragmenter.scala 166:35]
  wire [8:0] w_todo = w_idle ? _w_todo_T : w_counter; // @[Fragmenter.scala 166:23]
  wire  w_last = w_todo == 9'h1; // @[Fragmenter.scala 167:27]
  wire  in_w_valid = in_w_deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  wire  _bundleOut_0_w_valid_T_1 = ~w_idle | wbeats_valid; // @[Fragmenter.scala 173:51]
  wire  bundleOut_0_w_valid = in_w_valid & (~w_idle | wbeats_valid); // @[Fragmenter.scala 173:33]
  wire  _w_counter_T = auto_out_w_ready & bundleOut_0_w_valid; // @[Decoupled.scala 50:35]
  wire [8:0] _GEN_62 = {{8'd0}, _w_counter_T}; // @[Fragmenter.scala 168:27]
  wire [8:0] _w_counter_T_2 = w_todo - _GEN_62; // @[Fragmenter.scala 168:27]
  wire  _T_13 = ~reset; // @[Fragmenter.scala 169:14]
  wire  in_w_bits_last = in_w_deq_io_deq_bits_last; // @[Decoupled.scala 401:19 402:14]
  wire  bundleOut_0_b_ready = auto_in_b_ready | ~auto_out_b_bits_echo_real_last; // @[Fragmenter.scala 189:33]
  reg [1:0] error_0; // @[Fragmenter.scala 192:26]
  reg [1:0] error_1; // @[Fragmenter.scala 192:26]
  reg [1:0] error_2; // @[Fragmenter.scala 192:26]
  reg [1:0] error_3; // @[Fragmenter.scala 192:26]
  reg [1:0] error_4; // @[Fragmenter.scala 192:26]
  reg [1:0] error_5; // @[Fragmenter.scala 192:26]
  reg [1:0] error_6; // @[Fragmenter.scala 192:26]
  reg [1:0] error_7; // @[Fragmenter.scala 192:26]
  reg [1:0] error_8; // @[Fragmenter.scala 192:26]
  reg [1:0] error_9; // @[Fragmenter.scala 192:26]
  reg [1:0] error_10; // @[Fragmenter.scala 192:26]
  reg [1:0] error_11; // @[Fragmenter.scala 192:26]
  reg [1:0] error_12; // @[Fragmenter.scala 192:26]
  reg [1:0] error_13; // @[Fragmenter.scala 192:26]
  reg [1:0] error_14; // @[Fragmenter.scala 192:26]
  reg [1:0] error_15; // @[Fragmenter.scala 192:26]
  wire [1:0] _GEN_13 = 4'h1 == auto_out_b_bits_id ? error_1 : error_0; // @[Fragmenter.scala 193:{41,41}]
  wire [1:0] _GEN_14 = 4'h2 == auto_out_b_bits_id ? error_2 : _GEN_13; // @[Fragmenter.scala 193:{41,41}]
  wire [1:0] _GEN_15 = 4'h3 == auto_out_b_bits_id ? error_3 : _GEN_14; // @[Fragmenter.scala 193:{41,41}]
  wire [1:0] _GEN_16 = 4'h4 == auto_out_b_bits_id ? error_4 : _GEN_15; // @[Fragmenter.scala 193:{41,41}]
  wire [1:0] _GEN_17 = 4'h5 == auto_out_b_bits_id ? error_5 : _GEN_16; // @[Fragmenter.scala 193:{41,41}]
  wire [1:0] _GEN_18 = 4'h6 == auto_out_b_bits_id ? error_6 : _GEN_17; // @[Fragmenter.scala 193:{41,41}]
  wire [1:0] _GEN_19 = 4'h7 == auto_out_b_bits_id ? error_7 : _GEN_18; // @[Fragmenter.scala 193:{41,41}]
  wire [1:0] _GEN_20 = 4'h8 == auto_out_b_bits_id ? error_8 : _GEN_19; // @[Fragmenter.scala 193:{41,41}]
  wire [1:0] _GEN_21 = 4'h9 == auto_out_b_bits_id ? error_9 : _GEN_20; // @[Fragmenter.scala 193:{41,41}]
  wire [1:0] _GEN_22 = 4'ha == auto_out_b_bits_id ? error_10 : _GEN_21; // @[Fragmenter.scala 193:{41,41}]
  wire [1:0] _GEN_23 = 4'hb == auto_out_b_bits_id ? error_11 : _GEN_22; // @[Fragmenter.scala 193:{41,41}]
  wire [1:0] _GEN_24 = 4'hc == auto_out_b_bits_id ? error_12 : _GEN_23; // @[Fragmenter.scala 193:{41,41}]
  wire [1:0] _GEN_25 = 4'hd == auto_out_b_bits_id ? error_13 : _GEN_24; // @[Fragmenter.scala 193:{41,41}]
  wire [1:0] _GEN_26 = 4'he == auto_out_b_bits_id ? error_14 : _GEN_25; // @[Fragmenter.scala 193:{41,41}]
  wire [1:0] _GEN_27 = 4'hf == auto_out_b_bits_id ? error_15 : _GEN_26; // @[Fragmenter.scala 193:{41,41}]
  wire [15:0] _T_22 = 16'h1 << auto_out_b_bits_id; // @[OneHot.scala 64:12]
  wire  _T_40 = bundleOut_0_b_ready & auto_out_b_valid; // @[Decoupled.scala 50:35]
  wire [1:0] _error_0_T = error_0 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70]
  wire [1:0] _error_1_T = error_1 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70]
  wire [1:0] _error_2_T = error_2 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70]
  wire [1:0] _error_3_T = error_3 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70]
  wire [1:0] _error_4_T = error_4 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70]
  wire [1:0] _error_5_T = error_5 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70]
  wire [1:0] _error_6_T = error_6 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70]
  wire [1:0] _error_7_T = error_7 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70]
  wire [1:0] _error_8_T = error_8 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70]
  wire [1:0] _error_9_T = error_9 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70]
  wire [1:0] _error_10_T = error_10 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70]
  wire [1:0] _error_11_T = error_11 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70]
  wire [1:0] _error_12_T = error_12 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70]
  wire [1:0] _error_13_T = error_13 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70]
  wire [1:0] _error_14_T = error_14 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70]
  wire [1:0] _error_15_T = error_15 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70]
  Queue_41_tb deq ( // @[Decoupled.scala 361:21]
    .clock(deq_clock),
    .reset(deq_reset),
    .io_enq_ready(deq_io_enq_ready),
    .io_enq_valid(deq_io_enq_valid),
    .io_enq_bits_id(deq_io_enq_bits_id),
    .io_enq_bits_addr(deq_io_enq_bits_addr),
    .io_enq_bits_len(deq_io_enq_bits_len),
    .io_enq_bits_size(deq_io_enq_bits_size),
    .io_enq_bits_burst(deq_io_enq_bits_burst),
    .io_deq_ready(deq_io_deq_ready),
    .io_deq_valid(deq_io_deq_valid),
    .io_deq_bits_id(deq_io_deq_bits_id),
    .io_deq_bits_addr(deq_io_deq_bits_addr),
    .io_deq_bits_len(deq_io_deq_bits_len),
    .io_deq_bits_size(deq_io_deq_bits_size),
    .io_deq_bits_burst(deq_io_deq_bits_burst)
  );
  Queue_41_tb deq_1 ( // @[Decoupled.scala 361:21]
    .clock(deq_1_clock),
    .reset(deq_1_reset),
    .io_enq_ready(deq_1_io_enq_ready),
    .io_enq_valid(deq_1_io_enq_valid),
    .io_enq_bits_id(deq_1_io_enq_bits_id),
    .io_enq_bits_addr(deq_1_io_enq_bits_addr),
    .io_enq_bits_len(deq_1_io_enq_bits_len),
    .io_enq_bits_size(deq_1_io_enq_bits_size),
    .io_enq_bits_burst(deq_1_io_enq_bits_burst),
    .io_deq_ready(deq_1_io_deq_ready),
    .io_deq_valid(deq_1_io_deq_valid),
    .io_deq_bits_id(deq_1_io_deq_bits_id),
    .io_deq_bits_addr(deq_1_io_deq_bits_addr),
    .io_deq_bits_len(deq_1_io_deq_bits_len),
    .io_deq_bits_size(deq_1_io_deq_bits_size),
    .io_deq_bits_burst(deq_1_io_deq_bits_burst)
  );
  Queue_12_tb in_w_deq ( // @[Decoupled.scala 361:21]
    .clock(in_w_deq_clock),
    .reset(in_w_deq_reset),
    .io_enq_ready(in_w_deq_io_enq_ready),
    .io_enq_valid(in_w_deq_io_enq_valid),
    .io_enq_bits_data(in_w_deq_io_enq_bits_data),
    .io_enq_bits_strb(in_w_deq_io_enq_bits_strb),
    .io_enq_bits_last(in_w_deq_io_enq_bits_last),
    .io_deq_ready(in_w_deq_io_deq_ready),
    .io_deq_valid(in_w_deq_io_deq_valid),
    .io_deq_bits_data(in_w_deq_io_deq_bits_data),
    .io_deq_bits_strb(in_w_deq_io_deq_bits_strb),
    .io_deq_bits_last(in_w_deq_io_deq_bits_last)
  );
  assign auto_in_aw_ready = deq_1_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign auto_in_w_ready = in_w_deq_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign auto_in_b_valid = auto_out_b_valid & auto_out_b_bits_echo_real_last; // @[Fragmenter.scala 188:33]
  assign auto_in_b_bits_id = auto_out_b_bits_id; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_b_bits_resp = auto_out_b_bits_resp | _GEN_27; // @[Fragmenter.scala 193:41]
  assign auto_in_ar_ready = deq_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign auto_in_r_valid = auto_out_r_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_r_bits_id = auto_out_r_bits_id; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_r_bits_data = auto_out_r_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_r_bits_resp = auto_out_r_bits_resp; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_r_bits_last = auto_out_r_bits_last & auto_out_r_bits_echo_real_last; // @[Fragmenter.scala 183:41]
  assign auto_out_aw_valid = irr_1_valid & _in_aw_ready_T; // @[Fragmenter.scala 157:35]
  assign auto_out_aw_bits_id = deq_1_io_deq_bits_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_addr = ~_out_bits_addr_T_12; // @[Fragmenter.scala 122:26]
  assign auto_out_aw_bits_echo_real_last = 8'h0 == len_1; // @[Fragmenter.scala 110:27]
  assign auto_out_w_valid = in_w_valid & (~w_idle | wbeats_valid); // @[Fragmenter.scala 173:33]
  assign auto_out_w_bits_data = in_w_deq_io_deq_bits_data; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_w_bits_strb = in_w_deq_io_deq_bits_strb; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_b_ready = auto_in_b_ready | ~auto_out_b_bits_echo_real_last; // @[Fragmenter.scala 189:33]
  assign auto_out_ar_valid = deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  assign auto_out_ar_bits_id = deq_io_deq_bits_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_addr = ~_out_bits_addr_T_5; // @[Fragmenter.scala 122:26]
  assign auto_out_ar_bits_echo_real_last = 8'h0 == len; // @[Fragmenter.scala 110:27]
  assign auto_out_r_ready = auto_in_r_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_clock = clock;
  assign deq_reset = reset;
  assign deq_io_enq_valid = auto_in_ar_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_io_enq_bits_id = auto_in_ar_bits_id; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_io_enq_bits_addr = auto_in_ar_bits_addr; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_io_enq_bits_len = auto_in_ar_bits_len; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_io_enq_bits_size = auto_in_ar_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_io_enq_bits_burst = auto_in_ar_bits_burst; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_io_deq_ready = auto_out_ar_ready & ar_last; // @[Fragmenter.scala 111:30]
  assign deq_1_clock = clock;
  assign deq_1_reset = reset;
  assign deq_1_io_enq_valid = auto_in_aw_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_1_io_enq_bits_id = auto_in_aw_bits_id; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_1_io_enq_bits_addr = auto_in_aw_bits_addr; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_1_io_enq_bits_len = auto_in_aw_bits_len; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_1_io_enq_bits_size = auto_in_aw_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_1_io_enq_bits_burst = auto_in_aw_bits_burst; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_1_io_deq_ready = in_aw_ready & aw_last; // @[Fragmenter.scala 111:30]
  assign in_w_deq_clock = clock;
  assign in_w_deq_reset = reset;
  assign in_w_deq_io_enq_valid = auto_in_w_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign in_w_deq_io_enq_bits_data = auto_in_w_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign in_w_deq_io_enq_bits_strb = auto_in_w_bits_strb; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign in_w_deq_io_enq_bits_last = auto_in_w_bits_last; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign in_w_deq_io_deq_ready = auto_out_w_ready & _bundleOut_0_w_valid_T_1; // @[Fragmenter.scala 174:33]
  always @(posedge clock) begin
    if (reset) begin // @[Fragmenter.scala 60:29]
      busy <= 1'h0; // @[Fragmenter.scala 60:29]
    end else if (_T_2) begin
      busy <= ~ar_last;
    end
    if (_T_2) begin // @[Fragmenter.scala 124:27]
      if (fixed) begin
        r_addr <= irr_bits_addr;
      end else if (irr_bits_burst == 2'h2) begin
        r_addr <= _mux_addr_T_4;
      end else begin
        r_addr <= inc_addr;
      end
    end
    r_len <= _GEN_4[7:0];
    if (reset) begin // @[Fragmenter.scala 60:29]
      busy_1 <= 1'h0; // @[Fragmenter.scala 60:29]
    end else if (_T_5) begin
      busy_1 <= ~aw_last;
    end
    if (_T_5) begin // @[Fragmenter.scala 124:27]
      if (fixed_1) begin
        r_addr_1 <= irr_1_bits_addr;
      end else if (irr_1_bits_burst == 2'h2) begin
        r_addr_1 <= _mux_addr_T_9;
      end else begin
        r_addr_1 <= inc_addr_1;
      end
    end
    r_len_1 <= _GEN_9[7:0];
    if (reset) begin // @[Fragmenter.scala 164:30]
      w_counter <= 9'h0; // @[Fragmenter.scala 164:30]
    end else begin
      w_counter <= _w_counter_T_2; // @[Fragmenter.scala 168:17]
    end
    if (reset) begin // @[Fragmenter.scala 150:35]
      wbeats_latched <= 1'h0; // @[Fragmenter.scala 150:35]
    end else if (_T_7) begin
      wbeats_latched <= 1'h0;
    end else begin
      wbeats_latched <= _GEN_10;
    end
    if (reset) begin // @[Fragmenter.scala 192:26]
      error_0 <= 2'h0; // @[Fragmenter.scala 192:26]
    end else if (_T_22[0] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_0 <= 2'h0;
      end else begin
        error_0 <= _error_0_T;
      end
    end
    if (reset) begin // @[Fragmenter.scala 192:26]
      error_1 <= 2'h0; // @[Fragmenter.scala 192:26]
    end else if (_T_22[1] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_1 <= 2'h0;
      end else begin
        error_1 <= _error_1_T;
      end
    end
    if (reset) begin // @[Fragmenter.scala 192:26]
      error_2 <= 2'h0; // @[Fragmenter.scala 192:26]
    end else if (_T_22[2] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_2 <= 2'h0;
      end else begin
        error_2 <= _error_2_T;
      end
    end
    if (reset) begin // @[Fragmenter.scala 192:26]
      error_3 <= 2'h0; // @[Fragmenter.scala 192:26]
    end else if (_T_22[3] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_3 <= 2'h0;
      end else begin
        error_3 <= _error_3_T;
      end
    end
    if (reset) begin // @[Fragmenter.scala 192:26]
      error_4 <= 2'h0; // @[Fragmenter.scala 192:26]
    end else if (_T_22[4] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_4 <= 2'h0;
      end else begin
        error_4 <= _error_4_T;
      end
    end
    if (reset) begin // @[Fragmenter.scala 192:26]
      error_5 <= 2'h0; // @[Fragmenter.scala 192:26]
    end else if (_T_22[5] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_5 <= 2'h0;
      end else begin
        error_5 <= _error_5_T;
      end
    end
    if (reset) begin // @[Fragmenter.scala 192:26]
      error_6 <= 2'h0; // @[Fragmenter.scala 192:26]
    end else if (_T_22[6] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_6 <= 2'h0;
      end else begin
        error_6 <= _error_6_T;
      end
    end
    if (reset) begin // @[Fragmenter.scala 192:26]
      error_7 <= 2'h0; // @[Fragmenter.scala 192:26]
    end else if (_T_22[7] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_7 <= 2'h0;
      end else begin
        error_7 <= _error_7_T;
      end
    end
    if (reset) begin // @[Fragmenter.scala 192:26]
      error_8 <= 2'h0; // @[Fragmenter.scala 192:26]
    end else if (_T_22[8] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_8 <= 2'h0;
      end else begin
        error_8 <= _error_8_T;
      end
    end
    if (reset) begin // @[Fragmenter.scala 192:26]
      error_9 <= 2'h0; // @[Fragmenter.scala 192:26]
    end else if (_T_22[9] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_9 <= 2'h0;
      end else begin
        error_9 <= _error_9_T;
      end
    end
    if (reset) begin // @[Fragmenter.scala 192:26]
      error_10 <= 2'h0; // @[Fragmenter.scala 192:26]
    end else if (_T_22[10] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_10 <= 2'h0;
      end else begin
        error_10 <= _error_10_T;
      end
    end
    if (reset) begin // @[Fragmenter.scala 192:26]
      error_11 <= 2'h0; // @[Fragmenter.scala 192:26]
    end else if (_T_22[11] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_11 <= 2'h0;
      end else begin
        error_11 <= _error_11_T;
      end
    end
    if (reset) begin // @[Fragmenter.scala 192:26]
      error_12 <= 2'h0; // @[Fragmenter.scala 192:26]
    end else if (_T_22[12] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_12 <= 2'h0;
      end else begin
        error_12 <= _error_12_T;
      end
    end
    if (reset) begin // @[Fragmenter.scala 192:26]
      error_13 <= 2'h0; // @[Fragmenter.scala 192:26]
    end else if (_T_22[13] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_13 <= 2'h0;
      end else begin
        error_13 <= _error_13_T;
      end
    end
    if (reset) begin // @[Fragmenter.scala 192:26]
      error_14 <= 2'h0; // @[Fragmenter.scala 192:26]
    end else if (_T_22[14] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_14 <= 2'h0;
      end else begin
        error_14 <= _error_14_T;
      end
    end
    if (reset) begin // @[Fragmenter.scala 192:26]
      error_15 <= 2'h0; // @[Fragmenter.scala 192:26]
    end else if (_T_22[15] & _T_40) begin
      if (auto_out_b_bits_echo_real_last) begin
        error_15 <= 2'h0;
      end else begin
        error_15 <= _error_15_T;
      end
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_w_counter_T | w_todo != 9'h0) & ~reset) begin
          $fatal; // @[Fragmenter.scala 169:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~_w_counter_T | w_todo != 9'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Fragmenter.scala:169 assert (!out.w.fire() || w_todo =/= UInt(0)) // underflow impossible\n"
            ); // @[Fragmenter.scala 169:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~bundleOut_0_w_valid | ~in_w_bits_last | w_last) & _T_13) begin
          $fatal; // @[Fragmenter.scala 178:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13 & ~(~bundleOut_0_w_valid | ~in_w_bits_last | w_last)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Fragmenter.scala:178 assert (!out.w.valid || !in_w.bits.last || w_last)\n"); // @[Fragmenter.scala 178:14]
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
  busy = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  r_addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  r_len = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  busy_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  r_addr_1 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  r_len_1 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  w_counter = _RAND_6[8:0];
  _RAND_7 = {1{`RANDOM}};
  wbeats_latched = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  error_0 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  error_1 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  error_2 = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  error_3 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  error_4 = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  error_5 = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  error_6 = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  error_7 = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  error_8 = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  error_9 = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  error_10 = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  error_11 = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  error_12 = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  error_13 = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  error_14 = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  error_15 = _RAND_23[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SimAXIMem_tb(
  input         clock,
  input         reset,
  output        io_axi4_0_aw_ready,
  input         io_axi4_0_aw_valid,
  input  [3:0]  io_axi4_0_aw_bits_id,
  input  [31:0] io_axi4_0_aw_bits_addr,
  input  [7:0]  io_axi4_0_aw_bits_len,
  input  [2:0]  io_axi4_0_aw_bits_size,
  input  [1:0]  io_axi4_0_aw_bits_burst,
  output        io_axi4_0_w_ready,
  input         io_axi4_0_w_valid,
  input  [63:0] io_axi4_0_w_bits_data,
  input  [7:0]  io_axi4_0_w_bits_strb,
  input         io_axi4_0_w_bits_last,
  input         io_axi4_0_b_ready,
  output        io_axi4_0_b_valid,
  output [3:0]  io_axi4_0_b_bits_id,
  output [1:0]  io_axi4_0_b_bits_resp,
  output        io_axi4_0_ar_ready,
  input         io_axi4_0_ar_valid,
  input  [3:0]  io_axi4_0_ar_bits_id,
  input  [31:0] io_axi4_0_ar_bits_addr,
  input  [7:0]  io_axi4_0_ar_bits_len,
  input  [2:0]  io_axi4_0_ar_bits_size,
  input  [1:0]  io_axi4_0_ar_bits_burst,
  input         io_axi4_0_r_ready,
  output        io_axi4_0_r_valid,
  output [3:0]  io_axi4_0_r_bits_id,
  output [63:0] io_axi4_0_r_bits_data,
  output [1:0]  io_axi4_0_r_bits_resp,
  output        io_axi4_0_r_bits_last
);
  wire  srams_clock; // @[SimAXIMem.scala 16:15]
  wire  srams_reset; // @[SimAXIMem.scala 16:15]
  wire  srams_auto_in_aw_ready; // @[SimAXIMem.scala 16:15]
  wire  srams_auto_in_aw_valid; // @[SimAXIMem.scala 16:15]
  wire [3:0] srams_auto_in_aw_bits_id; // @[SimAXIMem.scala 16:15]
  wire [31:0] srams_auto_in_aw_bits_addr; // @[SimAXIMem.scala 16:15]
  wire  srams_auto_in_aw_bits_echo_real_last; // @[SimAXIMem.scala 16:15]
  wire  srams_auto_in_w_ready; // @[SimAXIMem.scala 16:15]
  wire  srams_auto_in_w_valid; // @[SimAXIMem.scala 16:15]
  wire [63:0] srams_auto_in_w_bits_data; // @[SimAXIMem.scala 16:15]
  wire [7:0] srams_auto_in_w_bits_strb; // @[SimAXIMem.scala 16:15]
  wire  srams_auto_in_b_ready; // @[SimAXIMem.scala 16:15]
  wire  srams_auto_in_b_valid; // @[SimAXIMem.scala 16:15]
  wire [3:0] srams_auto_in_b_bits_id; // @[SimAXIMem.scala 16:15]
  wire [1:0] srams_auto_in_b_bits_resp; // @[SimAXIMem.scala 16:15]
  wire  srams_auto_in_b_bits_echo_real_last; // @[SimAXIMem.scala 16:15]
  wire  srams_auto_in_ar_ready; // @[SimAXIMem.scala 16:15]
  wire  srams_auto_in_ar_valid; // @[SimAXIMem.scala 16:15]
  wire [3:0] srams_auto_in_ar_bits_id; // @[SimAXIMem.scala 16:15]
  wire [31:0] srams_auto_in_ar_bits_addr; // @[SimAXIMem.scala 16:15]
  wire  srams_auto_in_ar_bits_echo_real_last; // @[SimAXIMem.scala 16:15]
  wire  srams_auto_in_r_ready; // @[SimAXIMem.scala 16:15]
  wire  srams_auto_in_r_valid; // @[SimAXIMem.scala 16:15]
  wire [3:0] srams_auto_in_r_bits_id; // @[SimAXIMem.scala 16:15]
  wire [63:0] srams_auto_in_r_bits_data; // @[SimAXIMem.scala 16:15]
  wire [1:0] srams_auto_in_r_bits_resp; // @[SimAXIMem.scala 16:15]
  wire  srams_auto_in_r_bits_echo_real_last; // @[SimAXIMem.scala 16:15]
  wire  axi4xbar_clock; // @[Xbar.scala 218:30]
  wire  axi4xbar_reset; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_in_aw_ready; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_in_aw_valid; // @[Xbar.scala 218:30]
  wire [3:0] axi4xbar_auto_in_aw_bits_id; // @[Xbar.scala 218:30]
  wire [31:0] axi4xbar_auto_in_aw_bits_addr; // @[Xbar.scala 218:30]
  wire [7:0] axi4xbar_auto_in_aw_bits_len; // @[Xbar.scala 218:30]
  wire [2:0] axi4xbar_auto_in_aw_bits_size; // @[Xbar.scala 218:30]
  wire [1:0] axi4xbar_auto_in_aw_bits_burst; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_in_w_ready; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_in_w_valid; // @[Xbar.scala 218:30]
  wire [63:0] axi4xbar_auto_in_w_bits_data; // @[Xbar.scala 218:30]
  wire [7:0] axi4xbar_auto_in_w_bits_strb; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_in_w_bits_last; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_in_b_ready; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_in_b_valid; // @[Xbar.scala 218:30]
  wire [3:0] axi4xbar_auto_in_b_bits_id; // @[Xbar.scala 218:30]
  wire [1:0] axi4xbar_auto_in_b_bits_resp; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_in_ar_ready; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_in_ar_valid; // @[Xbar.scala 218:30]
  wire [3:0] axi4xbar_auto_in_ar_bits_id; // @[Xbar.scala 218:30]
  wire [31:0] axi4xbar_auto_in_ar_bits_addr; // @[Xbar.scala 218:30]
  wire [7:0] axi4xbar_auto_in_ar_bits_len; // @[Xbar.scala 218:30]
  wire [2:0] axi4xbar_auto_in_ar_bits_size; // @[Xbar.scala 218:30]
  wire [1:0] axi4xbar_auto_in_ar_bits_burst; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_in_r_ready; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_in_r_valid; // @[Xbar.scala 218:30]
  wire [3:0] axi4xbar_auto_in_r_bits_id; // @[Xbar.scala 218:30]
  wire [63:0] axi4xbar_auto_in_r_bits_data; // @[Xbar.scala 218:30]
  wire [1:0] axi4xbar_auto_in_r_bits_resp; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_in_r_bits_last; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_out_aw_ready; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_out_aw_valid; // @[Xbar.scala 218:30]
  wire [3:0] axi4xbar_auto_out_aw_bits_id; // @[Xbar.scala 218:30]
  wire [31:0] axi4xbar_auto_out_aw_bits_addr; // @[Xbar.scala 218:30]
  wire [7:0] axi4xbar_auto_out_aw_bits_len; // @[Xbar.scala 218:30]
  wire [2:0] axi4xbar_auto_out_aw_bits_size; // @[Xbar.scala 218:30]
  wire [1:0] axi4xbar_auto_out_aw_bits_burst; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_out_w_ready; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_out_w_valid; // @[Xbar.scala 218:30]
  wire [63:0] axi4xbar_auto_out_w_bits_data; // @[Xbar.scala 218:30]
  wire [7:0] axi4xbar_auto_out_w_bits_strb; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_out_w_bits_last; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_out_b_ready; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_out_b_valid; // @[Xbar.scala 218:30]
  wire [3:0] axi4xbar_auto_out_b_bits_id; // @[Xbar.scala 218:30]
  wire [1:0] axi4xbar_auto_out_b_bits_resp; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_out_ar_ready; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_out_ar_valid; // @[Xbar.scala 218:30]
  wire [3:0] axi4xbar_auto_out_ar_bits_id; // @[Xbar.scala 218:30]
  wire [31:0] axi4xbar_auto_out_ar_bits_addr; // @[Xbar.scala 218:30]
  wire [7:0] axi4xbar_auto_out_ar_bits_len; // @[Xbar.scala 218:30]
  wire [2:0] axi4xbar_auto_out_ar_bits_size; // @[Xbar.scala 218:30]
  wire [1:0] axi4xbar_auto_out_ar_bits_burst; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_out_r_ready; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_out_r_valid; // @[Xbar.scala 218:30]
  wire [3:0] axi4xbar_auto_out_r_bits_id; // @[Xbar.scala 218:30]
  wire [63:0] axi4xbar_auto_out_r_bits_data; // @[Xbar.scala 218:30]
  wire [1:0] axi4xbar_auto_out_r_bits_resp; // @[Xbar.scala 218:30]
  wire  axi4xbar_auto_out_r_bits_last; // @[Xbar.scala 218:30]
  wire  axi4buf_clock; // @[Buffer.scala 58:29]
  wire  axi4buf_reset; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_in_aw_ready; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_in_aw_valid; // @[Buffer.scala 58:29]
  wire [3:0] axi4buf_auto_in_aw_bits_id; // @[Buffer.scala 58:29]
  wire [31:0] axi4buf_auto_in_aw_bits_addr; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_in_aw_bits_echo_real_last; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_in_w_ready; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_in_w_valid; // @[Buffer.scala 58:29]
  wire [63:0] axi4buf_auto_in_w_bits_data; // @[Buffer.scala 58:29]
  wire [7:0] axi4buf_auto_in_w_bits_strb; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_in_b_ready; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_in_b_valid; // @[Buffer.scala 58:29]
  wire [3:0] axi4buf_auto_in_b_bits_id; // @[Buffer.scala 58:29]
  wire [1:0] axi4buf_auto_in_b_bits_resp; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_in_b_bits_echo_real_last; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_in_ar_ready; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_in_ar_valid; // @[Buffer.scala 58:29]
  wire [3:0] axi4buf_auto_in_ar_bits_id; // @[Buffer.scala 58:29]
  wire [31:0] axi4buf_auto_in_ar_bits_addr; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_in_ar_bits_echo_real_last; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_in_r_ready; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_in_r_valid; // @[Buffer.scala 58:29]
  wire [3:0] axi4buf_auto_in_r_bits_id; // @[Buffer.scala 58:29]
  wire [63:0] axi4buf_auto_in_r_bits_data; // @[Buffer.scala 58:29]
  wire [1:0] axi4buf_auto_in_r_bits_resp; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_in_r_bits_echo_real_last; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_in_r_bits_last; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_out_aw_ready; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_out_aw_valid; // @[Buffer.scala 58:29]
  wire [3:0] axi4buf_auto_out_aw_bits_id; // @[Buffer.scala 58:29]
  wire [31:0] axi4buf_auto_out_aw_bits_addr; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_out_aw_bits_echo_real_last; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_out_w_ready; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_out_w_valid; // @[Buffer.scala 58:29]
  wire [63:0] axi4buf_auto_out_w_bits_data; // @[Buffer.scala 58:29]
  wire [7:0] axi4buf_auto_out_w_bits_strb; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_out_b_ready; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_out_b_valid; // @[Buffer.scala 58:29]
  wire [3:0] axi4buf_auto_out_b_bits_id; // @[Buffer.scala 58:29]
  wire [1:0] axi4buf_auto_out_b_bits_resp; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_out_b_bits_echo_real_last; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_out_ar_ready; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_out_ar_valid; // @[Buffer.scala 58:29]
  wire [3:0] axi4buf_auto_out_ar_bits_id; // @[Buffer.scala 58:29]
  wire [31:0] axi4buf_auto_out_ar_bits_addr; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_out_ar_bits_echo_real_last; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_out_r_ready; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_out_r_valid; // @[Buffer.scala 58:29]
  wire [3:0] axi4buf_auto_out_r_bits_id; // @[Buffer.scala 58:29]
  wire [63:0] axi4buf_auto_out_r_bits_data; // @[Buffer.scala 58:29]
  wire [1:0] axi4buf_auto_out_r_bits_resp; // @[Buffer.scala 58:29]
  wire  axi4buf_auto_out_r_bits_echo_real_last; // @[Buffer.scala 58:29]
  wire  axi4frag_clock; // @[Fragmenter.scala 205:30]
  wire  axi4frag_reset; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_in_aw_ready; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_in_aw_valid; // @[Fragmenter.scala 205:30]
  wire [3:0] axi4frag_auto_in_aw_bits_id; // @[Fragmenter.scala 205:30]
  wire [31:0] axi4frag_auto_in_aw_bits_addr; // @[Fragmenter.scala 205:30]
  wire [7:0] axi4frag_auto_in_aw_bits_len; // @[Fragmenter.scala 205:30]
  wire [2:0] axi4frag_auto_in_aw_bits_size; // @[Fragmenter.scala 205:30]
  wire [1:0] axi4frag_auto_in_aw_bits_burst; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_in_w_ready; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_in_w_valid; // @[Fragmenter.scala 205:30]
  wire [63:0] axi4frag_auto_in_w_bits_data; // @[Fragmenter.scala 205:30]
  wire [7:0] axi4frag_auto_in_w_bits_strb; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_in_w_bits_last; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_in_b_ready; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_in_b_valid; // @[Fragmenter.scala 205:30]
  wire [3:0] axi4frag_auto_in_b_bits_id; // @[Fragmenter.scala 205:30]
  wire [1:0] axi4frag_auto_in_b_bits_resp; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_in_ar_ready; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_in_ar_valid; // @[Fragmenter.scala 205:30]
  wire [3:0] axi4frag_auto_in_ar_bits_id; // @[Fragmenter.scala 205:30]
  wire [31:0] axi4frag_auto_in_ar_bits_addr; // @[Fragmenter.scala 205:30]
  wire [7:0] axi4frag_auto_in_ar_bits_len; // @[Fragmenter.scala 205:30]
  wire [2:0] axi4frag_auto_in_ar_bits_size; // @[Fragmenter.scala 205:30]
  wire [1:0] axi4frag_auto_in_ar_bits_burst; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_in_r_ready; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_in_r_valid; // @[Fragmenter.scala 205:30]
  wire [3:0] axi4frag_auto_in_r_bits_id; // @[Fragmenter.scala 205:30]
  wire [63:0] axi4frag_auto_in_r_bits_data; // @[Fragmenter.scala 205:30]
  wire [1:0] axi4frag_auto_in_r_bits_resp; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_in_r_bits_last; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_out_aw_ready; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_out_aw_valid; // @[Fragmenter.scala 205:30]
  wire [3:0] axi4frag_auto_out_aw_bits_id; // @[Fragmenter.scala 205:30]
  wire [31:0] axi4frag_auto_out_aw_bits_addr; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_out_aw_bits_echo_real_last; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_out_w_ready; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_out_w_valid; // @[Fragmenter.scala 205:30]
  wire [63:0] axi4frag_auto_out_w_bits_data; // @[Fragmenter.scala 205:30]
  wire [7:0] axi4frag_auto_out_w_bits_strb; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_out_b_ready; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_out_b_valid; // @[Fragmenter.scala 205:30]
  wire [3:0] axi4frag_auto_out_b_bits_id; // @[Fragmenter.scala 205:30]
  wire [1:0] axi4frag_auto_out_b_bits_resp; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_out_b_bits_echo_real_last; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_out_ar_ready; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_out_ar_valid; // @[Fragmenter.scala 205:30]
  wire [3:0] axi4frag_auto_out_ar_bits_id; // @[Fragmenter.scala 205:30]
  wire [31:0] axi4frag_auto_out_ar_bits_addr; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_out_ar_bits_echo_real_last; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_out_r_ready; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_out_r_valid; // @[Fragmenter.scala 205:30]
  wire [3:0] axi4frag_auto_out_r_bits_id; // @[Fragmenter.scala 205:30]
  wire [63:0] axi4frag_auto_out_r_bits_data; // @[Fragmenter.scala 205:30]
  wire [1:0] axi4frag_auto_out_r_bits_resp; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_out_r_bits_echo_real_last; // @[Fragmenter.scala 205:30]
  wire  axi4frag_auto_out_r_bits_last; // @[Fragmenter.scala 205:30]
  AXI4RAM_tb srams ( // @[SimAXIMem.scala 16:15]
    .clock(srams_clock),
    .reset(srams_reset),
    .auto_in_aw_ready(srams_auto_in_aw_ready),
    .auto_in_aw_valid(srams_auto_in_aw_valid),
    .auto_in_aw_bits_id(srams_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(srams_auto_in_aw_bits_addr),
    .auto_in_aw_bits_echo_real_last(srams_auto_in_aw_bits_echo_real_last),
    .auto_in_w_ready(srams_auto_in_w_ready),
    .auto_in_w_valid(srams_auto_in_w_valid),
    .auto_in_w_bits_data(srams_auto_in_w_bits_data),
    .auto_in_w_bits_strb(srams_auto_in_w_bits_strb),
    .auto_in_b_ready(srams_auto_in_b_ready),
    .auto_in_b_valid(srams_auto_in_b_valid),
    .auto_in_b_bits_id(srams_auto_in_b_bits_id),
    .auto_in_b_bits_resp(srams_auto_in_b_bits_resp),
    .auto_in_b_bits_echo_real_last(srams_auto_in_b_bits_echo_real_last),
    .auto_in_ar_ready(srams_auto_in_ar_ready),
    .auto_in_ar_valid(srams_auto_in_ar_valid),
    .auto_in_ar_bits_id(srams_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(srams_auto_in_ar_bits_addr),
    .auto_in_ar_bits_echo_real_last(srams_auto_in_ar_bits_echo_real_last),
    .auto_in_r_ready(srams_auto_in_r_ready),
    .auto_in_r_valid(srams_auto_in_r_valid),
    .auto_in_r_bits_id(srams_auto_in_r_bits_id),
    .auto_in_r_bits_data(srams_auto_in_r_bits_data),
    .auto_in_r_bits_resp(srams_auto_in_r_bits_resp),
    .auto_in_r_bits_echo_real_last(srams_auto_in_r_bits_echo_real_last)
  );
  AXI4Xbar_tb axi4xbar ( // @[Xbar.scala 218:30]
    .clock(axi4xbar_clock),
    .reset(axi4xbar_reset),
    .auto_in_aw_ready(axi4xbar_auto_in_aw_ready),
    .auto_in_aw_valid(axi4xbar_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4xbar_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4xbar_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4xbar_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4xbar_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4xbar_auto_in_aw_bits_burst),
    .auto_in_w_ready(axi4xbar_auto_in_w_ready),
    .auto_in_w_valid(axi4xbar_auto_in_w_valid),
    .auto_in_w_bits_data(axi4xbar_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4xbar_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4xbar_auto_in_w_bits_last),
    .auto_in_b_ready(axi4xbar_auto_in_b_ready),
    .auto_in_b_valid(axi4xbar_auto_in_b_valid),
    .auto_in_b_bits_id(axi4xbar_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4xbar_auto_in_b_bits_resp),
    .auto_in_ar_ready(axi4xbar_auto_in_ar_ready),
    .auto_in_ar_valid(axi4xbar_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4xbar_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4xbar_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4xbar_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4xbar_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4xbar_auto_in_ar_bits_burst),
    .auto_in_r_ready(axi4xbar_auto_in_r_ready),
    .auto_in_r_valid(axi4xbar_auto_in_r_valid),
    .auto_in_r_bits_id(axi4xbar_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4xbar_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4xbar_auto_in_r_bits_resp),
    .auto_in_r_bits_last(axi4xbar_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4xbar_auto_out_aw_ready),
    .auto_out_aw_valid(axi4xbar_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4xbar_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4xbar_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4xbar_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4xbar_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(axi4xbar_auto_out_aw_bits_burst),
    .auto_out_w_ready(axi4xbar_auto_out_w_ready),
    .auto_out_w_valid(axi4xbar_auto_out_w_valid),
    .auto_out_w_bits_data(axi4xbar_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4xbar_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4xbar_auto_out_w_bits_last),
    .auto_out_b_ready(axi4xbar_auto_out_b_ready),
    .auto_out_b_valid(axi4xbar_auto_out_b_valid),
    .auto_out_b_bits_id(axi4xbar_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4xbar_auto_out_b_bits_resp),
    .auto_out_ar_ready(axi4xbar_auto_out_ar_ready),
    .auto_out_ar_valid(axi4xbar_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4xbar_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4xbar_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4xbar_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4xbar_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(axi4xbar_auto_out_ar_bits_burst),
    .auto_out_r_ready(axi4xbar_auto_out_r_ready),
    .auto_out_r_valid(axi4xbar_auto_out_r_valid),
    .auto_out_r_bits_id(axi4xbar_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4xbar_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4xbar_auto_out_r_bits_resp),
    .auto_out_r_bits_last(axi4xbar_auto_out_r_bits_last)
  );
  AXI4Buffer_tb axi4buf ( // @[Buffer.scala 58:29]
    .clock(axi4buf_clock),
    .reset(axi4buf_reset),
    .auto_in_aw_ready(axi4buf_auto_in_aw_ready),
    .auto_in_aw_valid(axi4buf_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4buf_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4buf_auto_in_aw_bits_addr),
    .auto_in_aw_bits_echo_real_last(axi4buf_auto_in_aw_bits_echo_real_last),
    .auto_in_w_ready(axi4buf_auto_in_w_ready),
    .auto_in_w_valid(axi4buf_auto_in_w_valid),
    .auto_in_w_bits_data(axi4buf_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4buf_auto_in_w_bits_strb),
    .auto_in_b_ready(axi4buf_auto_in_b_ready),
    .auto_in_b_valid(axi4buf_auto_in_b_valid),
    .auto_in_b_bits_id(axi4buf_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4buf_auto_in_b_bits_resp),
    .auto_in_b_bits_echo_real_last(axi4buf_auto_in_b_bits_echo_real_last),
    .auto_in_ar_ready(axi4buf_auto_in_ar_ready),
    .auto_in_ar_valid(axi4buf_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4buf_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4buf_auto_in_ar_bits_addr),
    .auto_in_ar_bits_echo_real_last(axi4buf_auto_in_ar_bits_echo_real_last),
    .auto_in_r_ready(axi4buf_auto_in_r_ready),
    .auto_in_r_valid(axi4buf_auto_in_r_valid),
    .auto_in_r_bits_id(axi4buf_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4buf_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4buf_auto_in_r_bits_resp),
    .auto_in_r_bits_echo_real_last(axi4buf_auto_in_r_bits_echo_real_last),
    .auto_in_r_bits_last(axi4buf_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4buf_auto_out_aw_ready),
    .auto_out_aw_valid(axi4buf_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4buf_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4buf_auto_out_aw_bits_addr),
    .auto_out_aw_bits_echo_real_last(axi4buf_auto_out_aw_bits_echo_real_last),
    .auto_out_w_ready(axi4buf_auto_out_w_ready),
    .auto_out_w_valid(axi4buf_auto_out_w_valid),
    .auto_out_w_bits_data(axi4buf_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4buf_auto_out_w_bits_strb),
    .auto_out_b_ready(axi4buf_auto_out_b_ready),
    .auto_out_b_valid(axi4buf_auto_out_b_valid),
    .auto_out_b_bits_id(axi4buf_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4buf_auto_out_b_bits_resp),
    .auto_out_b_bits_echo_real_last(axi4buf_auto_out_b_bits_echo_real_last),
    .auto_out_ar_ready(axi4buf_auto_out_ar_ready),
    .auto_out_ar_valid(axi4buf_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4buf_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4buf_auto_out_ar_bits_addr),
    .auto_out_ar_bits_echo_real_last(axi4buf_auto_out_ar_bits_echo_real_last),
    .auto_out_r_ready(axi4buf_auto_out_r_ready),
    .auto_out_r_valid(axi4buf_auto_out_r_valid),
    .auto_out_r_bits_id(axi4buf_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4buf_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4buf_auto_out_r_bits_resp),
    .auto_out_r_bits_echo_real_last(axi4buf_auto_out_r_bits_echo_real_last)
  );
  AXI4Fragmenter_1_tb axi4frag ( // @[Fragmenter.scala 205:30]
    .clock(axi4frag_clock),
    .reset(axi4frag_reset),
    .auto_in_aw_ready(axi4frag_auto_in_aw_ready),
    .auto_in_aw_valid(axi4frag_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4frag_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4frag_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4frag_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4frag_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4frag_auto_in_aw_bits_burst),
    .auto_in_w_ready(axi4frag_auto_in_w_ready),
    .auto_in_w_valid(axi4frag_auto_in_w_valid),
    .auto_in_w_bits_data(axi4frag_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4frag_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4frag_auto_in_w_bits_last),
    .auto_in_b_ready(axi4frag_auto_in_b_ready),
    .auto_in_b_valid(axi4frag_auto_in_b_valid),
    .auto_in_b_bits_id(axi4frag_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4frag_auto_in_b_bits_resp),
    .auto_in_ar_ready(axi4frag_auto_in_ar_ready),
    .auto_in_ar_valid(axi4frag_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4frag_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4frag_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4frag_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4frag_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4frag_auto_in_ar_bits_burst),
    .auto_in_r_ready(axi4frag_auto_in_r_ready),
    .auto_in_r_valid(axi4frag_auto_in_r_valid),
    .auto_in_r_bits_id(axi4frag_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4frag_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4frag_auto_in_r_bits_resp),
    .auto_in_r_bits_last(axi4frag_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4frag_auto_out_aw_ready),
    .auto_out_aw_valid(axi4frag_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4frag_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4frag_auto_out_aw_bits_addr),
    .auto_out_aw_bits_echo_real_last(axi4frag_auto_out_aw_bits_echo_real_last),
    .auto_out_w_ready(axi4frag_auto_out_w_ready),
    .auto_out_w_valid(axi4frag_auto_out_w_valid),
    .auto_out_w_bits_data(axi4frag_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4frag_auto_out_w_bits_strb),
    .auto_out_b_ready(axi4frag_auto_out_b_ready),
    .auto_out_b_valid(axi4frag_auto_out_b_valid),
    .auto_out_b_bits_id(axi4frag_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4frag_auto_out_b_bits_resp),
    .auto_out_b_bits_echo_real_last(axi4frag_auto_out_b_bits_echo_real_last),
    .auto_out_ar_ready(axi4frag_auto_out_ar_ready),
    .auto_out_ar_valid(axi4frag_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4frag_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4frag_auto_out_ar_bits_addr),
    .auto_out_ar_bits_echo_real_last(axi4frag_auto_out_ar_bits_echo_real_last),
    .auto_out_r_ready(axi4frag_auto_out_r_ready),
    .auto_out_r_valid(axi4frag_auto_out_r_valid),
    .auto_out_r_bits_id(axi4frag_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4frag_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4frag_auto_out_r_bits_resp),
    .auto_out_r_bits_echo_real_last(axi4frag_auto_out_r_bits_echo_real_last),
    .auto_out_r_bits_last(axi4frag_auto_out_r_bits_last)
  );
  assign io_axi4_0_aw_ready = axi4xbar_auto_in_aw_ready; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign io_axi4_0_w_ready = axi4xbar_auto_in_w_ready; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign io_axi4_0_b_valid = axi4xbar_auto_in_b_valid; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign io_axi4_0_b_bits_id = axi4xbar_auto_in_b_bits_id; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign io_axi4_0_b_bits_resp = axi4xbar_auto_in_b_bits_resp; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign io_axi4_0_ar_ready = axi4xbar_auto_in_ar_ready; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign io_axi4_0_r_valid = axi4xbar_auto_in_r_valid; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign io_axi4_0_r_bits_id = axi4xbar_auto_in_r_bits_id; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign io_axi4_0_r_bits_data = axi4xbar_auto_in_r_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign io_axi4_0_r_bits_resp = axi4xbar_auto_in_r_bits_resp; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign io_axi4_0_r_bits_last = axi4xbar_auto_in_r_bits_last; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign srams_clock = clock;
  assign srams_reset = reset;
  assign srams_auto_in_aw_valid = axi4buf_auto_out_aw_valid; // @[LazyModule.scala 296:16]
  assign srams_auto_in_aw_bits_id = axi4buf_auto_out_aw_bits_id; // @[LazyModule.scala 296:16]
  assign srams_auto_in_aw_bits_addr = axi4buf_auto_out_aw_bits_addr; // @[LazyModule.scala 296:16]
  assign srams_auto_in_aw_bits_echo_real_last = axi4buf_auto_out_aw_bits_echo_real_last; // @[LazyModule.scala 296:16]
  assign srams_auto_in_w_valid = axi4buf_auto_out_w_valid; // @[LazyModule.scala 296:16]
  assign srams_auto_in_w_bits_data = axi4buf_auto_out_w_bits_data; // @[LazyModule.scala 296:16]
  assign srams_auto_in_w_bits_strb = axi4buf_auto_out_w_bits_strb; // @[LazyModule.scala 296:16]
  assign srams_auto_in_b_ready = axi4buf_auto_out_b_ready; // @[LazyModule.scala 296:16]
  assign srams_auto_in_ar_valid = axi4buf_auto_out_ar_valid; // @[LazyModule.scala 296:16]
  assign srams_auto_in_ar_bits_id = axi4buf_auto_out_ar_bits_id; // @[LazyModule.scala 296:16]
  assign srams_auto_in_ar_bits_addr = axi4buf_auto_out_ar_bits_addr; // @[LazyModule.scala 296:16]
  assign srams_auto_in_ar_bits_echo_real_last = axi4buf_auto_out_ar_bits_echo_real_last; // @[LazyModule.scala 296:16]
  assign srams_auto_in_r_ready = axi4buf_auto_out_r_ready; // @[LazyModule.scala 296:16]
  assign axi4xbar_clock = clock;
  assign axi4xbar_reset = reset;
  assign axi4xbar_auto_in_aw_valid = io_axi4_0_aw_valid; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_in_aw_bits_id = io_axi4_0_aw_bits_id; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_in_aw_bits_addr = io_axi4_0_aw_bits_addr; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_in_aw_bits_len = io_axi4_0_aw_bits_len; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_in_aw_bits_size = io_axi4_0_aw_bits_size; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_in_aw_bits_burst = io_axi4_0_aw_bits_burst; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_in_w_valid = io_axi4_0_w_valid; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_in_w_bits_data = io_axi4_0_w_bits_data; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_in_w_bits_strb = io_axi4_0_w_bits_strb; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_in_w_bits_last = io_axi4_0_w_bits_last; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_in_b_ready = io_axi4_0_b_ready; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_in_ar_valid = io_axi4_0_ar_valid; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_in_ar_bits_id = io_axi4_0_ar_bits_id; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_in_ar_bits_addr = io_axi4_0_ar_bits_addr; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_in_ar_bits_len = io_axi4_0_ar_bits_len; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_in_ar_bits_size = io_axi4_0_ar_bits_size; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_in_ar_bits_burst = io_axi4_0_ar_bits_burst; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_in_r_ready = io_axi4_0_r_ready; // @[Nodes.scala 1207:84 1630:60]
  assign axi4xbar_auto_out_aw_ready = axi4frag_auto_in_aw_ready; // @[LazyModule.scala 298:16]
  assign axi4xbar_auto_out_w_ready = axi4frag_auto_in_w_ready; // @[LazyModule.scala 298:16]
  assign axi4xbar_auto_out_b_valid = axi4frag_auto_in_b_valid; // @[LazyModule.scala 298:16]
  assign axi4xbar_auto_out_b_bits_id = axi4frag_auto_in_b_bits_id; // @[LazyModule.scala 298:16]
  assign axi4xbar_auto_out_b_bits_resp = axi4frag_auto_in_b_bits_resp; // @[LazyModule.scala 298:16]
  assign axi4xbar_auto_out_ar_ready = axi4frag_auto_in_ar_ready; // @[LazyModule.scala 298:16]
  assign axi4xbar_auto_out_r_valid = axi4frag_auto_in_r_valid; // @[LazyModule.scala 298:16]
  assign axi4xbar_auto_out_r_bits_id = axi4frag_auto_in_r_bits_id; // @[LazyModule.scala 298:16]
  assign axi4xbar_auto_out_r_bits_data = axi4frag_auto_in_r_bits_data; // @[LazyModule.scala 298:16]
  assign axi4xbar_auto_out_r_bits_resp = axi4frag_auto_in_r_bits_resp; // @[LazyModule.scala 298:16]
  assign axi4xbar_auto_out_r_bits_last = axi4frag_auto_in_r_bits_last; // @[LazyModule.scala 298:16]
  assign axi4buf_clock = clock;
  assign axi4buf_reset = reset;
  assign axi4buf_auto_in_aw_valid = axi4frag_auto_out_aw_valid; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_in_aw_bits_id = axi4frag_auto_out_aw_bits_id; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_in_aw_bits_addr = axi4frag_auto_out_aw_bits_addr; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_in_aw_bits_echo_real_last = axi4frag_auto_out_aw_bits_echo_real_last; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_in_w_valid = axi4frag_auto_out_w_valid; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_in_w_bits_data = axi4frag_auto_out_w_bits_data; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_in_w_bits_strb = axi4frag_auto_out_w_bits_strb; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_in_b_ready = axi4frag_auto_out_b_ready; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_in_ar_valid = axi4frag_auto_out_ar_valid; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_in_ar_bits_id = axi4frag_auto_out_ar_bits_id; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_in_ar_bits_addr = axi4frag_auto_out_ar_bits_addr; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_in_ar_bits_echo_real_last = axi4frag_auto_out_ar_bits_echo_real_last; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_in_r_ready = axi4frag_auto_out_r_ready; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_out_aw_ready = srams_auto_in_aw_ready; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_out_w_ready = srams_auto_in_w_ready; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_out_b_valid = srams_auto_in_b_valid; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_out_b_bits_id = srams_auto_in_b_bits_id; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_out_b_bits_resp = srams_auto_in_b_bits_resp; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_out_b_bits_echo_real_last = srams_auto_in_b_bits_echo_real_last; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_out_ar_ready = srams_auto_in_ar_ready; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_out_r_valid = srams_auto_in_r_valid; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_out_r_bits_id = srams_auto_in_r_bits_id; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_out_r_bits_data = srams_auto_in_r_bits_data; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_out_r_bits_resp = srams_auto_in_r_bits_resp; // @[LazyModule.scala 296:16]
  assign axi4buf_auto_out_r_bits_echo_real_last = srams_auto_in_r_bits_echo_real_last; // @[LazyModule.scala 296:16]
  assign axi4frag_clock = clock;
  assign axi4frag_reset = reset;
  assign axi4frag_auto_in_aw_valid = axi4xbar_auto_out_aw_valid; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_in_aw_bits_id = axi4xbar_auto_out_aw_bits_id; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_in_aw_bits_addr = axi4xbar_auto_out_aw_bits_addr; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_in_aw_bits_len = axi4xbar_auto_out_aw_bits_len; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_in_aw_bits_size = axi4xbar_auto_out_aw_bits_size; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_in_aw_bits_burst = axi4xbar_auto_out_aw_bits_burst; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_in_w_valid = axi4xbar_auto_out_w_valid; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_in_w_bits_data = axi4xbar_auto_out_w_bits_data; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_in_w_bits_strb = axi4xbar_auto_out_w_bits_strb; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_in_w_bits_last = axi4xbar_auto_out_w_bits_last; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_in_b_ready = axi4xbar_auto_out_b_ready; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_in_ar_valid = axi4xbar_auto_out_ar_valid; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_in_ar_bits_id = axi4xbar_auto_out_ar_bits_id; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_in_ar_bits_addr = axi4xbar_auto_out_ar_bits_addr; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_in_ar_bits_len = axi4xbar_auto_out_ar_bits_len; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_in_ar_bits_size = axi4xbar_auto_out_ar_bits_size; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_in_ar_bits_burst = axi4xbar_auto_out_ar_bits_burst; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_in_r_ready = axi4xbar_auto_out_r_ready; // @[LazyModule.scala 298:16]
  assign axi4frag_auto_out_aw_ready = axi4buf_auto_in_aw_ready; // @[LazyModule.scala 296:16]
  assign axi4frag_auto_out_w_ready = axi4buf_auto_in_w_ready; // @[LazyModule.scala 296:16]
  assign axi4frag_auto_out_b_valid = axi4buf_auto_in_b_valid; // @[LazyModule.scala 296:16]
  assign axi4frag_auto_out_b_bits_id = axi4buf_auto_in_b_bits_id; // @[LazyModule.scala 296:16]
  assign axi4frag_auto_out_b_bits_resp = axi4buf_auto_in_b_bits_resp; // @[LazyModule.scala 296:16]
  assign axi4frag_auto_out_b_bits_echo_real_last = axi4buf_auto_in_b_bits_echo_real_last; // @[LazyModule.scala 296:16]
  assign axi4frag_auto_out_ar_ready = axi4buf_auto_in_ar_ready; // @[LazyModule.scala 296:16]
  assign axi4frag_auto_out_r_valid = axi4buf_auto_in_r_valid; // @[LazyModule.scala 296:16]
  assign axi4frag_auto_out_r_bits_id = axi4buf_auto_in_r_bits_id; // @[LazyModule.scala 296:16]
  assign axi4frag_auto_out_r_bits_data = axi4buf_auto_in_r_bits_data; // @[LazyModule.scala 296:16]
  assign axi4frag_auto_out_r_bits_resp = axi4buf_auto_in_r_bits_resp; // @[LazyModule.scala 296:16]
  assign axi4frag_auto_out_r_bits_echo_real_last = axi4buf_auto_in_r_bits_echo_real_last; // @[LazyModule.scala 296:16]
  assign axi4frag_auto_out_r_bits_last = axi4buf_auto_in_r_bits_last; // @[LazyModule.scala 296:16]
endmodule
module SyncResetSynchronizerPrimitiveShiftReg_d2_i1_tb(
  input   clock,
  input   reset,
  input   io_d,
  output  io_q
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  sync_0; // @[SynchronizerReg.scala 51:87]
  reg  sync_1; // @[SynchronizerReg.scala 51:87]
  assign io_q = sync_0; // @[SynchronizerReg.scala 59:8]
  always @(posedge clock) begin
    sync_0 <= reset | sync_1; // @[SynchronizerReg.scala 51:{87,87} 57:10]
    sync_1 <= reset | io_d; // @[SynchronizerReg.scala 51:{87,87} 54:14]
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
  sync_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  sync_1 = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SyncResetSynchronizerShiftReg_w1_d2_i1_tb(
  input   clock,
  input   reset,
  input   io_d,
  output  io_q
);
  wire  output_chain_clock; // @[ShiftReg.scala 45:23]
  wire  output_chain_reset; // @[ShiftReg.scala 45:23]
  wire  output_chain_io_d; // @[ShiftReg.scala 45:23]
  wire  output_chain_io_q; // @[ShiftReg.scala 45:23]
  SyncResetSynchronizerPrimitiveShiftReg_d2_i1_tb output_chain ( // @[ShiftReg.scala 45:23]
    .clock(output_chain_clock),
    .reset(output_chain_reset),
    .io_d(output_chain_io_d),
    .io_q(output_chain_io_q)
  );
  assign io_q = output_chain_io_q; // @[ShiftReg.scala 48:{24,24}]
  assign output_chain_clock = clock;
  assign output_chain_reset = reset; // @[SynchronizerReg.scala 118:21]
  assign output_chain_io_d = io_d; // @[SynchronizerReg.scala 119:41]
endmodule
module TestHarness(
  input   clock,
  input   reset,
  output  io_uart_tx,
  input   io_uart_rx
);
  wire  ldut_clock; // @[SimTop.scala 46:19]
  wire  ldut_reset; // @[SimTop.scala 46:19]
  wire  ldut_mem_axi4_0_aw_ready; // @[SimTop.scala 46:19]
  wire  ldut_mem_axi4_0_aw_valid; // @[SimTop.scala 46:19]
  wire [3:0] ldut_mem_axi4_0_aw_bits_id; // @[SimTop.scala 46:19]
  wire [31:0] ldut_mem_axi4_0_aw_bits_addr; // @[SimTop.scala 46:19]
  wire [7:0] ldut_mem_axi4_0_aw_bits_len; // @[SimTop.scala 46:19]
  wire [2:0] ldut_mem_axi4_0_aw_bits_size; // @[SimTop.scala 46:19]
  wire [1:0] ldut_mem_axi4_0_aw_bits_burst; // @[SimTop.scala 46:19]
  wire  ldut_mem_axi4_0_aw_bits_lock; // @[SimTop.scala 46:19]
  wire [3:0] ldut_mem_axi4_0_aw_bits_cache; // @[SimTop.scala 46:19]
  wire [2:0] ldut_mem_axi4_0_aw_bits_prot; // @[SimTop.scala 46:19]
  wire [3:0] ldut_mem_axi4_0_aw_bits_qos; // @[SimTop.scala 46:19]
  wire  ldut_mem_axi4_0_w_ready; // @[SimTop.scala 46:19]
  wire  ldut_mem_axi4_0_w_valid; // @[SimTop.scala 46:19]
  wire [63:0] ldut_mem_axi4_0_w_bits_data; // @[SimTop.scala 46:19]
  wire [7:0] ldut_mem_axi4_0_w_bits_strb; // @[SimTop.scala 46:19]
  wire  ldut_mem_axi4_0_w_bits_last; // @[SimTop.scala 46:19]
  wire  ldut_mem_axi4_0_b_ready; // @[SimTop.scala 46:19]
  wire  ldut_mem_axi4_0_b_valid; // @[SimTop.scala 46:19]
  wire [3:0] ldut_mem_axi4_0_b_bits_id; // @[SimTop.scala 46:19]
  wire [1:0] ldut_mem_axi4_0_b_bits_resp; // @[SimTop.scala 46:19]
  wire  ldut_mem_axi4_0_ar_ready; // @[SimTop.scala 46:19]
  wire  ldut_mem_axi4_0_ar_valid; // @[SimTop.scala 46:19]
  wire [3:0] ldut_mem_axi4_0_ar_bits_id; // @[SimTop.scala 46:19]
  wire [31:0] ldut_mem_axi4_0_ar_bits_addr; // @[SimTop.scala 46:19]
  wire [7:0] ldut_mem_axi4_0_ar_bits_len; // @[SimTop.scala 46:19]
  wire [2:0] ldut_mem_axi4_0_ar_bits_size; // @[SimTop.scala 46:19]
  wire [1:0] ldut_mem_axi4_0_ar_bits_burst; // @[SimTop.scala 46:19]
  wire  ldut_mem_axi4_0_ar_bits_lock; // @[SimTop.scala 46:19]
  wire [3:0] ldut_mem_axi4_0_ar_bits_cache; // @[SimTop.scala 46:19]
  wire [2:0] ldut_mem_axi4_0_ar_bits_prot; // @[SimTop.scala 46:19]
  wire [3:0] ldut_mem_axi4_0_ar_bits_qos; // @[SimTop.scala 46:19]
  wire  ldut_mem_axi4_0_r_ready; // @[SimTop.scala 46:19]
  wire  ldut_mem_axi4_0_r_valid; // @[SimTop.scala 46:19]
  wire [3:0] ldut_mem_axi4_0_r_bits_id; // @[SimTop.scala 46:19]
  wire [63:0] ldut_mem_axi4_0_r_bits_data; // @[SimTop.scala 46:19]
  wire [1:0] ldut_mem_axi4_0_r_bits_resp; // @[SimTop.scala 46:19]
  wire  ldut_mem_axi4_0_r_bits_last; // @[SimTop.scala 46:19]
  wire  ldut_l2_frontend_bus_axi4_0_aw_ready; // @[SimTop.scala 46:19]
  wire  ldut_l2_frontend_bus_axi4_0_aw_valid; // @[SimTop.scala 46:19]
  wire [7:0] ldut_l2_frontend_bus_axi4_0_aw_bits_id; // @[SimTop.scala 46:19]
  wire [31:0] ldut_l2_frontend_bus_axi4_0_aw_bits_addr; // @[SimTop.scala 46:19]
  wire [7:0] ldut_l2_frontend_bus_axi4_0_aw_bits_len; // @[SimTop.scala 46:19]
  wire [2:0] ldut_l2_frontend_bus_axi4_0_aw_bits_size; // @[SimTop.scala 46:19]
  wire [1:0] ldut_l2_frontend_bus_axi4_0_aw_bits_burst; // @[SimTop.scala 46:19]
  wire  ldut_l2_frontend_bus_axi4_0_aw_bits_lock; // @[SimTop.scala 46:19]
  wire [3:0] ldut_l2_frontend_bus_axi4_0_aw_bits_cache; // @[SimTop.scala 46:19]
  wire [2:0] ldut_l2_frontend_bus_axi4_0_aw_bits_prot; // @[SimTop.scala 46:19]
  wire [3:0] ldut_l2_frontend_bus_axi4_0_aw_bits_qos; // @[SimTop.scala 46:19]
  wire  ldut_l2_frontend_bus_axi4_0_w_ready; // @[SimTop.scala 46:19]
  wire  ldut_l2_frontend_bus_axi4_0_w_valid; // @[SimTop.scala 46:19]
  wire [63:0] ldut_l2_frontend_bus_axi4_0_w_bits_data; // @[SimTop.scala 46:19]
  wire [7:0] ldut_l2_frontend_bus_axi4_0_w_bits_strb; // @[SimTop.scala 46:19]
  wire  ldut_l2_frontend_bus_axi4_0_w_bits_last; // @[SimTop.scala 46:19]
  wire  ldut_l2_frontend_bus_axi4_0_b_ready; // @[SimTop.scala 46:19]
  wire  ldut_l2_frontend_bus_axi4_0_b_valid; // @[SimTop.scala 46:19]
  wire [7:0] ldut_l2_frontend_bus_axi4_0_b_bits_id; // @[SimTop.scala 46:19]
  wire [1:0] ldut_l2_frontend_bus_axi4_0_b_bits_resp; // @[SimTop.scala 46:19]
  wire  ldut_l2_frontend_bus_axi4_0_ar_ready; // @[SimTop.scala 46:19]
  wire  ldut_l2_frontend_bus_axi4_0_ar_valid; // @[SimTop.scala 46:19]
  wire [7:0] ldut_l2_frontend_bus_axi4_0_ar_bits_id; // @[SimTop.scala 46:19]
  wire [31:0] ldut_l2_frontend_bus_axi4_0_ar_bits_addr; // @[SimTop.scala 46:19]
  wire [7:0] ldut_l2_frontend_bus_axi4_0_ar_bits_len; // @[SimTop.scala 46:19]
  wire [2:0] ldut_l2_frontend_bus_axi4_0_ar_bits_size; // @[SimTop.scala 46:19]
  wire [1:0] ldut_l2_frontend_bus_axi4_0_ar_bits_burst; // @[SimTop.scala 46:19]
  wire  ldut_l2_frontend_bus_axi4_0_ar_bits_lock; // @[SimTop.scala 46:19]
  wire [3:0] ldut_l2_frontend_bus_axi4_0_ar_bits_cache; // @[SimTop.scala 46:19]
  wire [2:0] ldut_l2_frontend_bus_axi4_0_ar_bits_prot; // @[SimTop.scala 46:19]
  wire [3:0] ldut_l2_frontend_bus_axi4_0_ar_bits_qos; // @[SimTop.scala 46:19]
  wire  ldut_l2_frontend_bus_axi4_0_r_ready; // @[SimTop.scala 46:19]
  wire  ldut_l2_frontend_bus_axi4_0_r_valid; // @[SimTop.scala 46:19]
  wire [7:0] ldut_l2_frontend_bus_axi4_0_r_bits_id; // @[SimTop.scala 46:19]
  wire [63:0] ldut_l2_frontend_bus_axi4_0_r_bits_data; // @[SimTop.scala 46:19]
  wire [1:0] ldut_l2_frontend_bus_axi4_0_r_bits_resp; // @[SimTop.scala 46:19]
  wire  ldut_l2_frontend_bus_axi4_0_r_bits_last; // @[SimTop.scala 46:19]
  wire  ldut_nmi_0_rnmi; // @[SimTop.scala 46:19]
  wire [31:0] ldut_nmi_0_rnmi_interrupt_vector; // @[SimTop.scala 46:19]
  wire [31:0] ldut_nmi_0_rnmi_exception_vector; // @[SimTop.scala 46:19]
  wire  ldut_uart_0_txd; // @[SimTop.scala 46:19]
  wire  ldut_uart_0_rxd; // @[SimTop.scala 46:19]
  wire  mem_clock; // @[SimAXIMem.scala 41:13]
  wire  mem_reset; // @[SimAXIMem.scala 41:13]
  wire  mem_io_axi4_0_aw_ready; // @[SimAXIMem.scala 41:13]
  wire  mem_io_axi4_0_aw_valid; // @[SimAXIMem.scala 41:13]
  wire [3:0] mem_io_axi4_0_aw_bits_id; // @[SimAXIMem.scala 41:13]
  wire [31:0] mem_io_axi4_0_aw_bits_addr; // @[SimAXIMem.scala 41:13]
  wire [7:0] mem_io_axi4_0_aw_bits_len; // @[SimAXIMem.scala 41:13]
  wire [2:0] mem_io_axi4_0_aw_bits_size; // @[SimAXIMem.scala 41:13]
  wire [1:0] mem_io_axi4_0_aw_bits_burst; // @[SimAXIMem.scala 41:13]
  wire  mem_io_axi4_0_w_ready; // @[SimAXIMem.scala 41:13]
  wire  mem_io_axi4_0_w_valid; // @[SimAXIMem.scala 41:13]
  wire [63:0] mem_io_axi4_0_w_bits_data; // @[SimAXIMem.scala 41:13]
  wire [7:0] mem_io_axi4_0_w_bits_strb; // @[SimAXIMem.scala 41:13]
  wire  mem_io_axi4_0_w_bits_last; // @[SimAXIMem.scala 41:13]
  wire  mem_io_axi4_0_b_ready; // @[SimAXIMem.scala 41:13]
  wire  mem_io_axi4_0_b_valid; // @[SimAXIMem.scala 41:13]
  wire [3:0] mem_io_axi4_0_b_bits_id; // @[SimAXIMem.scala 41:13]
  wire [1:0] mem_io_axi4_0_b_bits_resp; // @[SimAXIMem.scala 41:13]
  wire  mem_io_axi4_0_ar_ready; // @[SimAXIMem.scala 41:13]
  wire  mem_io_axi4_0_ar_valid; // @[SimAXIMem.scala 41:13]
  wire [3:0] mem_io_axi4_0_ar_bits_id; // @[SimAXIMem.scala 41:13]
  wire [31:0] mem_io_axi4_0_ar_bits_addr; // @[SimAXIMem.scala 41:13]
  wire [7:0] mem_io_axi4_0_ar_bits_len; // @[SimAXIMem.scala 41:13]
  wire [2:0] mem_io_axi4_0_ar_bits_size; // @[SimAXIMem.scala 41:13]
  wire [1:0] mem_io_axi4_0_ar_bits_burst; // @[SimAXIMem.scala 41:13]
  wire  mem_io_axi4_0_r_ready; // @[SimAXIMem.scala 41:13]
  wire  mem_io_axi4_0_r_valid; // @[SimAXIMem.scala 41:13]
  wire [3:0] mem_io_axi4_0_r_bits_id; // @[SimAXIMem.scala 41:13]
  wire [63:0] mem_io_axi4_0_r_bits_data; // @[SimAXIMem.scala 41:13]
  wire [1:0] mem_io_axi4_0_r_bits_resp; // @[SimAXIMem.scala 41:13]
  wire  mem_io_axi4_0_r_bits_last; // @[SimAXIMem.scala 41:13]
  wire  ldut_uart_0_rxd_uart_rxd_sync_clock; // @[ShiftReg.scala 45:23]
  wire  ldut_uart_0_rxd_uart_rxd_sync_reset; // @[ShiftReg.scala 45:23]
  wire  ldut_uart_0_rxd_uart_rxd_sync_io_d; // @[ShiftReg.scala 45:23]
  wire  ldut_uart_0_rxd_uart_rxd_sync_io_q; // @[ShiftReg.scala 45:23]
  StarshipASICTop ldut ( // @[SimTop.scala 46:19]
    .clock(ldut_clock),
    .reset(ldut_reset),
    .mem_axi4_0_aw_ready(ldut_mem_axi4_0_aw_ready),
    .mem_axi4_0_aw_valid(ldut_mem_axi4_0_aw_valid),
    .mem_axi4_0_aw_bits_id(ldut_mem_axi4_0_aw_bits_id),
    .mem_axi4_0_aw_bits_addr(ldut_mem_axi4_0_aw_bits_addr),
    .mem_axi4_0_aw_bits_len(ldut_mem_axi4_0_aw_bits_len),
    .mem_axi4_0_aw_bits_size(ldut_mem_axi4_0_aw_bits_size),
    .mem_axi4_0_aw_bits_burst(ldut_mem_axi4_0_aw_bits_burst),
    .mem_axi4_0_aw_bits_lock(ldut_mem_axi4_0_aw_bits_lock),
    .mem_axi4_0_aw_bits_cache(ldut_mem_axi4_0_aw_bits_cache),
    .mem_axi4_0_aw_bits_prot(ldut_mem_axi4_0_aw_bits_prot),
    .mem_axi4_0_aw_bits_qos(ldut_mem_axi4_0_aw_bits_qos),
    .mem_axi4_0_w_ready(ldut_mem_axi4_0_w_ready),
    .mem_axi4_0_w_valid(ldut_mem_axi4_0_w_valid),
    .mem_axi4_0_w_bits_data(ldut_mem_axi4_0_w_bits_data),
    .mem_axi4_0_w_bits_strb(ldut_mem_axi4_0_w_bits_strb),
    .mem_axi4_0_w_bits_last(ldut_mem_axi4_0_w_bits_last),
    .mem_axi4_0_b_ready(ldut_mem_axi4_0_b_ready),
    .mem_axi4_0_b_valid(ldut_mem_axi4_0_b_valid),
    .mem_axi4_0_b_bits_id(ldut_mem_axi4_0_b_bits_id),
    .mem_axi4_0_b_bits_resp(ldut_mem_axi4_0_b_bits_resp),
    .mem_axi4_0_ar_ready(ldut_mem_axi4_0_ar_ready),
    .mem_axi4_0_ar_valid(ldut_mem_axi4_0_ar_valid),
    .mem_axi4_0_ar_bits_id(ldut_mem_axi4_0_ar_bits_id),
    .mem_axi4_0_ar_bits_addr(ldut_mem_axi4_0_ar_bits_addr),
    .mem_axi4_0_ar_bits_len(ldut_mem_axi4_0_ar_bits_len),
    .mem_axi4_0_ar_bits_size(ldut_mem_axi4_0_ar_bits_size),
    .mem_axi4_0_ar_bits_burst(ldut_mem_axi4_0_ar_bits_burst),
    .mem_axi4_0_ar_bits_lock(ldut_mem_axi4_0_ar_bits_lock),
    .mem_axi4_0_ar_bits_cache(ldut_mem_axi4_0_ar_bits_cache),
    .mem_axi4_0_ar_bits_prot(ldut_mem_axi4_0_ar_bits_prot),
    .mem_axi4_0_ar_bits_qos(ldut_mem_axi4_0_ar_bits_qos),
    .mem_axi4_0_r_ready(ldut_mem_axi4_0_r_ready),
    .mem_axi4_0_r_valid(ldut_mem_axi4_0_r_valid),
    .mem_axi4_0_r_bits_id(ldut_mem_axi4_0_r_bits_id),
    .mem_axi4_0_r_bits_data(ldut_mem_axi4_0_r_bits_data),
    .mem_axi4_0_r_bits_resp(ldut_mem_axi4_0_r_bits_resp),
    .mem_axi4_0_r_bits_last(ldut_mem_axi4_0_r_bits_last),
    .l2_frontend_bus_axi4_0_aw_ready(ldut_l2_frontend_bus_axi4_0_aw_ready),
    .l2_frontend_bus_axi4_0_aw_valid(ldut_l2_frontend_bus_axi4_0_aw_valid),
    .l2_frontend_bus_axi4_0_aw_bits_id(ldut_l2_frontend_bus_axi4_0_aw_bits_id),
    .l2_frontend_bus_axi4_0_aw_bits_addr(ldut_l2_frontend_bus_axi4_0_aw_bits_addr),
    .l2_frontend_bus_axi4_0_aw_bits_len(ldut_l2_frontend_bus_axi4_0_aw_bits_len),
    .l2_frontend_bus_axi4_0_aw_bits_size(ldut_l2_frontend_bus_axi4_0_aw_bits_size),
    .l2_frontend_bus_axi4_0_aw_bits_burst(ldut_l2_frontend_bus_axi4_0_aw_bits_burst),
    .l2_frontend_bus_axi4_0_aw_bits_lock(ldut_l2_frontend_bus_axi4_0_aw_bits_lock),
    .l2_frontend_bus_axi4_0_aw_bits_cache(ldut_l2_frontend_bus_axi4_0_aw_bits_cache),
    .l2_frontend_bus_axi4_0_aw_bits_prot(ldut_l2_frontend_bus_axi4_0_aw_bits_prot),
    .l2_frontend_bus_axi4_0_aw_bits_qos(ldut_l2_frontend_bus_axi4_0_aw_bits_qos),
    .l2_frontend_bus_axi4_0_w_ready(ldut_l2_frontend_bus_axi4_0_w_ready),
    .l2_frontend_bus_axi4_0_w_valid(ldut_l2_frontend_bus_axi4_0_w_valid),
    .l2_frontend_bus_axi4_0_w_bits_data(ldut_l2_frontend_bus_axi4_0_w_bits_data),
    .l2_frontend_bus_axi4_0_w_bits_strb(ldut_l2_frontend_bus_axi4_0_w_bits_strb),
    .l2_frontend_bus_axi4_0_w_bits_last(ldut_l2_frontend_bus_axi4_0_w_bits_last),
    .l2_frontend_bus_axi4_0_b_ready(ldut_l2_frontend_bus_axi4_0_b_ready),
    .l2_frontend_bus_axi4_0_b_valid(ldut_l2_frontend_bus_axi4_0_b_valid),
    .l2_frontend_bus_axi4_0_b_bits_id(ldut_l2_frontend_bus_axi4_0_b_bits_id),
    .l2_frontend_bus_axi4_0_b_bits_resp(ldut_l2_frontend_bus_axi4_0_b_bits_resp),
    .l2_frontend_bus_axi4_0_ar_ready(ldut_l2_frontend_bus_axi4_0_ar_ready),
    .l2_frontend_bus_axi4_0_ar_valid(ldut_l2_frontend_bus_axi4_0_ar_valid),
    .l2_frontend_bus_axi4_0_ar_bits_id(ldut_l2_frontend_bus_axi4_0_ar_bits_id),
    .l2_frontend_bus_axi4_0_ar_bits_addr(ldut_l2_frontend_bus_axi4_0_ar_bits_addr),
    .l2_frontend_bus_axi4_0_ar_bits_len(ldut_l2_frontend_bus_axi4_0_ar_bits_len),
    .l2_frontend_bus_axi4_0_ar_bits_size(ldut_l2_frontend_bus_axi4_0_ar_bits_size),
    .l2_frontend_bus_axi4_0_ar_bits_burst(ldut_l2_frontend_bus_axi4_0_ar_bits_burst),
    .l2_frontend_bus_axi4_0_ar_bits_lock(ldut_l2_frontend_bus_axi4_0_ar_bits_lock),
    .l2_frontend_bus_axi4_0_ar_bits_cache(ldut_l2_frontend_bus_axi4_0_ar_bits_cache),
    .l2_frontend_bus_axi4_0_ar_bits_prot(ldut_l2_frontend_bus_axi4_0_ar_bits_prot),
    .l2_frontend_bus_axi4_0_ar_bits_qos(ldut_l2_frontend_bus_axi4_0_ar_bits_qos),
    .l2_frontend_bus_axi4_0_r_ready(ldut_l2_frontend_bus_axi4_0_r_ready),
    .l2_frontend_bus_axi4_0_r_valid(ldut_l2_frontend_bus_axi4_0_r_valid),
    .l2_frontend_bus_axi4_0_r_bits_id(ldut_l2_frontend_bus_axi4_0_r_bits_id),
    .l2_frontend_bus_axi4_0_r_bits_data(ldut_l2_frontend_bus_axi4_0_r_bits_data),
    .l2_frontend_bus_axi4_0_r_bits_resp(ldut_l2_frontend_bus_axi4_0_r_bits_resp),
    .l2_frontend_bus_axi4_0_r_bits_last(ldut_l2_frontend_bus_axi4_0_r_bits_last),
    .nmi_0_rnmi(ldut_nmi_0_rnmi),
    .nmi_0_rnmi_interrupt_vector(ldut_nmi_0_rnmi_interrupt_vector),
    .nmi_0_rnmi_exception_vector(ldut_nmi_0_rnmi_exception_vector),
    .uart_0_txd(ldut_uart_0_txd),
    .uart_0_rxd(ldut_uart_0_rxd)
  );
  SimAXIMem_tb mem ( // @[SimAXIMem.scala 41:13]
    .clock(mem_clock),
    .reset(mem_reset),
    .io_axi4_0_aw_ready(mem_io_axi4_0_aw_ready),
    .io_axi4_0_aw_valid(mem_io_axi4_0_aw_valid),
    .io_axi4_0_aw_bits_id(mem_io_axi4_0_aw_bits_id),
    .io_axi4_0_aw_bits_addr(mem_io_axi4_0_aw_bits_addr),
    .io_axi4_0_aw_bits_len(mem_io_axi4_0_aw_bits_len),
    .io_axi4_0_aw_bits_size(mem_io_axi4_0_aw_bits_size),
    .io_axi4_0_aw_bits_burst(mem_io_axi4_0_aw_bits_burst),
    .io_axi4_0_w_ready(mem_io_axi4_0_w_ready),
    .io_axi4_0_w_valid(mem_io_axi4_0_w_valid),
    .io_axi4_0_w_bits_data(mem_io_axi4_0_w_bits_data),
    .io_axi4_0_w_bits_strb(mem_io_axi4_0_w_bits_strb),
    .io_axi4_0_w_bits_last(mem_io_axi4_0_w_bits_last),
    .io_axi4_0_b_ready(mem_io_axi4_0_b_ready),
    .io_axi4_0_b_valid(mem_io_axi4_0_b_valid),
    .io_axi4_0_b_bits_id(mem_io_axi4_0_b_bits_id),
    .io_axi4_0_b_bits_resp(mem_io_axi4_0_b_bits_resp),
    .io_axi4_0_ar_ready(mem_io_axi4_0_ar_ready),
    .io_axi4_0_ar_valid(mem_io_axi4_0_ar_valid),
    .io_axi4_0_ar_bits_id(mem_io_axi4_0_ar_bits_id),
    .io_axi4_0_ar_bits_addr(mem_io_axi4_0_ar_bits_addr),
    .io_axi4_0_ar_bits_len(mem_io_axi4_0_ar_bits_len),
    .io_axi4_0_ar_bits_size(mem_io_axi4_0_ar_bits_size),
    .io_axi4_0_ar_bits_burst(mem_io_axi4_0_ar_bits_burst),
    .io_axi4_0_r_ready(mem_io_axi4_0_r_ready),
    .io_axi4_0_r_valid(mem_io_axi4_0_r_valid),
    .io_axi4_0_r_bits_id(mem_io_axi4_0_r_bits_id),
    .io_axi4_0_r_bits_data(mem_io_axi4_0_r_bits_data),
    .io_axi4_0_r_bits_resp(mem_io_axi4_0_r_bits_resp),
    .io_axi4_0_r_bits_last(mem_io_axi4_0_r_bits_last)
  );
  SyncResetSynchronizerShiftReg_w1_d2_i1_tb ldut_uart_0_rxd_uart_rxd_sync ( // @[ShiftReg.scala 45:23]
    .clock(ldut_uart_0_rxd_uart_rxd_sync_clock),
    .reset(ldut_uart_0_rxd_uart_rxd_sync_reset),
    .io_d(ldut_uart_0_rxd_uart_rxd_sync_io_d),
    .io_q(ldut_uart_0_rxd_uart_rxd_sync_io_q)
  );
  assign io_uart_tx = ldut_uart_0_txd; // @[SimTop.scala 69:19]
  assign ldut_clock = clock;
  assign ldut_reset = reset; // @[SimTop.scala 49:108]
  assign ldut_mem_axi4_0_aw_ready = mem_io_axi4_0_aw_ready; // @[SimAXIMem.scala 42:24]
  assign ldut_mem_axi4_0_w_ready = mem_io_axi4_0_w_ready; // @[SimAXIMem.scala 42:24]
  assign ldut_mem_axi4_0_b_valid = mem_io_axi4_0_b_valid; // @[SimAXIMem.scala 42:24]
  assign ldut_mem_axi4_0_b_bits_id = mem_io_axi4_0_b_bits_id; // @[SimAXIMem.scala 42:24]
  assign ldut_mem_axi4_0_b_bits_resp = mem_io_axi4_0_b_bits_resp; // @[SimAXIMem.scala 42:24]
  assign ldut_mem_axi4_0_ar_ready = mem_io_axi4_0_ar_ready; // @[SimAXIMem.scala 42:24]
  assign ldut_mem_axi4_0_r_valid = mem_io_axi4_0_r_valid; // @[SimAXIMem.scala 42:24]
  assign ldut_mem_axi4_0_r_bits_id = mem_io_axi4_0_r_bits_id; // @[SimAXIMem.scala 42:24]
  assign ldut_mem_axi4_0_r_bits_data = mem_io_axi4_0_r_bits_data; // @[SimAXIMem.scala 42:24]
  assign ldut_mem_axi4_0_r_bits_resp = mem_io_axi4_0_r_bits_resp; // @[SimAXIMem.scala 42:24]
  assign ldut_mem_axi4_0_r_bits_last = mem_io_axi4_0_r_bits_last; // @[SimAXIMem.scala 42:24]
  assign ldut_l2_frontend_bus_axi4_0_aw_valid = 1'h0; // @[Bundles.scala 92:18]
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_id = 8'h0;
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_addr = 32'h0;
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_len = 8'h0;
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_size = 3'h0;
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_burst = 2'h0;
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_lock = 1'h0;
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_cache = 4'h0;
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_prot = 3'h0;
  assign ldut_l2_frontend_bus_axi4_0_aw_bits_qos = 4'h0;
  assign ldut_l2_frontend_bus_axi4_0_w_valid = 1'h0; // @[Bundles.scala 94:18]
  assign ldut_l2_frontend_bus_axi4_0_w_bits_data = 64'h0;
  assign ldut_l2_frontend_bus_axi4_0_w_bits_strb = 8'h0;
  assign ldut_l2_frontend_bus_axi4_0_w_bits_last = 1'h0;
  assign ldut_l2_frontend_bus_axi4_0_b_ready = 1'h0; // @[Bundles.scala 97:18]
  assign ldut_l2_frontend_bus_axi4_0_ar_valid = 1'h0; // @[Bundles.scala 90:18]
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_id = 8'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_addr = 32'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_len = 8'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_size = 3'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_burst = 2'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_lock = 1'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_cache = 4'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_prot = 3'h0;
  assign ldut_l2_frontend_bus_axi4_0_ar_bits_qos = 4'h0;
  assign ldut_l2_frontend_bus_axi4_0_r_ready = 1'h0; // @[Bundles.scala 96:18]
  assign ldut_nmi_0_rnmi = 1'h0; // @[SimTop.scala 61:20]
  assign ldut_nmi_0_rnmi_interrupt_vector = 32'h0; // @[SimTop.scala 62:37]
  assign ldut_nmi_0_rnmi_exception_vector = 32'h0; // @[SimTop.scala 63:37]
  assign ldut_uart_0_rxd = ldut_uart_0_rxd_uart_rxd_sync_io_q; // @[ShiftReg.scala 48:{24,24}]
  assign mem_clock = clock;
  assign mem_reset = reset;
  assign mem_io_axi4_0_aw_valid = ldut_mem_axi4_0_aw_valid; // @[SimAXIMem.scala 42:24]
  assign mem_io_axi4_0_aw_bits_id = ldut_mem_axi4_0_aw_bits_id; // @[SimAXIMem.scala 42:24]
  assign mem_io_axi4_0_aw_bits_addr = ldut_mem_axi4_0_aw_bits_addr; // @[SimAXIMem.scala 42:24]
  assign mem_io_axi4_0_aw_bits_len = ldut_mem_axi4_0_aw_bits_len; // @[SimAXIMem.scala 42:24]
  assign mem_io_axi4_0_aw_bits_size = ldut_mem_axi4_0_aw_bits_size; // @[SimAXIMem.scala 42:24]
  assign mem_io_axi4_0_aw_bits_burst = ldut_mem_axi4_0_aw_bits_burst; // @[SimAXIMem.scala 42:24]
  assign mem_io_axi4_0_w_valid = ldut_mem_axi4_0_w_valid; // @[SimAXIMem.scala 42:24]
  assign mem_io_axi4_0_w_bits_data = ldut_mem_axi4_0_w_bits_data; // @[SimAXIMem.scala 42:24]
  assign mem_io_axi4_0_w_bits_strb = ldut_mem_axi4_0_w_bits_strb; // @[SimAXIMem.scala 42:24]
  assign mem_io_axi4_0_w_bits_last = ldut_mem_axi4_0_w_bits_last; // @[SimAXIMem.scala 42:24]
  assign mem_io_axi4_0_b_ready = ldut_mem_axi4_0_b_ready; // @[SimAXIMem.scala 42:24]
  assign mem_io_axi4_0_ar_valid = ldut_mem_axi4_0_ar_valid; // @[SimAXIMem.scala 42:24]
  assign mem_io_axi4_0_ar_bits_id = ldut_mem_axi4_0_ar_bits_id; // @[SimAXIMem.scala 42:24]
  assign mem_io_axi4_0_ar_bits_addr = ldut_mem_axi4_0_ar_bits_addr; // @[SimAXIMem.scala 42:24]
  assign mem_io_axi4_0_ar_bits_len = ldut_mem_axi4_0_ar_bits_len; // @[SimAXIMem.scala 42:24]
  assign mem_io_axi4_0_ar_bits_size = ldut_mem_axi4_0_ar_bits_size; // @[SimAXIMem.scala 42:24]
  assign mem_io_axi4_0_ar_bits_burst = ldut_mem_axi4_0_ar_bits_burst; // @[SimAXIMem.scala 42:24]
  assign mem_io_axi4_0_r_ready = ldut_mem_axi4_0_r_ready; // @[SimAXIMem.scala 42:24]
  assign ldut_uart_0_rxd_uart_rxd_sync_clock = clock;
  assign ldut_uart_0_rxd_uart_rxd_sync_reset = reset;
  assign ldut_uart_0_rxd_uart_rxd_sync_io_d = io_uart_rx; // @[ShiftReg.scala 47:16]
endmodule
module mem_tb(
  input  [27:0] R0_addr,
  input         R0_en,
  input         R0_clk,
  output [7:0]  R0_data_0,
  output [7:0]  R0_data_1,
  output [7:0]  R0_data_2,
  output [7:0]  R0_data_3,
  output [7:0]  R0_data_4,
  output [7:0]  R0_data_5,
  output [7:0]  R0_data_6,
  output [7:0]  R0_data_7,
  input  [27:0] W0_addr,
  input         W0_en,
  input         W0_clk,
  input  [7:0]  W0_data_0,
  input  [7:0]  W0_data_1,
  input  [7:0]  W0_data_2,
  input  [7:0]  W0_data_3,
  input  [7:0]  W0_data_4,
  input  [7:0]  W0_data_5,
  input  [7:0]  W0_data_6,
  input  [7:0]  W0_data_7,
  input         W0_mask_0,
  input         W0_mask_1,
  input         W0_mask_2,
  input         W0_mask_3,
  input         W0_mask_4,
  input         W0_mask_5,
  input         W0_mask_6,
  input         W0_mask_7
);
  wire [27:0] mem_ext_R0_addr;
  wire  mem_ext_R0_en;
  wire  mem_ext_R0_clk;
  wire [63:0] mem_ext_R0_data;
  wire [27:0] mem_ext_W0_addr;
  wire  mem_ext_W0_en;
  wire  mem_ext_W0_clk;
  wire [63:0] mem_ext_W0_data;
  wire [7:0] mem_ext_W0_mask;
  wire [31:0] _GEN_4 = {W0_data_7,W0_data_6,W0_data_5,W0_data_4};
  wire [31:0] _GEN_5 = {W0_data_3,W0_data_2,W0_data_1,W0_data_0};
  wire [3:0] _GEN_10 = {W0_mask_7,W0_mask_6,W0_mask_5,W0_mask_4};
  wire [3:0] _GEN_11 = {W0_mask_3,W0_mask_2,W0_mask_1,W0_mask_0};
  mem_ext mem_ext (
    .R0_addr(mem_ext_R0_addr),
    .R0_en(mem_ext_R0_en),
    .R0_clk(mem_ext_R0_clk),
    .R0_data(mem_ext_R0_data),
    .W0_addr(mem_ext_W0_addr),
    .W0_en(mem_ext_W0_en),
    .W0_clk(mem_ext_W0_clk),
    .W0_data(mem_ext_W0_data),
    .W0_mask(mem_ext_W0_mask)
  );
  assign mem_ext_R0_clk = R0_clk;
  assign mem_ext_R0_en = R0_en;
  assign mem_ext_R0_addr = R0_addr;
  assign R0_data_0 = mem_ext_R0_data[7:0];
  assign R0_data_1 = mem_ext_R0_data[15:8];
  assign R0_data_2 = mem_ext_R0_data[23:16];
  assign R0_data_3 = mem_ext_R0_data[31:24];
  assign R0_data_4 = mem_ext_R0_data[39:32];
  assign R0_data_5 = mem_ext_R0_data[47:40];
  assign R0_data_6 = mem_ext_R0_data[55:48];
  assign R0_data_7 = mem_ext_R0_data[63:56];
  assign mem_ext_W0_clk = W0_clk;
  assign mem_ext_W0_en = W0_en;
  assign mem_ext_W0_addr = W0_addr;
  assign mem_ext_W0_data = {_GEN_4,_GEN_5};
  assign mem_ext_W0_mask = {_GEN_10,_GEN_11};
endmodule
