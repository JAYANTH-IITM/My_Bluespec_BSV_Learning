interface Toggle; //in interface name it should start with caps
	method Action toggle();   
	method ActionValue #(Bit#(1)) get_value();                   // this is how the input are given , the method is of int type and each input are also of int type.
endinterface

module mktoggle (Toggle);

	Reg#(Bit#(1)) a <- mkReg(0);

	method Action toggle();
		a <= a ^ 1;
	endmethod

	method ActionValue #(Bit#(1)) get_value;
		return a;
	endmethod

endmodule


