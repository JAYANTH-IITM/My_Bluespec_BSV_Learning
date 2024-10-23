import Toggle :: *;
module mkTestbench (Empty);
	Toggle tog <- mktoggle;    // tell that a module called "mkadder" can access an interface through "key" called ad
	rule test_toggle;

	    tog.toggle();  // pass value to the interface , which then passed to method
		let val1 = tog.get_value();
		$display("After toggle, value is: %b", val1);

	endrule	
endmodule

