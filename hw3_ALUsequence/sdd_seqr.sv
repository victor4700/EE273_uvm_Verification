//the sequencer for sdd

class sdd_seqr extends uvm_sequencer#(sdd_si);
`uvm_component_utils(sdd_seqr)

function new(string name="sdd_seqr",uvm_component parent=null);
	super.new(name,parent); //base class
endfunction : new


endclass : sdd_seqr


