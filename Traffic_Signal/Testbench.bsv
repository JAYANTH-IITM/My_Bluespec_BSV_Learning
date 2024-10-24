import Traffic_Signal :: *;

module mkTestbench(Empty);

    Traffic_Signal ts <- mktraffic_signal;
    Reg#(State) cs <- mkReg(Yellow); // Declare a Register of type state , with initial input Yellow

    function String stateToString(State state);  // typedef enum outputs cant be displayed directly , should be converted first 
        case (state)
            Red:    return "Red";
            Yellow: return "Yellow";
            Green:  return "Green";
            default: return "Unknown State";  // Handle any unexpected values
        endcase
    endfunction

    rule begin_state_change if(cs != Red); // rule does not fire if the State is Red 
        let ns = ts.computeNextState(cs);  // compute the next state 
        $display(" The curent State is : = %s", stateToString(cs));
        $display(" The next State is : = %s", stateToString(ns));
        cs <= ns; // update the current state 
        
    endrule

endmodule
