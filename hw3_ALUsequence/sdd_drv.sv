// Driver

class sdd_drv extends uvm_driver #(sdd_si);
`uvm_component_utils(sdd_drv)
sdd_si mr;


function new(string name="sdd_drv",uvm_component parent=null);
	super.new(name,parent); //base class
endfunction : new

task run_phase(uvm_phase phase);
	forever begin
		seq_item_port.get_next_item(mr);
		$display("A %b",mr.A," B %b",mr.B," carry-in %b",mr.ci);
		seq_item_port.item_done();
	end
endtask : run_phase

endclass : sdd_drv


