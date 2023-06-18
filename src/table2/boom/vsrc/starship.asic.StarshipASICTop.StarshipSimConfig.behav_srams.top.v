
module tag_array_ext(
  input RW0_clk,
  input [5:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [7:0] RW0_wmask,
  input [175:0] RW0_wdata,
  output [175:0] RW0_rdata
);

  reg reg_RW0_ren;
  reg [5:0] reg_RW0_addr;
  reg [175:0] ram [63:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 64; initvar = initvar+1)
        ram[initvar] = {6 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;
  always @(posedge RW0_clk)
    if (RW0_en && RW0_wmode) begin
      for(i=0;i<8;i=i+1) begin
        if(RW0_wmask[i]) begin
          ram[RW0_addr][i*22 +: 22] <= RW0_wdata[i*22 +: 22];
        end
      end
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [191:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random, $random, $random, $random, $random, $random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  always @(posedge RW0_clk) RW0_random <= {$random, $random, $random, $random, $random, $random};
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[175:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule

module array_0_0_ext(
  input W0_clk,
  input [7:0] W0_addr,
  input W0_en,
  input [127:0] W0_data,
  input [1:0] W0_mask,
  input R0_clk,
  input [7:0] R0_addr,
  input R0_en,
  output [127:0] R0_data
);

  reg reg_R0_ren;
  reg [7:0] reg_R0_addr;
  reg [127:0] ram [255:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 256; initvar = initvar+1)
        ram[initvar] = {4 {$random}};
      reg_R0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge R0_clk)
    reg_R0_ren <= R0_en;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      if (W0_mask[0]) ram[W0_addr][63:0] <= W0_data[63:0];
      if (W0_mask[1]) ram[W0_addr][127:64] <= W0_data[127:64];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [127:0] R0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      R0_random = {$random, $random, $random, $random};
      reg_R0_ren = R0_random[0];
    end
  `endif
  always @(posedge R0_clk) R0_random <= {$random, $random, $random, $random};
  assign R0_data = reg_R0_ren ? ram[reg_R0_addr] : R0_random[127:0];
  `else
  assign R0_data = ram[reg_R0_addr];
  `endif

endmodule

module tag_array_0_ext(
  input RW0_clk,
  input [5:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [7:0] RW0_wmask,
  input [159:0] RW0_wdata,
  output [159:0] RW0_rdata
);

  reg reg_RW0_ren;
  reg [5:0] reg_RW0_addr;
  reg [159:0] ram [63:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 64; initvar = initvar+1)
        ram[initvar] = {5 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;
  always @(posedge RW0_clk)
    if (RW0_en && RW0_wmode) begin
      for(i=0;i<8;i=i+1) begin
        if(RW0_wmask[i]) begin
          ram[RW0_addr][i*20 +: 20] <= RW0_wdata[i*20 +: 20];
        end
      end
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [159:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random, $random, $random, $random, $random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  always @(posedge RW0_clk) RW0_random <= {$random, $random, $random, $random, $random};
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[159:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule

module dataArrayB0Way_0_ext(
  input RW0_clk,
  input [7:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [63:0] RW0_wdata,
  output [63:0] RW0_rdata
);

  reg reg_RW0_ren;
  reg [7:0] reg_RW0_addr;
  reg [63:0] ram [255:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 256; initvar = initvar+1)
        ram[initvar] = {2 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;
  always @(posedge RW0_clk)
    if (RW0_en && RW0_wmode) begin
      for(i=0;i<1;i=i+1) begin
        ram[RW0_addr][i*64 +: 64] <= RW0_wdata[i*64 +: 64];
      end
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random, $random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  always @(posedge RW0_clk) RW0_random <= {$random, $random};
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[63:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule

module hi_us_ext(
  input W0_clk,
  input [6:0] W0_addr,
  input W0_en,
  input [3:0] W0_data,
  input [3:0] W0_mask,
  input R0_clk,
  input [6:0] R0_addr,
  input R0_en,
  output [3:0] R0_data
);

  reg reg_R0_ren;
  reg [6:0] reg_R0_addr;
  reg [3:0] ram [127:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 128; initvar = initvar+1)
        ram[initvar] = {1 {$random}};
      reg_R0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge R0_clk)
    reg_R0_ren <= R0_en;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      if (W0_mask[0]) ram[W0_addr][0:0] <= W0_data[0:0];
      if (W0_mask[1]) ram[W0_addr][1:1] <= W0_data[1:1];
      if (W0_mask[2]) ram[W0_addr][2:2] <= W0_data[2:2];
      if (W0_mask[3]) ram[W0_addr][3:3] <= W0_data[3:3];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] R0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      R0_random = {$random};
      reg_R0_ren = R0_random[0];
    end
  `endif
  always @(posedge R0_clk) R0_random <= {$random};
  assign R0_data = reg_R0_ren ? ram[reg_R0_addr] : R0_random[3:0];
  `else
  assign R0_data = ram[reg_R0_addr];
  `endif

endmodule

module table_ext(
  input W0_clk,
  input [6:0] W0_addr,
  input W0_en,
  input [43:0] W0_data,
  input [3:0] W0_mask,
  input R0_clk,
  input [6:0] R0_addr,
  input R0_en,
  output [43:0] R0_data
);

  reg reg_R0_ren;
  reg [6:0] reg_R0_addr;
  reg [43:0] ram [127:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 128; initvar = initvar+1)
        ram[initvar] = {2 {$random}};
      reg_R0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge R0_clk)
    reg_R0_ren <= R0_en;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      if (W0_mask[0]) ram[W0_addr][10:0] <= W0_data[10:0];
      if (W0_mask[1]) ram[W0_addr][21:11] <= W0_data[21:11];
      if (W0_mask[2]) ram[W0_addr][32:22] <= W0_data[32:22];
      if (W0_mask[3]) ram[W0_addr][43:33] <= W0_data[43:33];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] R0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      R0_random = {$random, $random};
      reg_R0_ren = R0_random[0];
    end
  `endif
  always @(posedge R0_clk) R0_random <= {$random, $random};
  assign R0_data = reg_R0_ren ? ram[reg_R0_addr] : R0_random[43:0];
  `else
  assign R0_data = ram[reg_R0_addr];
  `endif

endmodule

module hi_us_0_ext(
  input W0_clk,
  input [7:0] W0_addr,
  input W0_en,
  input [3:0] W0_data,
  input [3:0] W0_mask,
  input R0_clk,
  input [7:0] R0_addr,
  input R0_en,
  output [3:0] R0_data
);

  reg reg_R0_ren;
  reg [7:0] reg_R0_addr;
  reg [3:0] ram [255:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 256; initvar = initvar+1)
        ram[initvar] = {1 {$random}};
      reg_R0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge R0_clk)
    reg_R0_ren <= R0_en;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      if (W0_mask[0]) ram[W0_addr][0:0] <= W0_data[0:0];
      if (W0_mask[1]) ram[W0_addr][1:1] <= W0_data[1:1];
      if (W0_mask[2]) ram[W0_addr][2:2] <= W0_data[2:2];
      if (W0_mask[3]) ram[W0_addr][3:3] <= W0_data[3:3];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] R0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      R0_random = {$random};
      reg_R0_ren = R0_random[0];
    end
  `endif
  always @(posedge R0_clk) R0_random <= {$random};
  assign R0_data = reg_R0_ren ? ram[reg_R0_addr] : R0_random[3:0];
  `else
  assign R0_data = ram[reg_R0_addr];
  `endif

endmodule

module table_0_ext(
  input W0_clk,
  input [7:0] W0_addr,
  input W0_en,
  input [47:0] W0_data,
  input [3:0] W0_mask,
  input R0_clk,
  input [7:0] R0_addr,
  input R0_en,
  output [47:0] R0_data
);

  reg reg_R0_ren;
  reg [7:0] reg_R0_addr;
  reg [47:0] ram [255:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 256; initvar = initvar+1)
        ram[initvar] = {2 {$random}};
      reg_R0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge R0_clk)
    reg_R0_ren <= R0_en;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      if (W0_mask[0]) ram[W0_addr][11:0] <= W0_data[11:0];
      if (W0_mask[1]) ram[W0_addr][23:12] <= W0_data[23:12];
      if (W0_mask[2]) ram[W0_addr][35:24] <= W0_data[35:24];
      if (W0_mask[3]) ram[W0_addr][47:36] <= W0_data[47:36];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] R0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      R0_random = {$random, $random};
      reg_R0_ren = R0_random[0];
    end
  `endif
  always @(posedge R0_clk) R0_random <= {$random, $random};
  assign R0_data = reg_R0_ren ? ram[reg_R0_addr] : R0_random[47:0];
  `else
  assign R0_data = ram[reg_R0_addr];
  `endif

endmodule

module table_1_ext(
  input W0_clk,
  input [6:0] W0_addr,
  input W0_en,
  input [51:0] W0_data,
  input [3:0] W0_mask,
  input R0_clk,
  input [6:0] R0_addr,
  input R0_en,
  output [51:0] R0_data
);

  reg reg_R0_ren;
  reg [6:0] reg_R0_addr;
  reg [51:0] ram [127:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 128; initvar = initvar+1)
        ram[initvar] = {2 {$random}};
      reg_R0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge R0_clk)
    reg_R0_ren <= R0_en;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      if (W0_mask[0]) ram[W0_addr][12:0] <= W0_data[12:0];
      if (W0_mask[1]) ram[W0_addr][25:13] <= W0_data[25:13];
      if (W0_mask[2]) ram[W0_addr][38:26] <= W0_data[38:26];
      if (W0_mask[3]) ram[W0_addr][51:39] <= W0_data[51:39];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] R0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      R0_random = {$random, $random};
      reg_R0_ren = R0_random[0];
    end
  `endif
  always @(posedge R0_clk) R0_random <= {$random, $random};
  assign R0_data = reg_R0_ren ? ram[reg_R0_addr] : R0_random[51:0];
  `else
  assign R0_data = ram[reg_R0_addr];
  `endif

