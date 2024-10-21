import Converter2 :: *;
module mkTestbench (Empty);
	Converter2 cnv <- mkconverter;    
	rule converter;
			Bit#(32) a,b;
		    {a ,  b} = cnv.converter(4 , 2);  // '{}' is used to return tuple2 
	     	$display("Displaying  Values:");
        	$display("Output value1 is : = %b", a);
        	$display("Output value2 is : = %b", b);			
        	$finish;
	endrule	
endmodule
