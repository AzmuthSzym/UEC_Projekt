`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2020 19:07:14
// Design Name: 
// Module Name: draw_ball_y
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


module draw_ball_y(
        input wire pclk,
        input wire reset,

        output reg [11:0] y_pos
    );
    
    reg [11:0]  y_pos_nxt=30;
    
    reg y_inc=0;
    reg [31:0]  ball_time_y = 1_000_000, ball_time_y_nxt=1_000_000;

    
    always@(posedge pclk)
    if(reset)
    begin

    end
    else
    begin
        
        y_pos <= #1 y_pos_nxt;

        ball_time_y <= #1 ball_time_y_nxt;
    end
    
    always @*
        begin   
 
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
            end
       end
endmodule