endmodule

module meta_0_ext(
  input W0_clk,
  input [6:0] W0_addr,
  input W0_en,
  input [119:0] W0_data,
  input [3:0] W0_mask,
  input R0_clk,
  input [6:0] R0_addr,
  input R0_en,
  output [119:0] R0_data
);

  reg reg_R0_ren;
  reg [6:0] reg_R0_addr;
  reg [119:0] ram [127:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 128; initvar = initvar+1)
        ram[initvar] = {4 {$random}};
      reg_R0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge R0_clk)
    reg_R0_ren <= R0_en;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      if (W0_mask[0]) ram[W0_addr][29:0] <= W0_data[29:0];
      if (W0_mask[1]) ram[W0_addr][59:30] <= W0_data[59:30];
      if (W0_mask[2]) ram[W0_addr][89:60] <= W0_data[89:60];
      if (W0_mask[3]) ram[W0_addr][119:90] <= W0_data[119:90];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [127:0] R0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      R0_random = {$random, $random, $random, $random};
      reg_R0_ren = R0_random[0];
    end
  `endif
  always @(posedge R0_clk) R0_random <= {$random, $random, $random, $random};
  assign R0_data = reg_R0_ren ? ram[reg_R0_addr] : R0_random[119:0];
  `else
  assign R0_data = ram[reg_R0_addr];
  `endif

endmodule

module btb_0_ext(
  input W0_clk,
  input [6:0] W0_addr,
  input W0_en,
  input [55:0] W0_data,
  input [3:0] W0_mask,
  input R0_clk,
  input [6:0] R0_addr,
  input R0_en,
  output [55:0] R0_data
);

  reg reg_R0_ren;
  reg [6:0] reg_R0_addr;
  reg [55:0] ram [127:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 128; initvar = initvar+1)
        ram[initvar] = {2 {$random}};
      reg_R0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge R0_clk)
    reg_R0_ren <= R0_en;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      if (W0_mask[0]) ram[W0_addr][13:0] <= W0_data[13:0];
      if (W0_mask[1]) ram[W0_addr][27:14] <= W0_data[27:14];
      if (W0_mask[2]) ram[W0_addr][41:28] <= W0_data[41:28];
      if (W0_mask[3]) ram[W0_addr][55:42] <= W0_data[55:42];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] R0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      R0_random = {$random, $random};
      reg_R0_ren = R0_random[0];
    end
  `endif
  always @(posedge R0_clk) R0_random <= {$random, $random};
  assign R0_data = reg_R0_ren ? ram[reg_R0_addr] : R0_random[55:0];
  `else
  assign R0_data = ram[reg_R0_addr];
  `endif

