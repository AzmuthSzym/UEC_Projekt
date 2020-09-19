`timescale 1 ns / 1 ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Szymon Dziadon / Pawel Majtas
// 
// Create Date: 17.08.2020 14:08:37
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

module arcanoid_timing (
  output wire [10:0] vcount,
  output wire vsync,
  output wire vblnk,
  
  output wire [10:0] hcount,
  output wire hsync,
  output wire hblnk,
  
  input wire pclk,
  input wire reset
  );

  
reg [10:0] vcount_nxt=0, vcount_in=0;
reg [10:0] hcount_nxt=0, hcount_in=0;
reg hblnk_nxt=0, hblnk_in=0, vblnk_nxt=0, vblnk_in=0, vsync_nxt=0, vsync_in=0, hsync_nxt=0, hsync_in=0;


assign hblnk = hblnk_nxt;
assign vblnk = vblnk_nxt;

assign vsync = vsync_nxt;
assign hsync = hsync_nxt;

assign vcount = vcount_nxt;
assign hcount = hcount_nxt;

  
always@(posedge pclk)
begin
   if(reset)
   begin
    vcount_nxt <= #1 0;
    hcount_nxt <= #1 0;
  
    vblnk_nxt <= #1 0;
    hblnk_nxt <= #1 0;
  
    vsync_nxt <= #1 0;
    hsync_nxt <= #1 0;   
   end
   else
   begin
   
    vcount_nxt <= #1 vcount_in;
    hcount_nxt <= #1 hcount_in;
   
    vblnk_nxt <= #1 vblnk_in;
    hblnk_nxt <= #1 hblnk_in;
   
    vsync_nxt <= #1 vsync_in;
    hsync_nxt <= #1 hsync_in;
   end

end  
  
  
  
 always@*
  begin
      if(hcount_nxt==1343   )
   begin
       hcount_in = 0;
       
       if(vcount_nxt==805)
           vcount_in =0 ;
       else
           vcount_in = (vcount_nxt+ 1);    
   end
   
   else
      begin
       hcount_in = ( hcount_nxt +1);
       vcount_in = vcount_nxt;
      end
      
         hblnk_in =(hcount_in>=1024);
         vblnk_in = (vcount_in>=768);
         
         vsync_in = ((vcount_in>=771)&&(vcount_in<=776));
         hsync_in =  ((hcount_in>=1048)&&(hcount_in<=1184));
    
  end  
  

endmodule
