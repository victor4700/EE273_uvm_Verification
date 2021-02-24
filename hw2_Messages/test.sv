// This is a fun test

//= = = = = = = = =
class A extends uvm_scoreboard;
`uvm_component_utils(A)
uvm_analysis_port #(int) msg;
int qqq;

function new(string name="A",uvm_component parent=null);
	super.new(name,parent);
endfunction : new

function void build_phase(uvm_phase phase);
	msg=new("Amsg",this);
endfunction : build_phase

task run_phase(uvm_phase phase);
	qqq=0;
	phase.raise_objection(this);
	repeat(20) begin
		#1;
		msg.write(qqq);
		qqq+=1;
	end
	phase.drop_objection(this);
endtask : run_phase

endclass : A

//= = = = = = = = = =
class B extends uvm_scoreboard;
`uvm_component_utils(B)
uvm_analysis_imp #(int,B) msg;

function new(string name="B",uvm_component parent=null);
	super.new(name,parent);
endfunction : new

function void build_phase(uvm_phase phase);
	msg=new("Bmsg",this);
endfunction : build_phase

function void write(int q);
	`uvm_info("silly",$sformatf("Wen Zhi Qian %d",q),UVM_MEDIUM);
endfunction : write

endclass : B


//= = = = = = = = = =
class mytest extends uvm_test;
`uvm_component_utils(mytest)
A boxa;
B boxb;

function new(string name="mytest",uvm_component parent=null);
	super.new(name,parent);

endfunction : new

function void build_phase(uvm_phase phase);
	boxa=A::type_id::create("boxa",this);
	boxb=B::type_id::create("boxb",this);
endfunction : build_phase

function void connect_phase(uvm_phase phase);
	boxa.msg.connect(boxb.msg);
endfunction : connect_phase


endclass : mytest
