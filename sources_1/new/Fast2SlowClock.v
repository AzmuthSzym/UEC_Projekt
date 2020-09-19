`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Szymon Dziadon / Pawel Majtas 
// 
// Create Date: 18.09.2020 23:59:14
// Design Name: 
// Module Name: Fast2SlowClock
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

module CrossClockBuffer(

    input clk,
    input mclk,
    
    input wire[11:0] data_in,
    output wire [11:0] data_out,
    
    inout wire inout_data_in,
    inout wire inout_data_out
    );
    
    reg [11:0] data_in_hold,inout_data_in_hold;
    
    always@(posedge clk) begin 
    
    data_in_hold <= data_in;
    inout_data_in_hold <= inout_data_in;
    
    end    
    
    assign data_out = data_in_hold;
    assign inout_data_out = inout_data_in_hold;
endmodule
