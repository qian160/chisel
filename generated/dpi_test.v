import "DPI-C" function int add(input int a, input int b);

module test();

	initial	begin
		$display("hello world");
		$display(" %d + %d = %d\n",114,514,add(114,514));
		$finish();
	end

endmodule
