// This is the message for the seq=seqr-driver path in ssd

typedef enum {
	Dreset,
	Dadd,
	DXOR
} Dcmd;

class sdd_si extends uvm_sequence_item;
`uvm_object_utils(sdd_si)

	Dcmd cmd;
	rand logic signed [35:0] A;
	rand logic signed [20:0] B;
	rand logic ci;
	logic op;
	
	
function new(string name="sdd_si");
	super.new(name);
endfunction : new

endclass : sdd_si


