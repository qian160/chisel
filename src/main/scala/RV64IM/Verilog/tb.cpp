#include<verilated.h>                                                                 
#include<VDiv.h>
#include<iostream>
#include<verilated_vcd_c.h>

VDiv * top = new VDiv("top");
VerilatedVcdC * tfp = new VerilatedVcdC; 
vluint64_t TIME = 0;

void step()
{
        top -> clock = (top -> clock + 1) % 2;
	top -> eval();
	tfp -> dump(TIME++);
	printf("REM = %ld, QUO = %ld\n", top -> io_rem, top -> io_quo);
}

void initialize(int a, int b)
{
        Verilated::traceEverOn(true);
        top->trace(tfp,0); 
        tfp->open("wave.vcd");
	top -> io_a = a;
	top -> io_b = b;
	top -> io_start = 1;
	top -> clock = 0;
}

int main(int argc,char **argv)
{
	int a = atoi(argv[1]);
	int b = atoi(argv[2]);
//	contextp -> commandArgs(argc,argv);
	int n = 20000;
	initialize(a,b);
	while(n--)
        {
                step();
                //assert(top -> x * top -> y == top -> z); 
        }
}