endmodule

module ebtb_ext(
  input W0_clk,
  input [6:0] W0_addr,
  input W0_en,
  input [39:0] W0_data,
  input R0_clk,
  input [6:0] R0_addr,
  input R0_en,
  output [39:0] R0_data
);

  reg reg_R0_ren;
  reg [6:0] reg_R0_addr;
  reg [39:0] ram [127:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 128; initvar = initvar+1)
        ram[initvar] = {2 {$random}};
      reg_R0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge R0_clk)
    reg_R0_ren <= R0_en;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      ram[W0_addr][39:0] <= W0_data[39:0];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] R0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      R0_random = {$random, $random};
      reg_R0_ren = R0_random[0];
    end
  `endif
  always @(posedge R0_clk) R0_random <= {$random, $random};
  assign R0_data = reg_R0_ren ? ram[reg_R0_addr] : R0_random[39:0];
  `else
  assign R0_data = ram[reg_R0_addr];
  `endif

endmodule

module data_ext(
  input W0_clk,
  input [10:0] W0_addr,
  input W0_en,
  input [7:0] W0_data,
  input [3:0] W0_mask,
  input R0_clk,
  input [10:0] R0_addr,
  input R0_en,
  output [7:0] R0_data
);

  reg reg_R0_ren;
  reg [10:0] reg_R0_addr;
  reg [7:0] ram [2047:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 2048; initvar = initvar+1)
        ram[initvar] = {1 {$random}};
      reg_R0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge R0_clk)
    reg_R0_ren <= R0_en;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      if (W0_mask[0]) ram[W0_addr][1:0] <= W0_data[1:0];
      if (W0_mask[1]) ram[W0_addr][3:2] <= W0_data[3:2];
      if (W0_mask[2]) ram[W0_addr][5:4] <= W0_data[5:4];
      if (W0_mask[3]) ram[W0_addr][7:6] <= W0_data[7:6];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] R0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      R0_random = {$random};
      reg_R0_ren = R0_random[0];
    end
  `endif
  always @(posedge R0_clk) R0_random <= {$random};
  assign R0_data = reg_R0_ren ? ram[reg_R0_addr] : R0_random[7:0];
  `else
  assign R0_data = ram[reg_R0_addr];
  `endif

