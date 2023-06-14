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