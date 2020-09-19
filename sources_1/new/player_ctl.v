`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Szymon Dziadon / Pawel Majtas
// 
// Create Date: 19.08.2020 20:10:37
// Design Name: 
// Module Name: player_ctl
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
    
    reg [11:0] xpos_nxt, ypos_nxt;
    reg [11:0] xpos_hold = 824;
    always@(posedge pclk)
    if(reset)
    begin
        xpos <=#1 0;
        ypos <=#1 0;  
    end
    else
    begin
        xpos <=#1 xpos_nxt;
        ypos <=#1 ypos_nxt;
    end
    
    always@*
    begin
        xpos_nxt = mouse_xpos;       
        ypos_nxt = 748;
        if(xpos_nxt >= xpos_hold)
        begin
            xpos_nxt = xpos_hold;
        end

    end    
endmodule
