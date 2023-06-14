module alarme (input motorista,input cinto, input ignicao ,output luz);
    assign luz = (motorista  & ~cinto & ignicao);
endmodule

module tb;
reg motorista, cinto, ignicao;
wire luz;

alarme alarme_tb(
    .motorista(motorista),
    .cinto(cinto),
    .ignicao(ignicao),
    .luz(luz)
);

initial begin

    $monitor("motorista=%b, cinto=%b, ignicao=%b, luz=%b ",motorista, cinto, ignicao, luz);
    $dumpfile("luz.vcd");
    $dumpvars(0,tb);

    motorista <= 0;
    cinto <= 0;
    ignicao <= 0;
end;   
endmodule;