typedef struct {
    Bit#(5) rs1;
    Bit#(5) rs2;
    Bit#(5) rd;
    Bit#(3) funct3;
    Bit#(7) funct7;
} RType;

typedef struct {
    Bit#(5) rs1;
    Bit#(5) rd;
    Bit#(3) funct3;
    Bit#(12) imm;
} IType;

typedef struct {
    Bit#(5) rs1;
    Bit#(5) rs2;
    Bit#(3) funct3;
    Bit#(12) imm;
} SType;

typedef struct {
    Bit#(5) rs1;
    Bit#(5) rs2;
    Bit#(3) funct3;
    Bit#(12) imm;
} BType;

typedef struct {
    Bit#(5) rd;
    Bit#(20) imm;
} UType;

typedef struct {
    Bit#(5) rd;
    Bit#(20) imm;
} JType;

interface Instr; 
	method Action find_opcode(Bit#(32) x);                      
endinterface

module mkinstr (Instr);

	function Bit#(7) opcode(Bit#(32) x);
        return x[6:0];  
    endfunction

	function Bit#(5) get_rd(Bit#(32) instr);
        return instr[11:7];
    endfunction

    function Bit#(5) get_rs1(Bit#(32) instr);
        return instr[19:15];
    endfunction

    function Bit#(5) get_rs2(Bit#(32) instr);
        return instr[24:20];
    endfunction

    function Bit#(3) get_funct3(Bit#(32) instr);
        return instr[14:12];
    endfunction

    function Bit#(7) get_funct7(Bit#(32) instr);
        return instr[31:25];
    endfunction

    function Bit#(12) get_imm_12(Bit#(32) instr);
        return instr[31:20];  // For I-type and similar
    endfunction

    function Bit#(20) get_imm_20(Bit#(32) instr);
        return instr[31:12];  // For U-type and J-type
    endfunction

	method Action find_opcode(Bit#(32) x);
		Bit#(7) op = opcode(x);
		$display("Opcode of Instruction: %b",op);    
		if (op == 7'b0110011) begin
			// R-type
			RType rtype = RType {
				rs1: get_rs1(x),
				rs2: get_rs2(x),
				rd: get_rd(x),
				funct3: get_funct3(x),
				funct7: get_funct7(x)
			};
			$display("Instruction Type: R-type");
			$display("rs1: %b, rs2: %b, rd: %b, funct3: %b, funct7: %b",rtype.rs1, rtype.rs2, rtype.rd, rtype.funct3, rtype.funct7);
		end
		else if (op == 7'b0010011) begin
			// I-type
			IType itype = IType {
				rs1: get_rs1(x),
				rd: get_rd(x),
				funct3: get_funct3(x),
				imm: get_imm_12(x)
			};
			$display("Instruction Type: I-type");
			$display("rs1: %b, rd: %b, funct3: %b, imm: %b",
					itype.rs1, itype.rd, itype.funct3, itype.imm);
		end
		else if (op == 7'b0100011) begin
			// S-type
			SType stype = SType {
				rs1: get_rs1(x),
				rs2: get_rs2(x),
				funct3: get_funct3(x),
				imm: get_imm_12(x)
			};
			$display("Instruction Type: S-type");
			$display("rs1: %b, rs2: %b, funct3: %b, imm: %b",
					stype.rs1, stype.rs2, stype.funct3, stype.imm);
		end
		else if (op == 7'b1100011) begin
			// B-type
			BType btype = BType {
				rs1: get_rs1(x),
				rs2: get_rs2(x),
				funct3: get_funct3(x),
				imm: get_imm_12(x)
			};
			$display("Instruction Type: B-type");
			$display("rs1: %b, rs2: %b, funct3: %b, imm: %b",
					btype.rs1, btype.rs2, btype.funct3, btype.imm);
		end
		else if (op == 7'b0110111 || op == 7'b0010111) begin
			// U-type
			UType utype = UType {
				rd: get_rd(x),
				imm: get_imm_20(x)
			};
			$display("Instruction Type: U-type");
			$display("rd: %b, imm: %b", utype.rd, utype.imm);
		end
		else if (op == 7'b1110111) begin
			// J-type
			JType jtype = JType {
				rd: get_rd(x),
				imm: get_imm_20(x)
			};
			$display("Instruction Type: J-type");
			$display("rd: %b, imm: %b", jtype.rd, jtype.imm);
		end
	endmethod
endmodule