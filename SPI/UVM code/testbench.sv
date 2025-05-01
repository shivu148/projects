
 import uvm_pkg::*;
`include "uvm_macros.svh"
`include "seq_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "interface.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"


module top_tb;
  bit clk;
  bit reset;
  
  always #5 clk = ~clk;
  
  initial begin
    reset = 0;
    #5 reset =1;
  end
  

  spi_interface intf(clk,reset);
  
  top_dut dut(intf.mclk, intf.reset,intf.load_master,intf.load_slave,intf.read_master,
  intf.read_slave,intf.start,intf.data_in_master,intf.data_in_slave,
  
              intf.data_out_master,intf.data_out_slave);
  
   initial begin 
     uvm_config_db#(virtual spi_interface)::set(uvm_root::get(),"*","vif",intf);
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  initial begin 
    run_test("spi_test");
  end
  
endmodule
