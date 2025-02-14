class count_wr_mon;

virtual count_if.WR_MON wrmon_if;
count_trans data2rm,wr_data;

mailbox #(count_trans)mon2rm;

function new(count_if.WR_MON wrmon_if,mailbox #(count_trans)mon2rm);
    begin
      this.wrmon_if = wrmon_if;
      this.mon2rm = mon2rm;
      this.wr_data = wr_data;
    end
endfunction

virtual task monitor();
    begin
        @(wrmon_if.wrmon_clkblk);
        begin
           wr_data.up_down = wrmon_if.wrmon_clkblk.up_down;
           wr_data.load = wrmon_if.wrmon_clkblk.load;
           wr_data.data = wrmon_if.wrmon_clkblk.data;
           wr_data.display("This is from the Monitor");

        end
    end
endtask

virtual task start();
    fork
        forever
            begin
                monitor();
                data2rm = new wr_data;
                mon2rm.put(data2rm);
            end        
    join_none
endtask

endmodule