

class spi_test extends uvm_test;
  
  spi_environment env;
  
  virtual spi_interface vif;
  
  `uvm_component_utils(spi_test)
  
 
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    env=spi_environment::type_id::create("env", this);
    
  endfunction
  

  task run_phase(uvm_phase phase);
    spi_sequence spi_seq;
    spi_seq = spi_sequence::type_id::create("spi_seq",this);
    phase.raise_objection( this);
    spi_seq.start(env.agt.seq);
    #100ns;
    phase.drop_objection( this);
  endtask
  
endclass
