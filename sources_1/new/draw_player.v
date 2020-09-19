`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Szymon Dziadon / Pawel Majtas
// 
// Create Date: 19.08.2020 14:18:56
// Design Name: 
// Module Name: draw_player
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

module draw_player(
        input wire reset,
        input wire pclk,
        input wire [10:0] hcount_in,
        input wire hsync_in,
        input wire hblnk_in,
        input wire [10:0] vcount_in,
        input wire vsync_in,
        input wire vblnk_in,
        input wire [11:0] rgb_in,
        input wire [11:0] x_pos,
        input wire [11:0] y_pos,
    
        output reg [10:0] vcount_out,
        output reg vsync_out,
        output reg vblnk_out,
        output reg [10:0] hcount_out,
        output reg hsync_out,
        output reg hblnk_out,
        output reg [11:0] rgb_out
    );
    
    localparam HEIGHT = 20, WIDTH = 200;
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
     
        rgb_out <= #1 rgb_nxt;
    end
        
    always @*
        begin
            if ((vcount_in >= y_pos && vcount_in <= (y_pos+HEIGHT)) && (hcount_in >= x_pos && hcount_in <= (x_pos+WIDTH))) rgb_nxt = 12'hf_0_0; 
            else rgb_nxt = rgb_in;           
        end
            
endmodule
