module dff ( input d,
            input clk,
            input rstn,
            output reg q);

    always @(posedge clk) begin
        if (!rstn)
            q<=0;
        else 
            q<=d;
    end

endmodule

module tb;

    reg d,clk,rstn;
    wire q;

    initial begin
        $monitor ("clock-%b, d-%b, rstn-%b, q-%b", clk, d, rstn, q);

        clk = 0;
        d = 1;
        rstn = 0;

        #2
        d=1;
        rstn = 1;
        #2
        d=0;
        rstn = 0;
        #2
        d=0;
        rstn = 1;
        
        #2 $finsh;
    end

    always begin
        #1 clk = !clk;        
    end

    dff dff_tb(.clk(clk),
               .d(d),
               .rstn(rstn),
               .q(q));
               
endmodule
