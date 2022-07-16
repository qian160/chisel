#include<iostream>
#include<fstream>
using namespace std;

int main(int argc, char ** argv)
{
	ifstream in;
	in.open("asm.txt");
	string line;
	//start at line 7 
	int n = 7;
	while(n--)getline(in,line);

	while(getline(in,line))
	{
		for(int i = 6; i < 14; i++)
			cout<<line[i];
		cout<<endl;
	}
}
