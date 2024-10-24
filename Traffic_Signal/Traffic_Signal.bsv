
interface Traffic_Signal;
    method State computeNextState(State cs);  // declare a new method named computeNextState  with return type State and Input type State
endinterface

typedef enum { Red , Yellow , Green } State deriving (Bits, Eq); // enum defined here Identifyers should be in capitals

module mktraffic_signal ( Traffic_Signal );

    function State nextState(cs);  // function to compute next state 
        case (cs)
            Red: cs = Yellow;        
            Yellow: cs = Green;
            Green: cs = Red;
        endcase
        return cs;
    endfunction

    method State computeNextState(State cs);  // method call
        return nextState(cs);  // function call
    endmethod

endmodule