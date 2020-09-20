`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Szymon Dziadon / Pawel Majtas
// 
// Create Date: 17.08.2020 14:08:37
// Design Name: 
// Module Name: draw_board
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

module draw_board
    
    (
        
        input wire pclk,
        input wire [10:0] hcount_in,
        input wire hsync_in,
        input wire hblnk_in,
        input wire [10:0] vcount_in,
        input wire vsync_in,
        input wire vblnk_in,
        input wire [15:0] blocks_in,
        input wire reset,
        
        output reg [10:0] vcount_out,
        output reg vsync_out,
        output reg vblnk_out,
        output reg [10:0] hcount_out,
        output reg hsync_out,
        output reg hblnk_out,
        output reg [15:0] blocks_out=0, 
        output reg [11:0] rgb_out
    );
    `include "parameters.v"
    localparam HEIGHT = 50, WIDTH = 100;
    localparam COLOR = 12'he_f_d;
    reg [11:0] rgb_nxt = 0;

    
    always@(posedge pclk)
    if(reset)
    begin
        hsync_out <= 0;
        vsync_out <= 0;
 
        hblnk_out <= 0;
        
        vblnk_out <= 0;
 
        vcount_out <= 0;
        hcount_out <= 0;
 
        rgb_out <= 0;    
    end
    else
    begin
        hsync_out <= #1 hsync_in;
        vsync_out <= #1 vsync_in;
     
        hblnk_out <= #1 hblnk_in;
        vblnk_out <= #1 vblnk_in;
     
        vcount_out <= #1 vcount_in;
        hcount_out <= #1 hcount_in;
        
        blocks_out <= #1 blocks_in;
     
        rgb_out <= #1 rgb_nxt;
    end
    
    
    always @*
        begin
           //FIRST ROW
           if ((vcount_in >= VER1 && vcount_in <= (VER1+B_HEIGHT)) && (hcount_in >= HOR1 && hcount_in <= (HOR1+B_WIDTH)) && !(blocks_in & 16'b1)) rgb_nxt = 12'h2_2_f;
           else if ((vcount_in >= VER1 && vcount_in <= (VER1+B_HEIGHT)) && (hcount_in >= HOR2 && hcount_in <= (HOR2+B_WIDTH)) && !(blocks_in & 16'h2)) rgb_nxt = 12'h2_2_f;
           else if ((vcount_in >= VER1 && vcount_in <= (VER1+B_HEIGHT)) && (hcount_in >= HOR3 && hcount_in <= (HOR3+B_WIDTH)) && !(blocks_in & 16'h4)) rgb_nxt = 12'h2_2_f;
           else if ((vcount_in >= VER1 && vcount_in <= (VER1+B_HEIGHT)) && (hcount_in >= HOR4 && hcount_in <= (HOR4+B_WIDTH)) && !(blocks_in & 16'h8) ) rgb_nxt = 12'h2_2_f;
           
           //SECOND ROW
           else if ((vcount_in >= VER2 && vcount_in <= (VER2+B_HEIGHT)) && (hcount_in >= HOR1 && hcount_in <= (HOR1+B_WIDTH))&& !(blocks_in & 16'h10) ) rgb_nxt = 12'h2_2_f;
           else if ((vcount_in >= VER2 && vcount_in <= (VER2+B_HEIGHT)) && (hcount_in >= HOR2 && hcount_in <= (HOR2+B_WIDTH))&& !(blocks_in & 16'h20) ) rgb_nxt = 12'h2_2_f;
           else if ((vcount_in >= VER2 && vcount_in <= (VER2+B_HEIGHT)) && (hcount_in >= HOR3 && hcount_in <= (HOR3+B_WIDTH))&& !(blocks_in & 16'h40) ) rgb_nxt = 12'h2_2_f;
           else if ((vcount_in >= VER2 && vcount_in <= (VER2+B_HEIGHT)) && (hcount_in >= HOR4 && hcount_in <= (HOR4+B_WIDTH)) && !(blocks_in & 16'h80) ) rgb_nxt = 12'h2_2_f;
           
           //THIRD ROW
           else if ((vcount_in >= VER3 && vcount_in <= (VER3+B_HEIGHT)) && (hcount_in >= HOR1 && hcount_in <= (HOR1+B_WIDTH))&& !(blocks_in & 16'h100) ) rgb_nxt = 12'h2_2_f;
           else if ((vcount_in >= VER3 && vcount_in <= (VER3+B_HEIGHT)) && (hcount_in >= HOR2 && hcount_in <= (HOR2+B_WIDTH))&& !(blocks_in & 16'h200) ) rgb_nxt = 12'h2_2_f;
           else if ((vcount_in >= VER3 && vcount_in <= (VER3+B_HEIGHT)) && (hcount_in >= HOR3 && hcount_in <= (HOR3+B_WIDTH))&& !(blocks_in & 16'h400) ) rgb_nxt = 12'h2_2_f;
           else if ((vcount_in >= VER3 && vcount_in <= (VER3+B_HEIGHT)) && (hcount_in >= HOR4 && hcount_in <= (HOR4+B_WIDTH))&& !(blocks_in & 16'h800) ) rgb_nxt = 12'h2_2_f;
           
           //FOURTH ROW
           else if ((vcount_in >= VER4 && vcount_in <= (VER4+B_HEIGHT)) && (hcount_in >= HOR1 && hcount_in <= (HOR1+B_WIDTH)) && !(blocks_in & 16'h1000)) rgb_nxt = 12'h2_2_f;
           else if ((vcount_in >= VER4 && vcount_in <= (VER4+B_HEIGHT)) && (hcount_in >= HOR2 && hcount_in <= (HOR2+B_WIDTH))&& !(blocks_in & 16'h2000) ) rgb_nxt = 12'h2_2_f;
           else if ((vcount_in >= VER4 && vcount_in <= (VER4+B_HEIGHT)) && (hcount_in >= HOR3 && hcount_in <= (HOR3+B_WIDTH))&& !(blocks_in & 16'h4000) ) rgb_nxt = 12'h2_2_f;
           else if ((vcount_in >= VER4 && vcount_in <= (VER4+B_HEIGHT)) && (hcount_in >= HOR4 && hcount_in <= (HOR4+B_WIDTH))&& !(blocks_in & 16'h8000) ) rgb_nxt = 12'h2_2_f;
                                          
           else rgb_nxt = 12'h8_8_8;
           
        end
    
endmodule
