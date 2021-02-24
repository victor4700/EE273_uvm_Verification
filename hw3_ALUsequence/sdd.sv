// our top level test for playing

class ssd extends uvm_test;
`uvm_component_utils(ssd)
seq1  sq1;
sdd_seqr  sqr;
sdd_drv  drv;

function new(string name="ssd",uvm_component parent=null);
	super.new(name,parent); //base class
endfunction : new
 
function void build_phase(uvm_phase phase);
	sqr = sdd_seqr::type_id::create("sqr",this);
	drv = sdd_drv::type_id::create("drv",this);
endfunction : build_phase

function void connect_phase(uvm_phase phase);
	drv.seq_item_port.connect(sqr.seq_item_export);

endfunction : connect_phase

task run_phase(uvm_phase phase);
	sq1=seq1::type_id::create("seq1");
	phase.raise_objection(this);
	#10;
	sq1.start(sqr);
	#10;
	phase.drop_objection(this);

endtask : run_phase


endclass:ssd

