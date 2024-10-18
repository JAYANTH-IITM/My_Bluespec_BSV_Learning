import Adder :: *;
module mkTestbench (Empty);
	Adder ad <- mkadder;    // tell that a module called "mkadder" can access an interface through "key" called ad
	rule retint;
	     	int ans = ad.adder(42 , 10);  // pass value to the interface , which then passed to method
	     	$display("Displaying  Values:");
        	$display("Output value is : = %d", ans);
        	$finish;
	endrule	
endmodule

