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
    
    
    output reg [15:0] blocks_out/*=0*/,
    output reg [15:0] collision_det
    //output wire [15:0] tiles
    );
    
    `include "blocks_coordinates.v"
    
   // wire [15:0] tiles=0;
    reg collision_det_nxt;
    reg [15:0] blocks_nxt=0, blocks=0,blocks_det=0;
    reg [1:0] tile_1=2,tile_2=1,tile_3=2, tile_4 =2,
              tile_5=2,tile_6=2, tile_7=2, tile_8 = 2,
              tile_9=2, tile_10=2, tile_11=2,tile_12=2,
              tile_13=2, tile_14=2,tile_15=2,tile_16=2;
              
    reg [1:0] tile_1_nxt=2, tile_2_nxt=2,tile_3_nxt=2, tile_4_nxt=1, tile_5_nxt=2,
                tile_6_nxt=2, tile_7_nxt=2, tile_8_nxt=2, tile_9_nxt=2, tile_10_nxt=2, 
                tile_11_nxt=2,tile_12_nxt=2, tile_13_nxt=2, tile_14_nxt=2, tile_15_nxt=2, tile_16_nxt=2;
    
    //assign tiles = blocks_nxt;
   // assign blocks_out = blocks_nxt;

    
    //reg [11:0] x_pos_hold;
   // wire [1:0] tile_4w;
    //assign tile_4w= tile_4_nxt;
    always@(posedge pclk) begin
    
    collision_det <= #1 collision_det_nxt; //{coll_1, coll_2, coll_3, coll_4, coll_5, coll_6, coll_7, coll_8, coll_9, coll_10, coll_11, coll_12, coll_13, coll_14, coll_15, coll_16}; //collision_det_nxt;
    blocks_out <= #1 blocks_nxt; //{block16, block15, block14, block13, block12, block11, block10, block9, block8, block7, block6, block5, block4, block3, block2, block1}; /*blocks_nxt;*/
    blocks <= #1 blocks_nxt;
    
    //tile_1 <= tile_1_nxt;
    //tile_2 <= tile_2_nxt;
    //tile_3 <= tile_3_nxt;
    //tile_4 <= tile_4_nxt;
    
   //tile_8 <= tile_8_nxt;
    
    
    end
    
       //assign collision_det =  {coll_1, coll_2, coll_3, coll_4, coll_5, coll_6, coll_7, coll_8, coll_9, coll_10, coll_11, coll_12, coll_13, coll_14, coll_15, coll_16}; //collision_det_nxt;
       //assign blocks_out =  {block16, block15, block14, block13, block12, block11, block10, block9, block8, block7, block6, block5, block4, block3, block2, block1}; /*blocks_nxt;*/

    
    always@* begin

/*blocks_nxt = {block16, block15, block14, block13, block12, block11, block10, block9, block8, block7, block6, block5, block4, block3, block2, block1};
    collision_det_nxt = {coll_1, coll_2, coll_3, coll_4, coll_5, coll_6, coll_7, coll_8, coll_9, coll_10, coll_11, coll_12, coll_13, coll_14, coll_15, coll_16};*/ //collision_det_nxt


   //FIRST ROW
               if ((((y_pos >= VER1 && y_pos <= (VER1+B_HEIGHT)) && x_pos + 10 == HOR1) || ((y_pos >= VER1 && y_pos <= (VER1+B_HEIGHT)) && x_pos == HOR1 + B_WIDTH - 10) || ( (x_pos >= HOR1 && x_pos <= (HOR1+B_WIDTH)) && y_pos == VER1 + 10) || ( (x_pos >= HOR1 && x_pos <= (HOR1+B_WIDTH)) && y_pos == VER1 + B_HEIGHT - 10) ) && (tile_1) )                              
               begin collision_det_nxt = 1;  blocks_nxt = blocks | 16'b1; /*
               tile_1_nxt = tile_1 -1; tile_2_nxt=tile_2; tile_3_nxt=tile_3; tile_4_nxt=tile_4; 
               tile_5_nxt=tile_5; tile_6_nxt=tile_6; tile_7_nxt=tile_7; tile_8_nxt=tile_8; 
               tile_9_nxt=tile_9; tile_10_nxt=tile_10; tile_11_nxt=tile_11; tile_12_nxt=tile_12;  
               tile_13_nxt=tile_13; tile_14_nxt=tile_14; tile_15_nxt=tile_15; tile_16_nxt=tile_16; */
               tile_1 = tile_1 -1; tile_2=tile_2; tile_3=tile_3; tile_4=tile_4; 
               tile_5=tile_5; tile_6=tile_6; tile_7=tile_7; tile_8=tile_8; 
               tile_9=tile_9; tile_10=tile_10; tile_11=tile_11; tile_12=tile_12;  
               tile_13=tile_13; tile_14=tile_14; tile_15=tile_15; tile_16=tile_16;   end
               
               else if ( (((y_pos >= VER1 && y_pos <= (VER1+B_HEIGHT)) && x_pos == HOR2) || ((y_pos >= VER1 && y_pos <= (VER1+B_HEIGHT)) && x_pos == HOR2+ B_WIDTH) || (x_pos >= HOR2 && x_pos <= (HOR2+B_WIDTH) && y_pos == VER1 ) || (x_pos >= HOR2 && x_pos <= (HOR2+B_WIDTH) && y_pos == VER1 + B_HEIGHT)) && (tile_2) ) 
               begin collision_det_nxt = 1;  blocks_nxt = blocks | 16'h2;/*
               tile_2_nxt = tile_2 -1;tile_1_nxt=tile_1; tile_3_nxt = tile_3;  tile_4_nxt=tile_4; 
               tile_5_nxt=tile_5; tile_6_nxt=tile_6; tile_7_nxt=tile_7; tile_8_nxt=tile_8; 
               tile_9_nxt=tile_9; tile_10_nxt=tile_10; tile_11_nxt=tile_11; tile_12_nxt=tile_12;
               tile_13_nxt=tile_13; tile_14_nxt=tile_14; tile_15_nxt=tile_15; tile_16_nxt=tile_16;*/
               tile_1 = tile_1; tile_2=tile_2-1; tile_3=tile_3; tile_4=tile_4; 
               tile_5=tile_5; tile_6=tile_6; tile_7=tile_7; tile_8=tile_8; 
               tile_9=tile_9; tile_10=tile_10; tile_11=tile_11; tile_12=tile_12;  
               tile_13=tile_13; tile_14=tile_14; tile_15=tile_15; tile_16=tile_16; end
               
               else if ( (((y_pos >= VER1 && y_pos <= (VER1+B_HEIGHT)) && x_pos == HOR3) || ((y_pos >= VER1 && y_pos <= (VER1+B_HEIGHT)) && x_pos == HOR3+ B_WIDTH) || (x_pos >= HOR3 && x_pos <= (HOR3+B_WIDTH) && y_pos == VER1 ) || (x_pos >= HOR3 && x_pos <= (HOR3+B_WIDTH) && y_pos == VER1 + B_HEIGHT)) && (tile_3)) 
               begin collision_det_nxt = 1;  blocks_nxt = blocks | 16'h4;  /*
               tile_3_nxt = tile_3 -1; tile_1_nxt=tile_1; tile_2_nxt=tile_2; tile_4_nxt=tile_4; 
               tile_5_nxt=tile_5;tile_6_nxt=tile_6; tile_7_nxt=tile_7; tile_8_nxt=tile_8; 
               tile_9_nxt=tile_9; tile_10_nxt=tile_10; tile_11_nxt=tile_11; tile_12_nxt=tile_12;  
               tile_13_nxt=tile_13; tile_14_nxt=tile_14; tile_15_nxt=tile_15; tile_16_nxt=tile_16;*/
               tile_1 = tile_1; tile_2=tile_2; tile_3=tile_3-1; tile_4=tile_4; 
               tile_5=tile_5; tile_6=tile_6; tile_7=tile_7; tile_8=tile_8; 
               tile_9=tile_9; tile_10=tile_10; tile_11=tile_11; tile_12=tile_12;  
               tile_13=tile_13; tile_14=tile_14; tile_15=tile_15; tile_16=tile_16; end
               
               else if ( (((y_pos >= VER1 && y_pos <= (VER1+B_HEIGHT)) && x_pos == HOR4) || ((y_pos >= VER1 && y_pos <= (VER1+B_HEIGHT)) && x_pos == HOR4+ B_WIDTH) || (x_pos >= HOR4 && x_pos <= (HOR4+B_WIDTH) && y_pos == VER1 ) || (x_pos >= HOR4 && x_pos <= (HOR4+B_WIDTH) && y_pos == VER1 + B_HEIGHT)) && (tile_4) ) 
               begin collision_det_nxt = 1; blocks_nxt = blocks | 16'h8; /*
               tile_4_nxt = tile_4 -1; tile_1_nxt=tile_1; tile_2_nxt=tile_2; tile_3_nxt=tile_3; 
               tile_5_nxt=tile_5;tile_6_nxt=tile_6; tile_7_nxt=tile_7; tile_8_nxt=tile_8; 
               tile_9_nxt=tile_9; tile_10_nxt=tile_10; tile_11_nxt=tile_11; tile_12_nxt=tile_12;  
               tile_13_nxt=tile_13; tile_14_nxt=tile_14; tile_15_nxt=tile_15; tile_16_nxt=tile_16;*/
               tile_1 = tile_1; tile_2=tile_2; tile_3=tile_3; tile_4=tile_4-1; 
               tile_5=tile_5; tile_6=tile_6; tile_7=tile_7; tile_8=tile_8; 
               tile_9=tile_9; tile_10=tile_10; tile_11=tile_11; tile_12=tile_12;  
               tile_13=tile_13; tile_14=tile_14; tile_15=tile_15; tile_16=tile_16; end
              // else  
                //   collision_det_nxt = 0;  
                               
               //SECOND ROW
               else if ((((y_pos >= VER2 && y_pos <= (VER2+B_HEIGHT)) && x_pos == HOR1) || ((y_pos >= VER2 && y_pos <= (VER2+B_HEIGHT)) && x_pos == HOR1 + B_WIDTH) || ( (x_pos >= HOR1 && x_pos <= (HOR1+B_WIDTH)) && y_pos == VER2) || ( (x_pos >= HOR1 && x_pos <= (HOR1+B_WIDTH)) && y_pos == VER2 + B_HEIGHT)) && (tile_5) ) 
               begin collision_det_nxt = 1;  blocks_nxt = blocks | 16'h10; /*
               tile_5_nxt = tile_5 -1; tile_1_nxt=tile_1; tile_2_nxt=tile_2; tile_3_nxt=tile_3; 
               tile_4_nxt=tile_4; tile_6_nxt=tile_6; tile_7_nxt=tile_7; tile_8_nxt=tile_8; 
               tile_9_nxt=tile_9; tile_10_nxt=tile_10;tile_11_nxt=tile_11; tile_12_nxt=tile_12;  
               tile_13_nxt=tile_13; tile_14_nxt=tile_14; tile_15_nxt=tile_15; tile_16_nxt=tile_16;*/
               tile_1 = tile_1; tile_2=tile_2; tile_3=tile_3; tile_4=tile_4; 
               tile_5=tile_5-1; tile_6=tile_6; tile_7=tile_7; tile_8=tile_8; 
               tile_9=tile_9; tile_10=tile_10; tile_11=tile_11; tile_12=tile_12;  
               tile_13=tile_13; tile_14=tile_14; tile_15=tile_15; tile_16=tile_16; end
               
               else if ((((y_pos >= VER2 && y_pos <= (VER2+B_HEIGHT)) && x_pos == HOR2) || ((y_pos >= VER2 && y_pos <= (VER2+B_HEIGHT)) && x_pos == HOR2 + B_WIDTH) || ( (x_pos >= HOR2 && x_pos <= (HOR2+B_WIDTH)) && y_pos == VER2) || ( (x_pos >= HOR2 && x_pos <= (HOR2+B_WIDTH)) && y_pos == VER2 + B_HEIGHT)) && (tile_6) ) 
               begin collision_det_nxt = 1; blocks_nxt = blocks | 16'h20;/*
               tile_6_nxt = tile_6 -1; tile_1_nxt=tile_1; tile_2_nxt=tile_2; tile_3_nxt=tile_3;
                tile_4_nxt=tile_4; tile_5_nxt=tile_5;tile_7_nxt=tile_7; tile_8_nxt=tile_8; 
                tile_9_nxt=tile_9; tile_10_nxt=tile_10;  tile_11_nxt=tile_11; tile_12_nxt=tile_12;  
                tile_13_nxt=tile_13; tile_14_nxt=tile_14; tile_15_nxt=tile_15; tile_16_nxt=tile_16;*/ 
                tile_1 = tile_1; tile_2=tile_2; tile_3=tile_3; tile_4=tile_4; 
                tile_5=tile_5; tile_6=tile_6-1; tile_7=tile_7; tile_8=tile_8; 
                tile_9=tile_9; tile_10=tile_10; tile_11=tile_11; tile_12=tile_12;  
                tile_13=tile_13; tile_14=tile_14; tile_15=tile_15; tile_16=tile_16; end
                
               else if ((((y_pos >= VER2 && y_pos <= (VER2+B_HEIGHT)) && x_pos == HOR3) || ((y_pos >= VER2 && y_pos <= (VER2+B_HEIGHT)) && x_pos == HOR3 + B_WIDTH) || ( (x_pos >= HOR3 && x_pos <= (HOR3+B_WIDTH)) && y_pos == VER2) || ( (x_pos >= HOR3 && x_pos <= (HOR3+B_WIDTH)) && y_pos == VER2 + B_HEIGHT)) && (tile_7) ) 
               begin collision_det_nxt = 1 ;blocks_nxt = blocks | 16'h40; /*
               tile_7_nxt = tile_7 -1; tile_1_nxt=tile_1; tile_2_nxt=tile_2; tile_3_nxt=tile_3; 
               tile_4_nxt=tile_4; tile_5_nxt=tile_5; tile_6_nxt=tile_6; tile_8_nxt=tile_8; 
               tile_9_nxt=tile_9; tile_10_nxt=tile_10; tile_11_nxt=tile_11; tile_12_nxt=tile_12;  
               tile_13_nxt=tile_13; tile_14_nxt=tile_14; tile_15_nxt=tile_15; tile_16_nxt=tile_16;*/
               tile_1 = tile_1; tile_2=tile_2; tile_3=tile_3; tile_4=tile_4; 
               tile_5=tile_5; tile_6=tile_6; tile_7=tile_7-1; tile_8=tile_8; 
               tile_9=tile_9; tile_10=tile_10; tile_11=tile_11; tile_12=tile_12;  
               tile_13=tile_13; tile_14=tile_14; tile_15=tile_15; tile_16=tile_16; end
               
               else if ((((y_pos + 10 >= VER2 && y_pos - 10 <= (VER2+B_HEIGHT)) && x_pos == HOR4) || ((y_pos + 10 >= VER2 && y_pos - 10 <= (VER2+B_HEIGHT)) && x_pos == HOR4 + B_WIDTH) || ( (x_pos +10 >= HOR4 && x_pos - 10 <= (HOR4+B_WIDTH)) && y_pos == VER2) || ( (x_pos +10 >= HOR4 && x_pos -10 <= (HOR4+B_WIDTH)) && y_pos == VER2 + B_HEIGHT) ) && (tile_8) ) 
               begin collision_det_nxt = 1;   blocks_nxt = blocks | 16'h80 ; /*
               tile_8 = tile_8 -1; tile_1_nxt=tile_1; tile_2_nxt=tile_2; tile_3_nxt=tile_3; 
               tile_4_nxt=tile_4; tile_5_nxt=tile_5; tile_6_nxt=tile_6; tile_7_nxt=tile_7;
               tile_9_nxt=tile_9; tile_10_nxt=tile_10;tile_11_nxt=tile_11; tile_12_nxt=tile_12;  
               tile_13_nxt=tile_13; tile_14_nxt=tile_14; tile_15_nxt=tile_15; tile_16_nxt=tile_16;*/
               tile_1 = tile_1; tile_2=tile_2; tile_3=tile_3; tile_4=tile_4; 
               tile_5=tile_5; tile_6=tile_6; tile_7=tile_7; tile_8=tile_8-1; 
               tile_9=tile_9; tile_10=tile_10; tile_11=tile_11; tile_12=tile_12;  
               tile_13=tile_13; tile_14=tile_14; tile_15=tile_15; tile_16=tile_16;end
              //else  
                   //collision_det_nxt = 0;    
                         
               //THIRD ROW
               else if ((((y_pos >= VER3 && y_pos <= (VER3+B_HEIGHT)) && x_pos == HOR1) || ((y_pos >= VER3 && y_pos <= (VER3+B_HEIGHT)) && x_pos == HOR1 + B_WIDTH) || ( (x_pos >= HOR1 && x_pos <= (HOR1+B_WIDTH)) && y_pos == VER3) || ( (x_pos >= HOR1 && x_pos <= (HOR1+B_WIDTH)) && y_pos == VER3 + B_HEIGHT)) && (tile_9) ) 
               begin collision_det_nxt = 1;  blocks_nxt = blocks | 16'h100; /*
               tile_9_nxt = tile_9-1; tile_1_nxt=tile_1; tile_2_nxt=tile_2; tile_3_nxt=tile_3; 
               tile_4_nxt=tile_4; tile_5_nxt=tile_5; tile_6_nxt=tile_6; tile_7_nxt=tile_7; 
               tile_8_nxt=tile_8; tile_10_nxt=tile_10; tile_11_nxt=tile_11; tile_12_nxt=tile_12;  
               tile_13_nxt=tile_13; tile_14_nxt=tile_14; tile_15_nxt=tile_15; tile_16_nxt=tile_16;*/
               tile_1 = tile_1; tile_2=tile_2; tile_3=tile_3; tile_4=tile_4; 
               tile_5=tile_5; tile_6=tile_6; tile_7=tile_7; tile_8=tile_8; 
               tile_9=tile_9-1; tile_10=tile_10; tile_11=tile_11; tile_12=tile_12;  
               tile_13=tile_13; tile_14=tile_14; tile_15=tile_15; tile_16=tile_16; end
               
               else if ((((y_pos >= VER3 && y_pos <= (VER3+B_HEIGHT)) && x_pos == HOR2) || ((y_pos >= VER3 && y_pos <= (VER3+B_HEIGHT)) && x_pos == HOR2 + B_WIDTH) || ( (x_pos >= HOR2 && x_pos <= (HOR2+B_WIDTH)) && y_pos == VER3) || ( (x_pos >= HOR2 && x_pos <= (HOR2+B_WIDTH)) && y_pos == VER3 + B_HEIGHT)) && (tile_10) )
               begin collision_det_nxt = 1;   blocks_nxt = blocks | 16'h200; /*
               tile_10_nxt = tile_10 -1; tile_1_nxt=tile_1; tile_2_nxt=tile_2; tile_3_nxt=tile_3; 
               tile_4_nxt=tile_4; tile_5_nxt=tile_5; tile_6_nxt=tile_6; tile_7_nxt=tile_7; 
               tile_8_nxt=tile_8; tile_9_nxt=tile_9; tile_11_nxt=tile_11; tile_12_nxt=tile_12;  
               tile_13_nxt=tile_13; tile_14_nxt=tile_14; tile_15_nxt=tile_15; tile_16_nxt=tile_16;*/
               tile_1 = tile_1; tile_2=tile_2; tile_3=tile_3; tile_4=tile_4; 
               tile_5=tile_5; tile_6=tile_6; tile_7=tile_7; tile_8=tile_8; 
               tile_9=tile_9; tile_10=tile_10-1; tile_11=tile_11; tile_12=tile_12;  
               tile_13=tile_13; tile_14=tile_14; tile_15=tile_15; tile_16=tile_16;end
               
               else if ((((y_pos >= VER3 && y_pos <= (VER3+B_HEIGHT)) && x_pos == HOR3) || ((y_pos >= VER3 && y_pos <= (VER3+B_HEIGHT)) && x_pos == HOR3 + B_WIDTH) || ( (x_pos >= HOR3 && x_pos <= (HOR3+B_WIDTH)) && y_pos == VER3) || ( (x_pos >= HOR3 && x_pos <= (HOR3+B_WIDTH)) && y_pos == VER3 + B_HEIGHT)) && (tile_11) )
               begin collision_det_nxt = 1;  blocks_nxt = blocks | 16'h400; /*
               tile_11_nxt = tile_11 -1; tile_1_nxt=tile_1; tile_2_nxt=tile_2; tile_3_nxt=tile_3; 
               tile_4_nxt=tile_4; tile_5_nxt=tile_5;tile_6_nxt=tile_6; tile_7_nxt=tile_7; 
               tile_8_nxt=tile_8; tile_9_nxt=tile_9; tile_10_nxt=tile_10;tile_12_nxt=tile_12;  tile_13_nxt=tile_13; 
               tile_14_nxt=tile_14; tile_15_nxt=tile_15; tile_16_nxt=tile_16; */
               tile_1 = tile_1; tile_2=tile_2; tile_3=tile_3; tile_4=tile_4; 
               tile_5=tile_5; tile_6=tile_6; tile_7=tile_7; tile_8=tile_8; 
               tile_9=tile_9; tile_10=tile_10; tile_11=tile_11-1; tile_12=tile_12;  
               tile_13=tile_13; tile_14=tile_14; tile_15=tile_15; tile_16=tile_16;end
               
               else if ((((y_pos >= VER3 && y_pos <= (VER3+B_HEIGHT)) && x_pos == HOR4) || ((y_pos >= VER3 && y_pos <= (VER3+B_HEIGHT)) && x_pos == HOR4 + B_WIDTH) || ( (x_pos >= HOR4 && x_pos <= (HOR4+B_WIDTH)) && y_pos == VER3) || ( (x_pos >= HOR4 && x_pos <= (HOR4+B_WIDTH)) && y_pos == VER3 + B_HEIGHT)) && (tile_12) )
               begin collision_det_nxt = 1;  blocks_nxt = blocks | 16'h800; /*
               tile_12_nxt = tile_12 -1; tile_1_nxt=tile_1; tile_2_nxt=tile_2; tile_3_nxt=tile_3; 
               tile_4_nxt=tile_4; tile_5_nxt=tile_5;tile_6_nxt=tile_6; tile_7_nxt=tile_7; 
               tile_8_nxt=tile_8; tile_9_nxt=tile_9; tile_10_nxt=tile_10;tile_11_nxt=tile_11;  
               tile_13_nxt=tile_13; tile_14_nxt=tile_14; tile_15_nxt=tile_15; tile_16_nxt=tile_16;*/
               tile_1 = tile_1; tile_2=tile_2; tile_3=tile_3; tile_4=tile_4; 
               tile_5=tile_5; tile_6=tile_6; tile_7=tile_7; tile_8=tile_8; 
               tile_9=tile_9; tile_10=tile_10; tile_11=tile_11; tile_12=tile_12-1;  
               tile_13=tile_13; tile_14=tile_14; tile_15=tile_15; tile_16=tile_16; end
               //else  
                   //collision_det_nxt = 0; 
                    
               //FOURTH ROW
               else if ((((y_pos + 10 >= VER4 && y_pos - 10 <= (VER4+B_HEIGHT)) && x_pos == HOR1) || ((y_pos + 10 >= VER4 && y_pos - 10 <= (VER4+B_HEIGHT)) && x_pos == HOR1 + B_WIDTH) || ( (x_pos + 10 >= HOR1 && x_pos - 10 <= (HOR1+B_WIDTH)) && y_pos == VER4) || ( (x_pos + 10 >= HOR1 && x_pos - 10 <= (HOR1+B_WIDTH)) && y_pos == VER4 + B_HEIGHT)) && (tile_13) ) 
               begin collision_det_nxt = 1; blocks_nxt = blocks | 16'h1000 ; /*
               tile_13_nxt = tile_13 -1; tile_1_nxt=tile_1; tile_2_nxt=tile_2; tile_3_nxt=tile_3; 
               tile_4_nxt=tile_4; tile_5_nxt=tile_5; tile_6_nxt=tile_6; tile_7_nxt=tile_7; 
               tile_8_nxt=tile_8; tile_9_nxt=tile_9; tile_10_nxt=tile_10;tile_11_nxt=tile_11; 
               tile_12_nxt=tile_12; tile_14_nxt=tile_14; tile_15_nxt=tile_15; tile_16_nxt=tile_16;*/
               tile_1 = tile_1; tile_2=tile_2; tile_3=tile_3; tile_4=tile_4; 
               tile_5=tile_5; tile_6=tile_6; tile_7=tile_7; tile_8=tile_8; 
               tile_9=tile_9; tile_10=tile_10; tile_11=tile_11; tile_12=tile_12;  
               tile_13=tile_13-1; tile_14=tile_14; tile_15=tile_15; tile_16=tile_16; end
               
               else if ((((y_pos >= VER4 && y_pos <= (VER4+B_HEIGHT)) && x_pos == HOR2) || ((y_pos >= VER4 && y_pos <= (VER4+B_HEIGHT)) && x_pos == HOR2 + B_WIDTH) || ( (x_pos >= HOR2 && x_pos <= (HOR2+B_WIDTH)) && y_pos == VER4) || ( (x_pos >= HOR2 && x_pos <= (HOR2+B_WIDTH)) && y_pos == VER4 + B_HEIGHT)) &&(tile_14) ) 
               begin collision_det_nxt = 1;  blocks_nxt = blocks | 16'h2000; /*
               tile_14_nxt = tile_14 -1; tile_1_nxt=tile_1; tile_2_nxt=tile_2; tile_3_nxt=tile_3;
                tile_4_nxt=tile_4; tile_5_nxt=tile_5;tile_6_nxt=tile_6; tile_7_nxt=tile_7; 
                tile_8_nxt=tile_8; tile_9_nxt=tile_9; tile_10_nxt=tile_10; tile_11_nxt=tile_11; 
                tile_12_nxt=tile_12;  tile_13_nxt=tile_13; tile_15_nxt=tile_15; tile_16_nxt=tile_16;*/
                tile_1 = tile_1; tile_2=tile_2; tile_3=tile_3; tile_4=tile_4; 
                tile_5=tile_5; tile_6=tile_6; tile_7=tile_7; tile_8=tile_8; 
                tile_9=tile_9; tile_10=tile_10; tile_11=tile_11; tile_12=tile_12;  
                tile_13=tile_13; tile_14=tile_14-1; tile_15=tile_15; tile_16=tile_16; end
                
               else if ((((y_pos >= VER4 && y_pos <= (VER4+B_HEIGHT)) && x_pos == HOR3) || ((y_pos >= VER4 && y_pos <= (VER4+B_HEIGHT)) && x_pos == HOR3 + B_WIDTH) || ( (x_pos >= HOR3 && x_pos <= (HOR3+B_WIDTH)) && y_pos == VER4) || ( (x_pos >= HOR3 && x_pos <= (HOR3+B_WIDTH)) && y_pos == VER4 + B_HEIGHT)) &&(tile_15) ) 
               begin collision_det_nxt = 1;  blocks_nxt = blocks | 16'h4000; /*
               tile_15_nxt = tile_15 -1; tile_1_nxt=tile_1; tile_2_nxt=tile_2; tile_3_nxt=tile_3; 
               tile_4_nxt=tile_4; tile_5_nxt=tile_5; tile_6_nxt=tile_6; tile_7_nxt=tile_7; 
               tile_8_nxt=tile_8; tile_9_nxt=tile_9; tile_10_nxt=tile_10; tile_11_nxt=tile_11; tile_12_nxt=tile_12;  
               tile_13_nxt=tile_13; tile_14_nxt=tile_14; tile_16_nxt=tile_16; */
               tile_1 = tile_1; tile_2=tile_2; tile_3=tile_3; tile_4=tile_4; 
               tile_5=tile_5; tile_6=tile_6; tile_7=tile_7; tile_8=tile_8-1; 
               tile_9=tile_9; tile_10=tile_10; tile_11=tile_11; tile_12=tile_12;  
               tile_13=tile_13; tile_14=tile_14; tile_15=tile_15-1; tile_16=tile_16;end
               
               else if ((((y_pos >= VER4 && y_pos <= (VER4+B_HEIGHT)) && x_pos == HOR4) || ((y_pos >= VER4 && y_pos <= (VER4+B_HEIGHT)) && x_pos == HOR4 + B_WIDTH) || ( (x_pos >= HOR4 && x_pos <= (HOR4+B_WIDTH)) && y_pos == VER4) || ( (x_pos >= HOR4 && x_pos <= (HOR4+B_WIDTH)) && y_pos == VER4 + B_HEIGHT)) &&(tile_16) ) 
               begin collision_det_nxt = 1;   blocks_nxt = blocks | 16'h8000; /*
               tile_16_nxt = tile_16 -1; tile_1_nxt=tile_1; tile_2_nxt=tile_2; tile_3_nxt=tile_3; 
               tile_4_nxt=tile_4; tile_5_nxt=tile_5;tile_6_nxt=tile_6; tile_7_nxt=tile_7; 
               tile_8_nxt=tile_8; tile_9_nxt=tile_9; tile_10_nxt=tile_10; tile_11_nxt=tile_11;
               tile_12_nxt=tile_12;  tile_13_nxt=tile_13; tile_14_nxt=tile_14; tile_15_nxt=tile_15; */
               tile_1 = tile_1; tile_2=tile_2; tile_3=tile_3; tile_4=tile_4; 
               tile_5=tile_5; tile_6=tile_6; tile_7=tile_7; tile_8=tile_8; 
               tile_9=tile_9; tile_10=tile_10; tile_11=tile_11; tile_12=tile_12;  
               tile_13=tile_13; tile_14=tile_14; tile_15=tile_15; tile_16=tile_16-1;end
               
               else if( y_pos + 10 == 766)  begin blocks_nxt =0; collision_det_nxt =0; tile_1=2; tile_2=2; tile_3=2; tile_4=2; tile_5=2;
                               tile_6=2; tile_7=2; tile_8=2; tile_9=2; tile_10=2; 
                               tile_11=2; tile_12=2;  tile_13=2; tile_14=2; tile_15=2; tile_16=2; end
               else  begin 
                    /*if( (x_pos_hold )  ) begin
                    collision_det_nxt = 1;
                    x_pos_hold = x_pos_hold -1; end
                    else*/
                    
                   tile_1 = tile_1; tile_2=tile_2; tile_3=tile_3; tile_4=tile_4; 
                   tile_5=tile_5; tile_6=tile_6; tile_7=tile_7; tile_8=tile_8; 
                   tile_9=tile_9; tile_10=tile_10; tile_11=tile_11; tile_12=tile_12;  
                   tile_13=tile_13; tile_14=tile_14; tile_15=tile_15; tile_16=tile_16;
                    
                    collision_det_nxt = 0;

                blocks_nxt = blocks;
                end

               // if(y_pos + 10 == 766) blocks_nxt = 0;
                

    
    end
     
    endmodule
        