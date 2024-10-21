import Converter :: *;
module mkTestbench (Empty);
	Converter cnv <- mkconverter;    // tell that a module called "mkadder" can access an interface through "key" called ad
	rule converter;
		    Bit#(32) a = cnv.converter(152);  // pass value to the interface , which then passed to method
	     	$display("Displaying  Values:");
        	$display("Output value is : = %b", a);
        	$finish;
	endrule	
endmodule