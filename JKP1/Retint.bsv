// Copyright (c) 2014-2016 Bluespec, Inc.  All Rights Reserved.


interface Return_int; //in interface name it should start with caps
	method int retint(int x);
endinterface

module mkretint (Return_int);

	method int retint(int x);
               return x+1;
	endmethod
 
endmodule


