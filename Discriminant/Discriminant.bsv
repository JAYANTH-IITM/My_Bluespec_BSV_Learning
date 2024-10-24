interface Discriminant; 
	method Int#(32) find_discriminant(int x , int y , int z);                      
endinterface

module mkdiscriminant (Discriminant);

	function Int#(32) discriminant(int x , int y , int z);
        return ((x * x) - 4*y*z);  
    endfunction

	method Int#(32) find_discriminant(int x , int y , int z);    
               Int#(32) d = discriminant(x , y , z);
			   return d; 
	endmethod
 
endmodule