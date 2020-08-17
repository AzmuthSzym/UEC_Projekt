`timescale 1 ns / 1 ps

//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Szymon Dziadon / Pawel Majtas
// 
// Create Date: 17.08.2020 14:08:37
// Design Name: 
// Module Name: arcanoid_timing
// Project Name: Arkanoid
// Target Devices: 
// Tool Versions: 
// Description: Projekt Uk³ady Elektroniki Cyfrowej
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module arcanoid_top (
  input wire clk,
  input wire reset,
  output reg vs,
  output reg hs,
  output reg [3:0] r,
  output reg [3:0] g,
  output reg [3:0] b,
  output wire pclk_mirror
  );

  wire pclk;
  
    /*clk_wiz_0 my_clk (
    .clk(clk),
    .reset(reset),
    .locked(locked),
    .clk40MHz(pclk),
    .clk100MHz(mclk)
  );*/
  
  ODDR pclk_oddr (
    .Q(pclk_mirror),
    .C(pclk),
    .CE(1'b1),
    .D1(1'b1),
    .D2(1'b0),
    .R(1'b0),
    .S(1'b0)
  );

  clk_wiz_0 my_clk( .clk_in1(clk), .clk_out1(pclk));
  
  //[25] vblnk, [24] hblnk, [23] vsync, [22] hsync, [21:11] vcount, [10:0] hcount
  wire [25:0] arcanoid_bus [2:0];
  wire [10:0] vcount, hcount;
  wire vsync, hsync;
  wire vblnk, hblnk;

  wire [10:0] vcount_timing, hcount_timing;
  wire vsync_timing, hsync_timing;
  wire vblnk_timing, hblnk_timing;  
  wire [11:0] rgb_wire, rgb_out;
  
  arcanoid_timing my_timing (
    .vcount(vcount_timing),
    .vsync(vsync_timing),
    .vblnk(vblnk_timing),
    .hcount(hcount_timing),
    .hsync(hsync_timing),
    .hblnk(hblnk_timing),
    .pclk(pclk)
  );
  
  draw_board my_board (
    .hcount_in(hcount_timing),
    .hsync_in(hsync_timing),
    .hblnk_in(hblnk_timing),
    .vcount_in(vcount_timing),
    .vsync_in(vsync_timing),
    .vblnk_in(vblnk_timing),
    .pclk(pclk),
    .rgb_out(rgb_out),
    .hcount_out(hcount),
    .vcount_out(vcount),
    .hblnk_out(hblnk),
    .hsync_out(hsync),
    .vblnk_out(vblnk),
    .vsync_out(vsync),
    .reset(reset)
  );

  wire [3:0] red =  rgb_out[11:8];
  wire [3:0] green = rgb_out[7:4];
  wire [3:0] blue = rgb_out[3:0]; 
  
  always @(posedge pclk)
  begin
    // Just pass these through.
    hs <= hsync;
    vs <= vsync;
    {r,g,b} <= {red,green,blue};
  end
  
endmodule
