interface Converter2; //in interface name it should start with caps
	method Tuple2#(Bit#(32), Bit#(32)) converter(int x , int y);  // this is how the input are given , the method is of int type and each input are also of int type.
endinterface

module mkconverter (Converter2);

	method Tuple2#(Bit#(32), Bit#(32)) converter(int x , int y);   // the interface is used here 
               Bit#(32) r1 = pack(x);
               Bit#(32) r2 = pack(y);
			   return tuple2(r1, r2); 
	endmethod
 
endmodule


