`timescale 1ns/10ps

package nirav;
import uvm_pkg::*;
`include "sdd_si.sv"
`include "seq1.sv"
`include "sdd_seqr.sv"
`include "sdd_drv.sv"
`include "sdd.sv"

endpackage: nirav

import uvm_pkg::*;

module top();

reg clk,reset;


initial begin
	run_test("ssd"); //sequence,sequencer,driver
end

endmodule :top 

