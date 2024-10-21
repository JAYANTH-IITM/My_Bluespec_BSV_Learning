interface Converter; //in interface name it should start with caps
	method Bit#(32) converter(int x);                      // this is how the input are given , the method is of int type and each input are also of int type.
endinterface

module mkconverter (Converter);

	method Bit#(32) converter(int x);   // the interface is used here 
               Bit#(32) r = pack(x);
			   return r; 
	endmethod
 
endmodule


