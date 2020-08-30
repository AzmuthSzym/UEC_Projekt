`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2020 19:17:18
// Design Name: 
// Module Name: draw_ball_x
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module draw_ball_x(
        input wire pclk,
        input wire reset,

        output reg [11:0] x_pos
    );
    
    
reg [31:0] ball_time_x= 800_000, ball_time_x_nxt=800_000;
reg [11:0] x_pos_nxt=30;
reg x_inc = 1;

    always@(posedge pclk) begin
    
        x_pos <= #1 x_pos_nxt;
        ball_time_x <= #1 ball_time_x_nxt;
    
    end

    always@* begin
    
    if(x_pos + 10 ==1023) x_inc =0;  
    if(x_pos - 10 == 0) x_inc=1;
                
                if(ball_time_x ==0) begin
                    if(x_inc) x_pos_nxt = x_pos+1;
                    else x_pos_nxt = x_pos -1; 
                    ball_time_x_nxt = 800_000;
                end
                else begin
                    x_pos_nxt = x_pos;
                    ball_time_x_nxt = ball_time_x -1;
                end
   end
   
endmodule
