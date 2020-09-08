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
    input wire [11:0] hcount_in, vcount_in,
    //input wire [10:0] vcount_in, hcount_in,
    input wire pclk,
    
    output reg collision_det
    );
    
    `include "blocks_coordinates.v"
    reg collision_det_nxt;
    
    always@(posedge pclk) begin
    
    collision_det <= #1 collision_det_nxt;
    end
    
    always@* begin
    
                  
   //FIRST ROW
               if (((vcount_in >= VER1 && vcount_in <= (VER1+B_HEIGHT)) && hcount_in == HOR1) || ((vcount_in >= VER1 && vcount_in <= (VER1+B_HEIGHT)) && hcount_in == HOR1 + B_WIDTH) || ( (hcount_in >= HOR1 && hcount_in <= (HOR1+B_WIDTH)) && vcount_in == VER1) || ( (hcount_in >= HOR1 && hcount_in <= (HOR1+B_WIDTH)) && vcount_in == VER1 + B_HEIGHT) ) collision_det_nxt = 1;
               else if ( ((vcount_in >= VER1 && vcount_in <= (VER1+B_HEIGHT)) && hcount_in == HOR2) || ((vcount_in >= VER1 && vcount_in <= (VER1+B_HEIGHT)) && hcount_in == HOR2+ B_WIDTH) || (hcount_in >= HOR2 && hcount_in <= (HOR2+B_WIDTH) && vcount_in == VER1 ) || (hcount_in >= HOR2 && hcount_in <= (HOR2+B_WIDTH) && vcount_in == VER1 + B_HEIGHT) ) collision_det_nxt = 1;
               else if ( ((vcount_in >= VER1 && vcount_in <= (VER1+B_HEIGHT)) && hcount_in == HOR3) || ((vcount_in >= VER1 && vcount_in <= (VER1+B_HEIGHT)) && hcount_in == HOR3+ B_WIDTH) || (hcount_in >= HOR3 && hcount_in <= (HOR3+B_WIDTH) && vcount_in == VER1 ) || (hcount_in >= HOR3 && hcount_in <= (HOR3+B_WIDTH) && vcount_in == VER1 + B_HEIGHT) ) collision_det_nxt = 1;
               else if ( ((vcount_in >= VER1 && vcount_in <= (VER1+B_HEIGHT)) && hcount_in == HOR4) || ((vcount_in >= VER1 && vcount_in <= (VER1+B_HEIGHT)) && hcount_in == HOR4+ B_WIDTH) || (hcount_in >= HOR4 && hcount_in <= (HOR4+B_WIDTH) && vcount_in == VER1 ) || (hcount_in >= HOR2 && hcount_in <= (HOR2+B_WIDTH) && vcount_in == VER1 + B_HEIGHT) ) collision_det_nxt = 1;
              // else  
                //   collision_det_nxt = 0;  
                               
               //SECOND ROW
               else if (((vcount_in >= VER2 && vcount_in <= (VER2+B_HEIGHT)) && hcount_in == HOR1) || ((vcount_in >= VER2 && vcount_in <= (VER2+B_HEIGHT)) && hcount_in == HOR1 + B_WIDTH) || ( (hcount_in >= HOR1 && hcount_in <= (HOR1+B_WIDTH)) && vcount_in == VER2) || ( (hcount_in >= HOR1 && hcount_in <= (HOR1+B_WIDTH)) && vcount_in == VER2 + B_HEIGHT) ) collision_det_nxt = 1;
               else if (((vcount_in >= VER2 && vcount_in <= (VER2+B_HEIGHT)) && hcount_in == HOR2) || ((vcount_in >= VER2 && vcount_in <= (VER2+B_HEIGHT)) && hcount_in == HOR2 + B_WIDTH) || ( (hcount_in >= HOR2 && hcount_in <= (HOR2+B_WIDTH)) && vcount_in == VER2) || ( (hcount_in >= HOR2 && hcount_in <= (HOR2+B_WIDTH)) && vcount_in == VER2 + B_HEIGHT) ) collision_det_nxt = 1;
               else if (((vcount_in >= VER2 && vcount_in <= (VER2+B_HEIGHT)) && hcount_in == HOR3) || ((vcount_in >= VER2 && vcount_in <= (VER2+B_HEIGHT)) && hcount_in == HOR3 + B_WIDTH) || ( (hcount_in >= HOR3 && hcount_in <= (HOR3+B_WIDTH)) && vcount_in == VER2) || ( (hcount_in >= HOR3 && hcount_in <= (HOR3+B_WIDTH)) && vcount_in == VER2 + B_HEIGHT) ) collision_det_nxt = 1;
               else if (((vcount_in >= VER2 && vcount_in <= (VER2+B_HEIGHT)) && hcount_in == HOR4) || ((vcount_in >= VER2 && vcount_in <= (VER2+B_HEIGHT)) && hcount_in == HOR4 + B_WIDTH) || ( (hcount_in >= HOR4 && hcount_in <= (HOR4+B_WIDTH)) && vcount_in == VER2) || ( (hcount_in >= HOR4 && hcount_in <= (HOR4+B_WIDTH)) && vcount_in == VER2 + B_HEIGHT) ) collision_det_nxt = 1;
              /* else  
                   collision_det_nxt = 0;    */
                          
               //THIRD ROW
               else if (((vcount_in >= VER3 && vcount_in <= (VER3+B_HEIGHT)) && hcount_in == HOR1) || ((vcount_in >= VER3 && vcount_in <= (VER3+B_HEIGHT)) && hcount_in == HOR1 + B_WIDTH) || ( (hcount_in >= HOR1 && hcount_in <= (HOR1+B_WIDTH)) && vcount_in == VER3) || ( (hcount_in >= HOR1 && hcount_in <= (HOR1+B_WIDTH)) && vcount_in == VER3 + B_HEIGHT) ) collision_det_nxt = 1;
               else if (((vcount_in >= VER3 && vcount_in <= (VER3+B_HEIGHT)) && hcount_in == HOR2) || ((vcount_in >= VER3 && vcount_in <= (VER3+B_HEIGHT)) && hcount_in == HOR2 + B_WIDTH) || ( (hcount_in >= HOR2 && hcount_in <= (HOR2+B_WIDTH)) && vcount_in == VER3) || ( (hcount_in >= HOR2 && hcount_in <= (HOR2+B_WIDTH)) && vcount_in == VER3 + B_HEIGHT) ) collision_det_nxt = 1;
               else if (((vcount_in >= VER3 && vcount_in <= (VER3+B_HEIGHT)) && hcount_in == HOR3) || ((vcount_in >= VER3 && vcount_in <= (VER3+B_HEIGHT)) && hcount_in == HOR3 + B_WIDTH) || ( (hcount_in >= HOR3 && hcount_in <= (HOR3+B_WIDTH)) && vcount_in == VER3) || ( (hcount_in >= HOR3 && hcount_in <= (HOR3+B_WIDTH)) && vcount_in == VER3 + B_HEIGHT) ) collision_det_nxt = 1;
               else if (((vcount_in >= VER3 && vcount_in <= (VER3+B_HEIGHT)) && hcount_in == HOR4) || ((vcount_in >= VER3 && vcount_in <= (VER3+B_HEIGHT)) && hcount_in == HOR4 + B_WIDTH) || ( (hcount_in >= HOR4 && hcount_in <= (HOR4+B_WIDTH)) && vcount_in == VER3) || ( (hcount_in >= HOR4 && hcount_in <= (HOR4+B_WIDTH)) && vcount_in == VER3 + B_HEIGHT) ) collision_det_nxt = 1;
               /*else  
                   collision_det_nxt = 0; */
                    
               //FOURTH ROW
               else if (((vcount_in >= VER4 && vcount_in <= (VER4+B_HEIGHT)) && hcount_in == HOR1) || ((vcount_in >= VER4 && vcount_in <= (VER4+B_HEIGHT)) && hcount_in == HOR1 + B_WIDTH) || ( (hcount_in >= HOR1 && hcount_in <= (HOR1+B_WIDTH)) && vcount_in == VER4) || ( (hcount_in >= HOR1 && hcount_in <= (HOR1+B_WIDTH)) && vcount_in == VER4 + B_HEIGHT) ) collision_det_nxt = 1;
               else if (((vcount_in >= VER4 && vcount_in <= (VER4+B_HEIGHT)) && hcount_in == HOR2) || ((vcount_in >= VER4 && vcount_in <= (VER4+B_HEIGHT)) && hcount_in == HOR2 + B_WIDTH) || ( (hcount_in >= HOR2 && hcount_in <= (HOR2+B_WIDTH)) && vcount_in == VER4) || ( (hcount_in >= HOR2 && hcount_in <= (HOR2+B_WIDTH)) && vcount_in == VER4 + B_HEIGHT) ) collision_det_nxt = 1;
               else if (((vcount_in >= VER4 && vcount_in <= (VER4+B_HEIGHT)) && hcount_in == HOR3) || ((vcount_in >= VER4 && vcount_in <= (VER4+B_HEIGHT)) && hcount_in == HOR3 + B_WIDTH) || ( (hcount_in >= HOR3 && hcount_in <= (HOR3+B_WIDTH)) && vcount_in == VER4) || ( (hcount_in >= HOR3 && hcount_in <= (HOR3+B_WIDTH)) && vcount_in == VER4 + B_HEIGHT) ) collision_det_nxt = 1;
               else if (((vcount_in >= VER4 && vcount_in <= (VER4+B_HEIGHT)) && hcount_in == HOR4) || ((vcount_in >= VER4 && vcount_in <= (VER4+B_HEIGHT)) && hcount_in == HOR4 + B_WIDTH) || ( (hcount_in >= HOR4 && hcount_in <= (HOR4+B_WIDTH)) && vcount_in == VER4) || ( (hcount_in >= HOR4&& hcount_in <= (HOR4+B_WIDTH)) && vcount_in == VER4 + B_HEIGHT) ) collision_det_nxt = 1;
               else  
                collision_det_nxt = 0; 
    
    end
     
    endmodule