endmodule

module meta_ext(
  input W0_clk,
  input [4:0] W0_addr,
  input W0_en,
  input [239:0] W0_data,
  input R0_clk,
  input [4:0] R0_addr,
  input R0_en,
  output [239:0] R0_data
);

  reg reg_R0_ren;
  reg [4:0] reg_R0_addr;
  reg [239:0] ram [31:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 32; initvar = initvar+1)
        ram[initvar] = {8 {$random}};
      reg_R0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge R0_clk)
    reg_R0_ren <= R0_en;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      ram[W0_addr][239:0] <= W0_data[239:0];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [255:0] R0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      R0_random = {$random, $random, $random, $random, $random, $random, $random, $random};
      reg_R0_ren = R0_random[0];
    end
  `endif
  always @(posedge R0_clk) R0_random <= {$random, $random, $random, $random, $random, $random, $random, $random};
  assign R0_data = reg_R0_ren ? ram[reg_R0_addr] : R0_random[239:0];
  `else
  assign R0_data = ram[reg_R0_addr];
  `endif

endmodule

module ghist_0_ext(
  input W0_clk,
  input [4:0] W0_addr,
  input W0_en,
  input [71:0] W0_data,
  input R0_clk,
  input [4:0] R0_addr,
  input R0_en,
  output [71:0] R0_data
);

  reg reg_R0_ren;
  reg [4:0] reg_R0_addr;
  reg [71:0] ram [31:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 32; initvar = initvar+1)
        ram[initvar] = {3 {$random}};
      reg_R0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge R0_clk)
    reg_R0_ren <= R0_en;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      ram[W0_addr][71:0] <= W0_data[71:0];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [95:0] R0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      R0_random = {$random, $random, $random};
      reg_R0_ren = R0_random[0];
    end
  `endif
  always @(posedge R0_clk) R0_random <= {$random, $random, $random};
  assign R0_data = reg_R0_ren ? ram[reg_R0_addr] : R0_random[71:0];
  `else
  assign R0_data = ram[reg_R0_addr];
  `endif

endmodule

module rob_debug_inst_mem_ext(
  input W0_clk,
  input [4:0] W0_addr,
  input W0_en,
  input [95:0] W0_data,
  input [2:0] W0_mask,
  input R0_clk,
  input [4:0] R0_addr,
  input R0_en,
  output [95:0] R0_data
);

  reg reg_R0_ren;
  reg [4:0] reg_R0_addr;
  reg [95:0] ram [31:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 32; initvar = initvar+1)
        ram[initvar] = {3 {$random}};
      reg_R0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge R0_clk)
    reg_R0_ren <= R0_en;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      if (W0_mask[0]) ram[W0_addr][31:0] <= W0_data[31:0];
      if (W0_mask[1]) ram[W0_addr][63:32] <= W0_data[63:32];
      if (W0_mask[2]) ram[W0_addr][95:64] <= W0_data[95:64];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [95:0] R0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      R0_random = {$random, $random, $random};
      reg_R0_ren = R0_random[0];
    end
  `endif
  always @(posedge R0_clk) R0_random <= {$random, $random, $random};
  assign R0_data = reg_R0_ren ? ram[reg_R0_addr] : R0_random[95:0];
  `else
  assign R0_data = ram[reg_R0_addr];
  `endif

endmodule

module l2_tlb_ram_ext(
  input RW0_clk,
  input [8:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [44:0] RW0_wdata,
  output [44:0] RW0_rdata
);

  reg reg_RW0_ren;
  reg [8:0] reg_RW0_addr;
  reg [44:0] ram [511:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 512; initvar = initvar+1)
        ram[initvar] = {2 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;
  always @(posedge RW0_clk)
    if (RW0_en && RW0_wmode) begin
      for(i=0;i<1;i=i+1) begin
        ram[RW0_addr][i*45 +: 45] <= RW0_wdata[i*45 +: 45];
      end
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random, $random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  always @(posedge RW0_clk) RW0_random <= {$random, $random};
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[44:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule
