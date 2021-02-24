`timescale 1ns/10ps

package silly;
import uvm_pkg::*;

`include "test.sv"

endpackage : silly




import uvm_pkg::run_test;

module top() ;

initial begin
    $display("Hi there");
	run_test("mytest");
end






endmodule : top
