`define D_IF vif.DRIVER.driver_cb
class driver;
  
  virtual intf vif;
  
  mailbox gen2driv;
  
  function new(virtual intf vif,mailbox gen2driv);
    this.vif = vif;
    this.gen2driv = gen2driv;
  endfunction
  
  task main();
    
    repeat(1) 
      begin
        transaction trans;
        
        gen2driv.get(trans);
        @(posedge vif.DRIVER.clk)
        begin
          vif.j    <= trans.j;
          vif.k    <= trans.k;
          trans.q     = vif.q;
          trans.display("DRIVER");
        end
      end
  endtask
endclass
