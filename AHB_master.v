module ahb_master(hwrite,hr_data,hresp,hwrite,hclk,hreset,hready_in,htrans,haddr,hwdata);
input hclk,hreset;
input [1:0]hresp;
input [31:0]hr_data;
output reg hwrite,hready_in; output reg [31:0]haddr,hwdata; output reg [1:0]htrans;
reg [2:0]hburst; reg [2:0]hsize;
task single_write(); begin @ (posedge hclk); begin
htrans=2'b10; hwrite=1'b1; hburst=0;
haddr=32'h8000_0001; hsize=0;
hready_in=1'b1; end
@(posedge hclk); begin
htrans=2'd0;
hwdata=32'h8000_5441; end
end endtask
task single_read(); begin
@(posedge hclk); begin
hwrite=0;
htrans=0;
hsize=0;
hburst=0; hready_in=1'b1; haddr=32'h8000_0001;
end
@(posedge hclk);
begin
htrans=2'd0;
end
end endtask
endmodule
