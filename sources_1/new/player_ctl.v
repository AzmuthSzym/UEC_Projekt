`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Szymon Dziadon / Pawel Majtas
// 
// Create Date: 19.08.2020 16:08:37
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


module player_ctl(
        input wire [11:0] mouse_xpos,
        input wire [11:0] mouse_ypos,
        input wire mouse_left,
        input wire pclk,
        input wire reset,

        output reg [11:0] xpos,
        output reg [11:0] ypos
    );
    reg fall=0,fall_nxt=0;
    reg [11:0] xpos_nxt, ypos_nxt, xpos_hold;
    reg [16:0] step=100_000, step_nxt, counter=100_000,counter_nxt;

    //total przechowuje licznik, help odmierza krok
    always@(posedge pclk)
    if(reset)
    begin
        xpos <=#1 0;
        ypos <=#1 0;
        fall <= #1 0;
        step <= #1 0;
        counter <= #1 0;    
    end
    else
    begin
        xpos <=#1 xpos_nxt;
        ypos <=#1 ypos_nxt;
        fall <= #1 fall_nxt;
        step <= #1 step_nxt;
        counter <= #1 counter_nxt;

    end
    
    always@*
    begin
        xpos_nxt = mouse_xpos;       
        ypos_nxt = 500;
        /*if(mouse_left) fall_nxt=1;
        else fall_nxt = fall;
         
        if(fall)
            begin
            if(step==0)begin
                ypos_nxt = ypos+1;
                step_nxt = counter;
                counter_nxt = counter- 200;                    
                end
                
            else begin
                ypos_nxt = ypos;
                step_nxt = step-1;
                end
            
            if(ypos_nxt==535)  begin
                fall_nxt=0;
                xpos_hold = mouse_xpos;
                end
                
            else begin    
                fall_nxt=1;
                end
        end
        else
            begin
            if( mouse_xpos !=xpos_hold )
                ypos_nxt = mouse_ypos;
            else
                ypos_nxt = ypos;   
                step_nxt  = 100_000;
                counter_nxt =100_00;
            end    */ 

    end    
endmodule
