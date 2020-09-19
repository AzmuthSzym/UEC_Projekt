`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Szymon Dziadon / Pawel Majtas
// 
// Create Date: 30.08.2020 19:17:18
// Design Name: 
// Module Name: draw_ball_x
// Project Name: Arkanoid
// Target Devices: 
// Tool Versions: 
// Description: Projekt Układy Elektroniki Cyfrowej
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
        input wire [15:0] collision_det,

        output reg [11:0] x_pos
    );
    
    
	reg [31:0] ball_time_x= 800_000, ball_time_x_nxt=800_000;
	reg [11:0] x_pos_nxt=300,x_pos_prev;
	reg state, state_nxt;
	localparam DOWN=2'b00, UP=2'b01, DOWN_CONST = 2'b10, UP_CONST = 2'b11;
    
    always@(posedge pclk) 
    if(reset)
    begin
        ball_time_x <= #1 0;
        x_pos <= #1 300;    
        state <= #1 0;    
    end
    else
    begin
        ball_time_x <= #1 ball_time_x_nxt;
        x_pos <= #1 x_pos_nxt;    
        state <= #1 state_nxt;
       
    end

    always@* begin
    
    if(ball_time_x  ==0) begin
                ball_time_x_nxt = 800_000;
                
                case(state)
                    DOWN: begin
                    if( (x_pos +10==1023) )begin state_nxt = UP;
                    x_pos_nxt = x_pos -2; end
                    else if((collision_det)) begin state_nxt = UP; x_pos_nxt = x_pos -1; end
                    else begin state_nxt = state; x_pos_nxt = x_pos+1; end
                    end
                    
                    UP: begin
                    if((x_pos -10 == 0))begin  state_nxt = DOWN; x_pos_nxt =x_pos +2; end
                    else if(collision_det) begin state_nxt = DOWN; x_pos_nxt = x_pos+1; end
                    else begin state_nxt = state;
                     x_pos_nxt = x_pos -1;
                    end
                    end
                    
                    default: begin
                    x_pos_nxt = x_pos;
                    state_nxt = state;
                    end
                    
                    endcase
            end
            
            else begin            
                state_nxt = state;
                x_pos_nxt = x_pos; 
                ball_time_x_nxt = ball_time_x -1;
            end
    
   end
   
endmodule
