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
