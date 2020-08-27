`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Szymon Dziadon / Pawel Majtas
// 
// Create Date: 20.08.2020 23:08:37
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

module draw_ball(
        input wire pclk,
        input wire [10:0] hcount_in,
        input wire hsync_in,
        input wire hblnk_in,
        input wire [10:0] vcount_in,
        input wire vsync_in,
        input wire vblnk_in,
        input wire [11:0] rgb_in,
        input wire reset,

        output reg [10:0] vcount_out,
        output reg vsync_out,
        output reg vblnk_out,
        output reg [10:0] hcount_out,
        output reg hsync_out,
        output reg hblnk_out,
        output reg [11:0] rgb_out
    );
    
    reg [11:0] rgb_nxt = 0;
    reg [11:0] y_pos = 30, y_pos_nxt;
    reg [11:0] x_pos = 30, x_pos_nxt;
    reg x_inc=1,y_inc=0;
    reg [31:0] ball_time_x= 800_000, ball_time_x_nxt=800_000, ball_time_y = 1_000_000, ball_time_y_nxt=1_000_000;
    
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
        
        x_pos <= #1 x_pos_nxt;
        y_pos <= #1 y_pos_nxt;
        ball_time_x <= #1 ball_time_x_nxt;
        ball_time_y <= #1 ball_time_y_nxt;
    end
    
    always @*
        begin
            if (((hcount_in-x_pos)*(hcount_in-x_pos))+((vcount_in-y_pos)*(vcount_in-y_pos)) <= 100) rgb_nxt = 12'h0_f_0; 
            else rgb_nxt = rgb_in;    
            
            if(x_pos ==1023) x_inc =0;  
            if(x_pos == 0) x_inc=1;

            if(ball_time_x ==0) begin
                if(x_inc) x_pos_nxt = x_pos+1;
                else x_pos_nxt = x_pos -1; 
                ball_time_x_nxt = 800_000;
            end
            else begin
                x_pos_nxt = x_pos;
                ball_time_x_nxt = ball_time_x -1;
            end
            /*
            if(y_pos ==767) y_inc =0;  
            if(y_pos == 0) y_inc=1;
                        
            if(ball_time_y ==0) begin
                if(y_inc) y_pos_nxt = y_pos+1;
                else y_pos_nxt = y_pos -1; 
                ball_time_y_nxt = 1_000_000;
            end
            else begin
                y_pos_nxt = y_pos;
                ball_time_y_nxt = ball_time_y -1;
            end*/
       end
endmodule
