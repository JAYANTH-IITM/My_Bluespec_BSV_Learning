interface Adder; //in interface name it should start with caps
	method int adder(int x , int y);                      // this is how the input are given , the method is of int type and each input are also of int type.
endinterface

module mkadder (Adder);

	method int adder(int x , int y);   // the interface is used here 
               return x+y;  // output is returned here 
	endmethod
 
endmodule


