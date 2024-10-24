import Discriminant :: *;
module mkTestbench (Empty);
	Discriminant disc <- mkdiscriminant;   
	rule start;
			Int#(32) d = disc.find_discriminant(4,5,6);  
	     	$display("Displaying  Values:");
        	$display("The discriminant is : = %d", d);
        	$finish;
	endrule	
endmodule
