class count_trans;

rand logic load;
rand logic up_down;
rand logic [3:0] din;
logic [3:0] count;
logic [3:0] reset;

constraint constraint_1 {din inside {[0:10]};}
constraint constraint_2 {up_down dist {0 := 30 , 1 := 70};}
constraint constraint_3 {load dist {1 := 50 , 0 := 50};}

virtual function void trans_output_display(input string s);
    begin
    $display("....................%s..................",s);
    $display("Up_down",up_down);
    $display("load",load);
    $display("din",din);
    $display("Count",count);
    $display(".........................................");        

    end
endfunction

endclass