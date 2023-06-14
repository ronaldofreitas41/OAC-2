module coffe (input cafeBtn,input dinheiro, input sopaBtn ,output cafe, output sopa);
    assign cafe = (~(cafeBtn & sopaBtn)  & (dinheiro & cafeBtn) );
    assign sopa = ((cafeBtn & sopaBtn)  & dinheiro );
endmodule

module tb;
reg cafeBtn, dinheiro, sopaBtn;
wire cafe;

coffe coffe_tb(
    .cafeBtn(cafeBtn),
    .dinheiro(dinheiro),
    .sopaBtn(sopaBtn),
    .cafe(cafe),
    .sopa(sopa)
);

initial begin

    $monitor("cafeBtn=%b, dinheiro=%b, sopaBtn=%b, cafe=%b, sopa=%b ",cafeBtn, dinheiro, sopaBtn, cafe, sopa);
    $dumpfile("cafe.vcd");
    $dumpvars(0,tb);

    cafeBtn <= 1;
    dinheiro <= 1;
    sopaBtn <= 0;
end;   
endmodule;