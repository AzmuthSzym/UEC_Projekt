`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2020 00:54:06
// Design Name: 
// Module Name: collision_detector
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


module collision_detector(
    input wire [11:0] x_pos, y_pos,
    input wire pclk,
    input wire [15:0] blocks_in,
    
    output reg [15:0] blocks_out=0,
    output reg collision_det
    );
    
    
    `include "blocks_coordinates.v"
    reg collision_det_nxt,x_pos_hold_nxt=0;
    reg [15:0] blocks_nxt=0, blocks=0,blocks_det=0;
    reg [11:0] x_pos_hold=0;
    reg [1:0] kafelek_1, kafelek_4 =3,kafelek_8 = 3;
    
    //assign collision_det = collision_det_nxt;
    
    always@(posedge pclk) begin
    
    collision_det <= #1 collision_det_nxt;
    blocks_out <= #1 blocks_nxt;
    blocks <= #1 blocks_nxt;
    
    
    end
    
       
    
    always@* begin

   //FIRST ROW
               if ((((y_pos >= VER1 && y_pos <= (VER1+B_HEIGHT)) && x_pos + 10 == HOR1) || ((y_pos >= VER1 && y_pos <= (VER1+B_HEIGHT)) && x_pos == HOR1 + B_WIDTH - 10) || ( (x_pos >= HOR1 && x_pos <= (HOR1+B_WIDTH)) && y_pos == VER1 + 10) || ( (x_pos >= HOR1 && x_pos <= (HOR1+B_WIDTH)) && y_pos == VER1 + B_HEIGHT - 10) ) && !(blocks_nxt & 16'b1) ) collision_det_nxt = 1;/*begin blocks_nxt = blocks | 16'b1  ; end*/
               else if ( ((y_pos >= VER1 && y_pos <= (VER1+B_HEIGHT)) && x_pos == HOR2) || ((y_pos >= VER1 && y_pos <= (VER1+B_HEIGHT)) && x_pos == HOR2+ B_WIDTH) || (x_pos >= HOR2 && x_pos <= (HOR2+B_WIDTH) && y_pos == VER1 ) || (x_pos >= HOR2 && x_pos <= (HOR2+B_WIDTH) && y_pos == VER1 + B_HEIGHT) ) collision_det_nxt = 1;
               else if ( ((y_pos >= VER1 && y_pos <= (VER1+B_HEIGHT)) && x_pos == HOR3) || ((y_pos >= VER1 && y_pos <= (VER1+B_HEIGHT)) && x_pos == HOR3+ B_WIDTH) || (x_pos >= HOR3 && x_pos <= (HOR3+B_WIDTH) && y_pos == VER1 ) || (x_pos >= HOR3 && x_pos <= (HOR3+B_WIDTH) && y_pos == VER1 + B_HEIGHT) ) collision_det_nxt = 1;
               else if ( (((y_pos >= VER1 && y_pos <= (VER1+B_HEIGHT)) && x_pos == HOR4) || ((y_pos >= VER1 && y_pos <= (VER1+B_HEIGHT)) && x_pos == HOR4+ B_WIDTH) || (x_pos >= HOR4 && x_pos <= (HOR4+B_WIDTH) && y_pos == VER1 ) || (x_pos >= HOR2 && x_pos <= (HOR2+B_WIDTH) && y_pos == VER1 + B_HEIGHT)) && (kafelek_4) ) begin collision_det_nxt = 1; blocks_nxt = blocks | 16'h8; kafelek_4 = kafelek_4 -1; end
              // else  
                //   collision_det_nxt = 0;  
                               
               //SECOND ROW
               else if (((y_pos >= VER2 && y_pos <= (VER2+B_HEIGHT)) && x_pos == HOR1) || ((y_pos >= VER2 && y_pos <= (VER2+B_HEIGHT)) && x_pos == HOR1 + B_WIDTH) || ( (x_pos >= HOR1 && x_pos <= (HOR1+B_WIDTH)) && y_pos == VER2) || ( (x_pos >= HOR1 && x_pos <= (HOR1+B_WIDTH)) && y_pos == VER2 + B_HEIGHT) ) collision_det_nxt = 1;
               else if (((y_pos >= VER2 && y_pos <= (VER2+B_HEIGHT)) && x_pos == HOR2) || ((y_pos >= VER2 && y_pos <= (VER2+B_HEIGHT)) && x_pos == HOR2 + B_WIDTH) || ( (x_pos >= HOR2 && x_pos <= (HOR2+B_WIDTH)) && y_pos == VER2) || ( (x_pos >= HOR2 && x_pos <= (HOR2+B_WIDTH)) && y_pos == VER2 + B_HEIGHT) ) collision_det_nxt = 1;
               else if (((y_pos >= VER2 && y_pos <= (VER2+B_HEIGHT)) && x_pos == HOR3) || ((y_pos >= VER2 && y_pos <= (VER2+B_HEIGHT)) && x_pos == HOR3 + B_WIDTH) || ( (x_pos >= HOR3 && x_pos <= (HOR3+B_WIDTH)) && y_pos == VER2) || ( (x_pos >= HOR3 && x_pos <= (HOR3+B_WIDTH)) && y_pos == VER2 + B_HEIGHT) ) collision_det_nxt = 1;
               else if ((((y_pos + 10 >= VER2 && y_pos - 10 <= (VER2+B_HEIGHT)) && x_pos == HOR4) || ((y_pos + 10 >= VER2 && y_pos - 10 <= (VER2+B_HEIGHT)) && x_pos == HOR4 + B_WIDTH) || ( (x_pos +10 >= HOR4 && x_pos - 10 <= (HOR4+B_WIDTH)) && y_pos == VER2) || ( (x_pos +10 >= HOR4 && x_pos -10 <= (HOR4+B_WIDTH)) && y_pos == VER2 + B_HEIGHT) ) && (kafelek_8) ) begin collision_det_nxt = 1; blocks_nxt = blocks | 16'h80 ; kafelek_8 = kafelek_8 -1;/*x_pos_hold = 0;*/end
              /* else  
                   collision_det_nxt = 0;    */
                          
               //THIRD ROW
               else if (((y_pos >= VER3 && y_pos <= (VER3+B_HEIGHT)) && x_pos == HOR1) || ((y_pos >= VER3 && y_pos <= (VER3+B_HEIGHT)) && x_pos == HOR1 + B_WIDTH) || ( (x_pos >= HOR1 && x_pos <= (HOR1+B_WIDTH)) && y_pos == VER3) || ( (x_pos >= HOR1 && x_pos <= (HOR1+B_WIDTH)) && y_pos == VER3 + B_HEIGHT) ) collision_det_nxt = 1;
               else if (((y_pos >= VER3 && y_pos <= (VER3+B_HEIGHT)) && x_pos == HOR2) || ((y_pos >= VER3 && y_pos <= (VER3+B_HEIGHT)) && x_pos == HOR2 + B_WIDTH) || ( (x_pos >= HOR2 && x_pos <= (HOR2+B_WIDTH)) && y_pos == VER3) || ( (x_pos >= HOR2 && x_pos <= (HOR2+B_WIDTH)) && y_pos == VER3 + B_HEIGHT) ) collision_det_nxt = 1;
               else if (((y_pos >= VER3 && y_pos <= (VER3+B_HEIGHT)) && x_pos == HOR3) || ((y_pos >= VER3 && y_pos <= (VER3+B_HEIGHT)) && x_pos == HOR3 + B_WIDTH) || ( (x_pos >= HOR3 && x_pos <= (HOR3+B_WIDTH)) && y_pos == VER3) || ( (x_pos >= HOR3 && x_pos <= (HOR3+B_WIDTH)) && y_pos == VER3 + B_HEIGHT) ) collision_det_nxt = 1;
               else if (((y_pos >= VER3 && y_pos <= (VER3+B_HEIGHT)) && x_pos == HOR4) || ((y_pos >= VER3 && y_pos <= (VER3+B_HEIGHT)) && x_pos == HOR4 + B_WIDTH) || ( (x_pos >= HOR4 && x_pos <= (HOR4+B_WIDTH)) && y_pos == VER3) || ( (x_pos >= HOR4 && x_pos <= (HOR4+B_WIDTH)) && y_pos == VER3 + B_HEIGHT) ) collision_det_nxt = 1;
               /*else  
                   collision_det_nxt = 0; */
                    
               //FOURTH ROW
               else if ((((y_pos + 10 >= VER4 && y_pos - 10 <= (VER4+B_HEIGHT)) && x_pos == HOR1) || ((y_pos + 10 >= VER4 && y_pos - 10 <= (VER4+B_HEIGHT)) && x_pos == HOR1 + B_WIDTH) || ( (x_pos + 10 >= HOR1 && x_pos - 10 <= (HOR1+B_WIDTH)) && y_pos == VER4) || ( (x_pos + 10 >= HOR1 && x_pos - 10 <= (HOR1+B_WIDTH)) && y_pos == VER4 + B_HEIGHT)) ) begin collision_det_nxt = 1; blocks_nxt = blocks | 16'h1000 ; x_pos_hold = 2; end
               else if (((y_pos >= VER4 && y_pos <= (VER4+B_HEIGHT)) && x_pos == HOR2) || ((y_pos >= VER4 && y_pos <= (VER4+B_HEIGHT)) && x_pos == HOR2 + B_WIDTH) || ( (x_pos >= HOR2 && x_pos <= (HOR2+B_WIDTH)) && y_pos == VER4) || ( (x_pos >= HOR2 && x_pos <= (HOR2+B_WIDTH)) && y_pos == VER4 + B_HEIGHT) ) collision_det_nxt = 1;
               else if (((y_pos >= VER4 && y_pos <= (VER4+B_HEIGHT)) && x_pos == HOR3) || ((y_pos >= VER4 && y_pos <= (VER4+B_HEIGHT)) && x_pos == HOR3 + B_WIDTH) || ( (x_pos >= HOR3 && x_pos <= (HOR3+B_WIDTH)) && y_pos == VER4) || ( (x_pos >= HOR3 && x_pos <= (HOR3+B_WIDTH)) && y_pos == VER4 + B_HEIGHT) ) collision_det_nxt = 1;
               else if (((y_pos >= VER4 && y_pos <= (VER4+B_HEIGHT)) && x_pos == HOR4) || ((y_pos >= VER4 && y_pos <= (VER4+B_HEIGHT)) && x_pos == HOR4 + B_WIDTH) || ( (x_pos >= HOR4 && x_pos <= (HOR4+B_WIDTH)) && y_pos == VER4) || ( (x_pos >= HOR4&& x_pos <= (HOR4+B_WIDTH)) && y_pos == VER4 + B_HEIGHT) ) collision_det_nxt = 1;
               else  begin
                    /*if( (x_pos_hold )  ) begin
                    collision_det_nxt = 1;
                    x_pos_hold = x_pos_hold -1; end
                    else*/
                    
                    collision_det_nxt = 0;

                blocks_nxt = blocks_in;
                end

    
    end
     
    endmodule
    