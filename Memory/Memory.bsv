import Vector :: *;  // Import the Vector package

typedef struct {
    Bit#(32) address;
	Bit#(32) write_data;
} MemoryWrite;

typedef struct {
    Bit#(32) read_data;
} MemoryRead;

interface Memory; 
    method Action inp_write(Bit#(32) address, Bit#(32) data);
    method Action inp_read(Bit#(32) address);                 
endinterface

module mkmemory (Memory);

    Vector#(1024, Reg#(Bit#(32))) memory <- replicateM(mkReg(0)); // creating a vector of 1024 elements with each 32 bit spaced . replicate: used to replicate values across collection mkreg(0) will create a reg of 32bits. 

    method Action inp_write(Bit#(32) address, Bit#(32) data);
        MemoryWrite mw = MemoryWrite {
            address: address,
            write_data: data
        };
        memory[mw.address] <= mw.write_data;
        $display("Wrote data to address %d: %b", mw.address, mw.write_data); 
    endmethod
    
    method Action inp_read(Bit#(32) address);
        MemoryRead mr;
        mr.read_data = memory[address];
        $display("Read data from address %d: %b", address, mr.read_data); 
    endmethod 

endmodule