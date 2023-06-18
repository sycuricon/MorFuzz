// This file created by /home/linhaoran/rtlfuzz-eval-full/full1/riscv-starship/repo/rocket-chip/scripts/vlsi_rom_gen

module StarshipROM(
  input clock,
  input oe,
  input me,
  input [10:0] address,
  output [31:0] q
);
  reg [31:0] out;
  reg [31:0] rom [0:2047];


//   initial begin: init_and_load
//     integer i;
//     // 256 is the maximum length of $readmemh filename supported by Verilator
//     reg [255*8-1:0] path;
// `ifdef RANDOMIZE
//   `ifdef RANDOMIZE_MEM_INIT
//     for (i = 0; i < 2048; i = i + 1) begin
//       rom[i] = {1{$random}};
//     end
//   `endif
// `endif
//     if (!$value$plusargs("maskromhex=%s", path)) begin
//       path = "sdboot.hex";
//     end
//     $readmemh(path, rom);
//   end : init_and_load


  always @(posedge clock) begin
    if (me) begin
      out <= rom[address];
    end
  end

  assign q = oe ? out : 32'bZ;

endmodule

