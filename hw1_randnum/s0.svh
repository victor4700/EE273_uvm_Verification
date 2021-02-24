// class s0 template
class s0 extends uvm_sequence #(itm) ;
  `uvm_object_utils(s0)
 
itm mx;

   function new(string name="s0");
      super.new(name);
   endfunction : new

   task doreset(input int nr);
     repeat(nr) begin
       start_item(mx);
       mx.opcode=E_reset;
       mx.randomize();
       finish_item(mx);
     end
   endtask : doreset
   
   task donop(input int nr);
     repeat(nr) begin
       start_item(mx);
       mx.opcode=E_nop;
       mx.randomize();
	$display("%d",mx.din);
       finish_item(mx);
     end
   endtask : donop
   
// A sequence body template. put tests there
 /*  task body;
     mx=itm::type_id::create("seq_item");
     doreset(3);
     donop(3);
// Put your stuff here...
	start_item(mx);
	assert (mx.randomize());
	finish_item(mx);
	get_response(mx);

//
   endtask : body
endclass : s0
*/
	task body;
	  begin
		mx = itm::type_id::create("seq_item");
		doreset(3);
     		donop(3);
		

		repeat(2100) begin
		  wait_for_grant();
		  mx.opcode = E_push;
		  mx.randomize()with{mx.din<1000;};
		  send_request(mx);
	        end

		repeat(1200) begin
		  wait_for_grant();
		  mx.opcode = E_pushcomplete;
		  mx.randomize()with{mx.din<1000;};
		  send_request(mx);
	        end
	end
		 
		endtask
endclass : s0	
