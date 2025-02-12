interface count_if(input clk);
   
      logic rst_n;
      logic load;
      logic up_down;
      logic [3:0] din;
      logic [3:0] count;


    clocking driv_clkblk(input clk);
    default #1 input #1 output;
    output  load;
    output  up_down;
    output [3:0] din;
    endclocking

    clocking wrmon_clkblk(input clk);
    default #1 input #1 output;
    output  load;
    output  up_down;
    output [3:0] din;
    endclocking

    clocking rdmon_clkblk(input clk);
    default #1 input #1 output;
    input [3:0] count;
    endclocking

    modport DRV(clocking driv_clkblk);

    modport WR_MON(clocking wrmon_clkblk);

    modport RD_MON(clocking rdmon_clkblk);



endinterface