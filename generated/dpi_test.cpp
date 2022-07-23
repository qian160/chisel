/*
 	steps in using dpi-c
	1. for .v  :  import "DPI-C" function xxx
	2. for cpp :  include <svdpi.h> <Vtop__dpi.h>	!!2 slashes
			and define that function
 
 */
#include<verilated.h>
#include<Vdpi_test.h>
#include<iostream>
#include<Vdpi_test__Dpi.h>
#include<svdpi.h>

int add(int x,int y){
	return x+y;
}

Vdpi_test * top = new Vdpi_test("top");
VerilatedContext * contextp = new VerilatedContext;

int main(int argc,char **argv)
{
	contextp -> commandArgs(argc,argv);
       	
        while(!contextp->gotFinish())
        {
                top -> eval();
                //assert(top -> x * top -> y == top -> z); 
        }
}


