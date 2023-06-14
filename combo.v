module combo( input a,
input b,
input c,
input d,
output reg o
);
    
    always @(a or b or c or d) begin
        o <= ~((a&b) | (c^d));
    end;

endmodule

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

 reg a,b,c,d;
 wire o;
 integer i;

 combo combo_tb(
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .o(o)
 );

initial begin

    $monitor("a=%b, b=%b, c=%b, d=%b,o=%b", a,b,c,d,o);
    $dumpfile("comb.vcd");
    $dumpvars(0,tb);

    a<=0;
    b<=0;
    c<=0;
    d<=0;

    for (i = 0 ; i < 16 ; i = i + 1) begin
        {a,b,c,d} = i;
        #10;
    end;
end;   
endmodule;
