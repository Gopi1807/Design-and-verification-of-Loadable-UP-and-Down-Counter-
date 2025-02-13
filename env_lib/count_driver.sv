class count_driver;

      virtual count_if.DRV dr_if;

      count_trans data2duv;      
      mailbox #(count_trans)gen2drv;

      function new(virtual count_if.DRV dr_if, mailbox #(count_trans)gen2drv);
      begin
        this.dr_if = dr_if;
        this.gen2dr = gen2dr;
      end      
      endfunction

      virtual task drive();
           begin
              @(dr_if.driv_clkblk);
                    dr_if.driv_clkblk.load  <= data2duv.load;
                    dr_if.driv_clkblk.din   <= data2duv.data;
                    dr_if.driv_clkblk.up_down <= data2duv.up_down;                    
           end
      endtask

      virtual task start();
            fork
                forever begin
                    gen2dr.get(data2duv);
                    drive();                   
                end
            join_none
      endtask

endclass

