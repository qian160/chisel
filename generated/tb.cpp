//change vmult to other names
#include<verilated.h>                                                                 
#include<VAdder.h>
#include<iostream>
#include<verilated_vcd_c.h>

VAdder * top = new VAdder("top");
vluint64_t TIME = 0;
VerilatedVcdC * tfp = new VerilatedVcdC; 
VerilatedContext * contextp = new VerilatedContext;

void step()
{
        top -> io_a = rand() % 100;
        top -> io_b = rand() % 100;

        top -> eval();
        tfp -> dump(TIME++);

        printf("x=%3d  y=%3d  z=%6d \n",top->io_a,top->io_b,top->io_out);
}

void initialize()
{
        Verilated::traceEverOn(true);
        top->trace(tfp,0); 
        tfp->open("wave.vcd");

}

int main(int argc,char **argv)
{
	contextp -> commandArgs(argc,argv)	
        initialize();
        while(1)
        {
                step();
                //assert(top -> x * top -> y == top -> z); 
        }
}


