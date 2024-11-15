import Instr :: *;
module mkTestbench (Empty);
	Instr in <- mkinstr;   
	rule start;
			Bit#(32) hex1_value = 32'h00030333;
			Bit#(32) hex2_value = 32'h00030313;
			Bit#(32) hex3_value = 32'h00030323;
			Bit#(32) hex4_value = 32'h00030363;
			Bit#(32) hex5_value = 32'h00100037;
			Bit#(32) hex6_value = 32'h000080f7;
			in.find_opcode(hex1_value);
			in.find_opcode(hex2_value);
			in.find_opcode(hex3_value);
			in.find_opcode(hex4_value);
			in.find_opcode(hex5_value);
			in.find_opcode(hex6_value);  
        	$finish;
	endrule	
endmodule