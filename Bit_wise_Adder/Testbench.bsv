import Input :: *;
module mkTestbench (Empty);
	Input in <- mkget_input;    // tell that a module called "mkadder" can access an interface through "key" called ad
	rule retint;
			Bit#(32) s;
			Bit#(1) c;
	     	{s , c} = in.get_input(42 , 10);  // pass value to the interface , which then passed to method
        	$display(" value of sum  is : = %b", s);
        	$display(" value of carry  is : = %b", c);
        	$finish;
	endrule	
endmodule

