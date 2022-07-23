#include<verilated.h>                                                                 
#include<VTop.h>
#include<iostream>
#include<verilated_vcd_c.h>

VTop * top = new VTop("top");
vluint64_t TIME = 0;
VerilatedVcdC * tfp = new VerilatedVcdC; 
VerilatedContext * contextp = new VerilatedContext;

void step()
{
        top -> eval();
	tfp -> dump(TIME++);
}

void initialize()
{
        Verilated::traceEverOn(true);
        top->trace(tfp,0); 
        tfp->open("wave.vcd");

}

int main(int argc,char **argv)
{
//	contextp -> commandArgs(argc,argv);
        initialize();
        while(1)
        {
                step();
                //assert(top -> x * top -> y == top -> z); 
        }
}


