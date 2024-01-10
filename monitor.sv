class monitor;
  
  virtual intf vif;
  mailbox mon2scb;
  
  function new(virtual intf vif,mailbox mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction
  
  task main();
    repeat(1)
      #5
      begin
        transaction trans;
        trans = new();
        @(posedge vif.MONITOR.clk)
        begin
          trans.j = vif.j;
          trans.k = vif.k;
          trans.q = vif.q;
        end
        mon2scb.put(trans);
        trans.display("Monitor");
      end
  endtask
  
endclass
