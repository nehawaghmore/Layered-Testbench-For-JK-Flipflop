class scoreboard;
  
  mailbox mon2scb;
  
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  task main();
    transaction trans;
    repeat(1)
      begin
        mon2scb.get(trans);
        if(trans.j==1'b0 && trans.k==1'b0 && trans.q==trans.q)
          $display("RESULT AS EXPECTED");
        else if(trans.j==1'b0 && trans.k==1'b1 && trans.q==1'b0)
          $display("RESULT AS EXPECTED");
        else if(trans.j==1'b1 && trans.k==1'b0 && trans.q==1'b1)
          $display("RESULT AS EXPECTED");
        else if(trans.j==1'b1 && trans.k==1'b1 && trans.q==~trans.q)
          $display("RESULT AS EXPECTED");
        else
          $display("RESULT IS WRONG");
      end
    trans.display("Scorebroad");
  endtask
endclass
