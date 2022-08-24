`timescale 1ns/1ps
module cpu_tb();

    reg CLOCK_50,rst;
    initial begin
        CLOCK_50 = 1'b0;
        forever #10 CLOCK_50 = ~ CLOCK_50;
    end
    
    initial begin
        rst = 1'b1;
        #50 rst = 1'b0;
        #1000 $stop();
    end
    
    Top rv64(
        .clock(CLOCK_50),
        .reset(rst)
    );

endmodule