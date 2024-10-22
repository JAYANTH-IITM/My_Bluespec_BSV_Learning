import Bit_wise_Adder :: *;
interface Input; //in interface name it should start with caps
	method Tuple2#(Bit#(32), Bit#(1)) get_input(Int#(32) x , Int#(32) y); // this is how the input are given , the method is of bit type and each input are also of int type.
endinterface

module mkget_input (Input);

	Bit_wise_Adder bwa <- mkbit_wise_adder;  
	method Tuple2#(Bit#(32), Bit#(1)) get_input(Int#(32) x , Int#(32) y);   // the interface is used here 
			   Bit#(32) a = pack(x) ;
			   Bit#(32) b = pack(y) ;
               Bit#(32) r ;
			   Bit#(1) q ;
			   {r , q} = bwa.bit_wise_adder(a , b);
			   return tuple2(r , q);                        // output is returned here 
	endmethod
 
endmodule
