`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Szymon Dziadon / Pawel Majtas
// 
// Create Date: 30.08.2020 19:07:14
// Design Name: 
// Module Name: draw_ball_y
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

module draw_ball_y(
        input wire pclk,
        input wire reset,
        input wire [15:0] collision_det,
        input wire [11:0] mouse_y_pos, mouse_x_pos, x_pos,

        output reg [11:0] y_pos
    );
    
    reg [11:0]  y_pos_nxt=250, y_pos_prev;
    
    reg [1:0] state= 0, state_nxt;
    reg [31:0]  ball_time_y = 800_000, ball_time_y_nxt=800_000;
    localparam DOWN=0, UP=1, STOP=2'b11;

    
    always@(posedge pclk)
    if(reset)
    begin
        y_pos <= #1 250;
        ball_time_y <= #1 0;
        state <= #1 0;
    end
    else
    begin
        y_pos <= #1 y_pos_nxt;
        ball_time_y <= #1 ball_time_y_nxt;
        state <= #1 state_nxt;
    end
    
    always @* begin   
        
        if(ball_time_y  == 0) begin
            ball_time_y_nxt = 800_000;
            
            case(state)
                DOWN: begin
                if((y_pos +10==767) || (collision_det) ||  (( y_pos + 10 >= mouse_y_pos ) && (x_pos >=mouse_x_pos && x_pos <= mouse_x_pos + 200)   ) ) begin state_nxt = UP;
                y_pos_nxt = y_pos -2; end
                else begin state_nxt = state;
				y_pos_nxt = y_pos+1;end
                end
                UP: begin
                if((y_pos -10 == 0) || (collision_det)) begin state_nxt = DOWN;
                y_pos_nxt = y_pos +2; end
                else begin state_nxt = state;
				y_pos_nxt = y_pos -1; end
                end

                default: begin
                y_pos_nxt = y_pos;
                state_nxt = state;
                end
                endcase

        end
        
        else begin

                state_nxt = state;
                y_pos_nxt = y_pos;
            ball_time_y_nxt = ball_time_y -1;
        end          
            
       end
endmodule