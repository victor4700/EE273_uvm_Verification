//This is a sequence for demo2

class seq1 extends uvm_sequence #(sdd_si);
`uvm_object_utils(seq1)
sdd_si si;
function new(string name="seq1");
	super.new(name);
endfunction : new

   task doreset(input int nr);
	   repeat(nr) begin
       start_item(si);
       si.cmd=Dreset;
       si.randomize();
       finish_item(si);
     end
   endtask : doreset
   
   task doadd(input int nr);
	   repeat(nr) begin
       start_item(si);
       si.cmd=Dadd;
       si.randomize() with {((A+B)&(1<<6)>>6)!=A[6]^B[6];};
       finish_item(si);
     end
   endtask : doadd
   
      task doXOR(input int nr);
	   repeat(nr) begin
       start_item(si);
       si.cmd=DXOR;
       si.randomize();
       finish_item(si);
     end
   endtask : doXOR
	
	task body();
	si=sdd_si::type_id::create("sequence_Item_sdd");

	doreset(8);
	doadd(50);
	doXOR(100);

endtask : body


endclass:seq1

