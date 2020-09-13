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
        input wire collision_det,

        output reg [11:0] x_pos
    );
    
    
reg [31:0] ball_time_x= 800_000, ball_time_x_nxt=800_000;
reg [11:0] x_pos_nxt=220,x_pos_prev;
//reg x_inc = 1;
reg state, state_nxt;
localparam DOWN=0, UP=1;

    always@(posedge pclk) begin
        ball_time_x <= #1 ball_time_x_nxt;
        //x_pos_prev <= #1 x_pos;
        x_pos <= #1 x_pos_nxt;    
        state <= #1 state_nxt;
       
    end

    always@* begin
        
    
    end

    always@* begin
    
    if(ball_time_x  ==0) begin
                ball_time_x_nxt = 800_000;
                
                case(state)
                    DOWN: begin
                    if((x_pos +10==1023) || (collision_det) ) state_nxt = UP;
                    //else if(collision_det) state_nxt = UP;
                    else state_nxt = state;
                    if(collision_det) x_pos_nxt = x_pos - 1;
                    else x_pos_nxt = x_pos+1;
                    end
                    UP: begin
                    if((x_pos -10 == 0) || (collision_det) ) state_nxt = DOWN;
                    //else if(collision_det) state_nxt = DOWN ;
                    else state_nxt = state;
                    if(collision_det) x_pos_nxt = x_pos + 1;
                    else x_pos_nxt = x_pos -1;
                    end
                    default: begin
                    end
                    
                    endcase
            end
            
            else begin            
                state_nxt = state;
                x_pos_nxt = x_pos; 
                ball_time_x_nxt = ball_time_x -1;
            end
    
    
    
    
    /*
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
                end*/
   end
   
endmodule