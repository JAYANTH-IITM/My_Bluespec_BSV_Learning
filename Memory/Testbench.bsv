import Memory :: *;
module mkTestbench (Empty);

	Memory mem <- mkmemory;
	Reg#(Bool) write_done <- mkReg(False);
											// rule's fire parallely.
	rule write_data_to_memory(!write_done); //explicit rule firing , to prevent write and read happening in the same cycle .
		Bit#(32) address = 32'h200;
		Bit#(32) data = 32'hDEADBEEF;
		mem.inp_write(address , data);
		write_done <= True; 
	endrule

	rule read_data_from_memory(write_done);
		Bit#(32) address = 32'h210;
		mem.inp_read(address);
		write_done <= False;
		$finish;
	endrule

endmodule