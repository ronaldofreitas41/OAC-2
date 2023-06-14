module counter (input clk,input rstn,output reg [3:0] out);
    always @(posedge clk) begin
        if(!rstn) begin 
            out <= 0;
        end else begin
            if (out == 9) begin
                out <= 0;
            end else begin
                out <= out + 1;
            end
        end 
    end
endmodule

module tb;
reg clk, rstn;
wire[3:0] out;

always #2 clk = ~clk;

counter counter_tb(
    .clk(clk),
    .rstn(rstn),
    .out(out)
);

initial begin

    $monitor("clk=%b, rstn=%b, out=%4b, ",clk, rstn, out);
    $dumpfile("counter.vcd");
    $dumpvars(0,tb);
    {clk,rstn} = 0;

    #2 rstn<=1;
    #100 $finish;
end;   
endmodule;