class count_gen;

count_trans trans;
count_trans dta2snd;

mailbox #(count_trans)gen2drv;

function new (mailbox #(count_trans)gen2drv);
  this.gen2drv = gen2drv;
  this.trans = trans;
endfunction

virtual task start();
    fork
        begin
           for (int i = 0,i ,no_of_transactions, i++,)
              begin
                assert(trans.randomize());
                dta2snd = new trans;
                gen2drv.put(dta2snd);
              end
        end        
    join_none
endtask


endclass