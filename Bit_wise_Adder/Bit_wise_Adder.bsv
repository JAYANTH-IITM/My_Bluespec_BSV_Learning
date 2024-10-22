interface Bit_wise_Adder; //in interface name it should start with caps
	method Tuple2#(Bit#(32), Bit#(1)) bit_wise_adder(Bit#(32) a , Bit#(32) b);                      // this is how the input are given , the method is of bit type and each input are also of bit type.
endinterface

module mkbit_wise_adder (Bit_wise_Adder);

	method Tuple2#(Bit#(32), Bit#(1)) bit_wise_adder(Bit#(32) x , Bit#(32) y);   // the interface is used here
		Bit#(32) sum = 32'b0; // initialize sum to zeros
		Bit#(1) carry = 0; // initialize carry to zero 
		for (Integer i = 0; i < 32; i = i + 1) begin
			sum[i] = x[i] ^ y[i] ^ carry ;
			carry = ( (x[i] & y[i]) | (x[i] & carry) | (y[i] & carry) );   
        end 
		return  tuple2(sum , carry);                  // output is returned here 
	endmethod
 
endmodule