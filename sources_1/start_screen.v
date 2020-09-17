`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2020 14:08:37
// Design Name: 
// Module Name: draw_backgorund
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


module draw_background
    (
        output reg [10:0] vcount_out,
        output reg vsync_out,
        output reg vblnk_out,
        output reg [10:0] hcount_out,
        output reg hsync_out,
        output reg hblnk_out,
        output reg [11:0] rgb_out,
        
        input wire pclk,
        input wire [10:0] hcount_in,
        input wire hsync_in,
        input wire hblnk_in,
        input wire [10:0] vcount_in,
        input wire vsync_in,
        input wire vblnk_in,
        input wire reset   
    );
    
    reg [11:0] rgb_nxt = 0;
    reg screen_state = 0;
    reg time_to_wait = 0;
    
    always @(posedge pclk)
    if(reset)
    begin
            hsync_out <= 0;
            vsync_out <= 0;
            hcount_out <= 0;
            vcount_out <= 0;
            hblnk_out <= 0;
            vblnk_out <= 0;
            rgb_out <= 0;    
    end
    
    else
    begin
            hsync_out <= hsync_in;
            vsync_out <= vsync_in;
            hcount_out <= hcount_in;
            vcount_out <= vcount_in;
            hblnk_out <= hblnk_in;
            vblnk_out <= vblnk_in;
            rgb_out <= rgb_nxt;
    end
           
    always @*
      begin
        if(screen_state == 0)
        begin
          //TRZY
          if ((vcount_in >= 150 && vcount_in <= 200) && (hcount_in >= 300 && hcount_in <= 400)) rgb_nxt <= 12'h2_2_f;
          else if ((vcount_in >= 200 && vcount_in <= 250) && (hcount_in >= 350 && hcount_in <= 400)) rgb_nxt <= 12'h2_2_f;
          else if ((vcount_in >= 250 && vcount_in <= 300) && (hcount_in >= 320 && hcount_in <= 400)) rgb_nxt <= 12'h2_2_f;
          else if ((vcount_in >= 300 && vcount_in <= 350) && (hcount_in >= 350 && hcount_in <= 400)) rgb_nxt <= 12'h2_2_f;
          else if ((vcount_in >= 350 && vcount_in <= 400) && (hcount_in >= 300 && hcount_in <= 400)) rgb_nxt <= 12'h2_2_f;
          screen_state = 1;
        end
          
        else if(screen_state == 1)
        begin
          time_to_wait = time_to_wait + 1;
          if(time_to_wait == 10000)
            begin
              time_to_wait = 0;
              screen_state = 2;
            end
        end
          
          else if(screen_state == 2)
          begin
            //DWA
            if ((vcount_in >= 150 && vcount_in <= 200) && (hcount_in >= 300 && hcount_in <= 400)) rgb_nxt <= 12'h2_2_f;
            else if ((vcount_in >= 200 && vcount_in <= 250) && (hcount_in >= 350 && hcount_in <= 400)) rgb_nxt <= 12'h2_2_f;
            else if ((vcount_in >= 250 && vcount_in <= 300) && (hcount_in >= 300 && hcount_in <= 400)) rgb_nxt <= 12'h2_2_f;
            else if ((vcount_in >= 300 && vcount_in <= 350) && (hcount_in >= 300 && hcount_in <= 350)) rgb_nxt <= 12'h2_2_f;
            else if ((vcount_in >= 350 && vcount_in <= 400) && (hcount_in >= 300 && hcount_in <= 400)) rgb_nxt <= 12'h2_2_f;
            screen_state = 3;
          end
          
          else if(screen_state == 3)
          begin
            time_to_wait = time_to_wait + 1;
            if(time_to_wait == 10000)
              begin
                time_to_wait = 0;
                screen_state = 4;
              end
          end     
          
          else if(screen_state == 4)
          begin               
            //JEDEN
            if ((vcount_in >= 150 && vcount_in <= 200) && (hcount_in >= 300 && hcount_in <= 400)) rgb_nxt <= 12'h2_2_f;
            else if ((vcount_in >= 200 && vcount_in <= 400) && (hcount_in >= 350 && hcount_in <= 400)) rgb_nxt <= 12'h2_2_f;
          end
          
          else rgb_nxt = 12'h8_8_8;
          
      end
    
endmodule
