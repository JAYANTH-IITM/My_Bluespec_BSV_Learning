import Retint :: *;
module mkTestbench (Empty);
	Return_int ri <- mkretint;
	rule retint;
	     	int ans = ri.retint(42);
	     	$display("Displaying  Values:");
        	$display("Output value is : = %d", ans);
        	$finish;
	endrule	
endmodule

