module tb();

    wire [63:0]  a;
    wire [63:0]  b;
    wire [127:0] result;

    Mult m0(
        .io_a(a),
        .io_b(b),
        .io_sign(1'b0),
        .io_result(result)
    );


    reg [63:0] t1;
    reg [63:0] t2;
    reg [63:0] t3;
    reg [63:0] t4;

    initial begin
        t1 = 64'h0;
        t2 = 64'h0;
        t3 = 64'h0;
        t4 = 64'h0;
    end

/*
//64*64
    always #10 begin        
        t1 <= $random;
        t2 <= $random;
        t3 <= $random;
        t4 <= $random;
    
    end
    
    assign a = t1 * t2;
    assign b = t3 * t4;
*/


//32*32

always #10 begin
    t1 <= $random % 1000000;
    t2 <= $random % 1000000;
end

assign a = t1;
assign b = t2;

endmodule