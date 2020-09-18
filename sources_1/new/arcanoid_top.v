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
  output wire pclk_mirror,
  inout ps2_clk,
  inout ps2_data
  );

  wire pclk, locked, mclk;
  
  clk_wiz_0 my_clk (
    .clk(clk),
    .reset(reset),
    .locked(locked),
    .clk65MHz(pclk),
    .clk100MHz(mclk)
  );
  
  ODDR pclk_oddr (
    .Q(pclk_mirror),
    .C(pclk),
    .CE(1'b1),
    .D1(1'b1),
    .D2(1'b0),
    .R(1'b0),
    .S(1'b0)
  );

  wire [10:0] vcount, hcount;
  wire vsync, hsync;
  wire vblnk, hblnk;
  wire mouse_left; 
  wire [11:0] rgb_wire, rgb_out;
  wire [11:0] xpos, ypos;
  wire [11:0] xpos_buffer, ypos_buffer;
  wire reset_buff;

  wire ps2_mousedata, ps2_mouseclk;
  MouseCtl my_mouse (
     .clk(mclk),
     .rst(reset_buff),
     .ps2_clk(ps2_mouseclk),
     .ps2_data(ps2_mousedata),
     .ypos(ypos),
     .xpos(xpos),
     .left(mouse_left)
  );

  wire [10:0] vcount_timing, hcount_timing;
  wire vsync_timing, hsync_timing;
  wire vblnk_timing, hblnk_timing; 
  
  arcanoid_timing my_timing (
    .vcount(vcount_timing),
    .vsync(vsync_timing),
    .vblnk(vblnk_timing),
    .hcount(hcount_timing),
    .hsync(hsync_timing),
    .hblnk(hblnk_timing),
    .pclk(pclk),
    .reset(reset)
  );

  wire [10:0] vcount_board, hcount_board;
  wire vsync_board, hsync_board;
  wire vblnk_board, hblnk_board;  
  wire [11:0] rgb_board;
  wire [11:0] xpos_ctl, ypos_ctl;
  wire [15:0] blocks_board, blocks_det, blocks_d_out;
  
  draw_board my_board (
    .hcount_in(hcount_timing),
    .hsync_in(hsync_timing),
    .hblnk_in(hblnk_timing),
    .vcount_in(vcount_timing),
    .vsync_in(vsync_timing),
    .vblnk_in(vblnk_timing),
    .pclk(pclk),
    .rgb_out(rgb_board),
    .hcount_out(hcount_board),
    .vcount_out(vcount_board),
    .hblnk_out(hblnk_board),
    .hsync_out(hsync_board),
    .vblnk_out(vblnk_board),
    .vsync_out(vsync_board),
    .blocks_in(blocks_det),
    //.blocks_out(blocks_board),
    .reset(reset)
  );
     
   player_ctl my_player_ctl(
   .mouse_left(mouse_left),
   .mouse_xpos(xpos),
   .mouse_ypos(ypos),
   .xpos(xpos_ctl),
   .ypos(ypos_ctl),
   .pclk(pclk),
   .reset(reset)
  );
   
  wire [10:0] vcount_player, hcount_player;
  wire vsync_player, hsync_player;
  wire vblnk_player, hblnk_player;  
  wire [11:0] rgb_player;
         
  draw_player my_player (
    .hcount_in(hcount_board),
    .hsync_in(hsync_board),
    .hblnk_in(hblnk_board),
    .vcount_in(vcount_board),
    .vsync_in(vsync_board),
    .vblnk_in(vblnk_board),
    .rgb_in(rgb_board),
    .pclk(pclk),
    .rgb_out(rgb_player),
    .hcount_out(hcount_player),
    .vcount_out(vcount_player),
    .hblnk_out(hblnk_player),
    .hsync_out(hsync_player),
    .vblnk_out(vblnk_player),
    .vsync_out(vsync_player),
    .reset(reset),
    .x_pos(xpos_ctl),
    .y_pos(ypos_ctl)    
  );
    wire [11:0] x_pos,y_pos, x_pos_out, y_pos_out;
    wire collision;
    
  draw_ball_x my_x(
  .pclk(pclk),
  .x_pos(x_pos),
  .collision_det(collision)
  );  
    


  draw_ball_y my_y (
    .pclk(pclk),
    .y_pos(y_pos),
    .collision_det(collision),
    .mouse_y_pos(ypos_ctl),
    .mouse_x_pos(xpos_ctl),
    .x_pos(x_pos)
);

  collision_detector my_detector(
  .x_pos(x_pos),
  .y_pos(y_pos),
  .collision_det(collision),
//  .blocks_in(blocks_board),
  .blocks_out(blocks_det),
  .pclk(pclk)
  
  );
/*
  collision_detector_1 my_1(
    .x_pos(x_pos),
    .y_pos(y_pos),
    .collision_det(collision),
    .blocks_in(blocks_d_out),
    .blocks_out(blocks_det),
    .pclk(pclk)
  );*/
    
  draw_ball my_ball (
    .hcount_in(hcount_player),
    .hsync_in(hsync_player),
    .hblnk_in(hblnk_player),
    .vcount_in(vcount_player),
    .vsync_in(vsync_player),
    .vblnk_in(vblnk_player),
    .rgb_in(rgb_player),
    .pclk(pclk),
    .x_pos(x_pos),
    .y_pos(y_pos),
    
    .x_pos_out(x_pos_out),
    .y_pos_out(y_pos_out),
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

  wire [3:0] r_out, g_out, b_out;
  
  MouseDisplay my_display (
    .pixel_clk(pclk),
    .xpos(xpos_buffer),
    .ypos(ypos_buffer),
    .hcount(hcount),
    .vcount(vcount),
    .blank(hblnk|vblnk),
    .red_in(red),
    .green_in(green),
    .blue_in(blue),
    .red_out(r_out),
    .green_out(g_out),
    .blue_out(b_out)
  );  
  
  CrossClockBuffer my_buffer_ps2data(
  .clk(pclk),
  .inout_data_in(ps2_mousedata),
  .inout_data_out(ps2_data)
  );
  
  CrossClockBuffer my_buffer_ps2clock(
  .clk(pclk),
  .inout_data_in(ps2_mouseclk),
  .inout_data_out(ps2_clk)
  );
  
  
  CrossClockBuffer my_buffer_mousexpos(
  .clk(pclk),
  .data_in(xpos),
  .data_out(xpos_buffer)
  );
  
  CrossClockBuffer my_buffer_mouseypos(
  .clk(pclk),
  .data_in(ypos),
  .data_out(ypos_buffer)
  );
  
  CrossClockBuffer my_buffer_reset(
  .clk(pclk),
  .data_in(reset),
  .data_out(reset_buff)
  );


  always @(posedge pclk)
  begin
    // Just pass these through.
    hs <= hsync;
    vs <= vsync;
    {r,g,b} <= {r_out,g_out,b_out};
    
  end
  
endmodule
