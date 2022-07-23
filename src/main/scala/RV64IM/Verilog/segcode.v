//for nvboard
`define seg0   8'b00000011
`define seg1   8'b10011111
`define seg2   8'b00100101
`define seg3   8'b00001101
`define seg4   8'b10011001
`define seg5   8'b01001001
`define seg6   8'b01000001
`define seg7   8'b00011111
`define seg8   8'b00000001
`define seg9   8'b00001001
`define sega   8'b00010001
`define segb   8'b11000001
`define segc   8'b01100011
`define segd   8'b10000101
`define sege   8'b00100001
`define segf   8'b01110001

//usage: build a table first, then use the original data to index into that table
/*	like this:(need to bind the pins)
        initial  begin
                Table[0]=`seg0;
                Table[1]=`seg1;
                Table[2]=`seg2;
                Table[3]=`seg3;
                Table[4]=`seg4;
                Table[5]=`seg5;
                Table[6]=`seg6;
                Table[7]=`seg7;
                Table[8]=`seg8;
                Table[9]=`seg9;
                Table[10]=`sega;
                Table[11]=`segb;
                Table[12]=`segc;
                Table[13]=`segd;
                Table[14]=`sege;
                Table[15]=`segf;
	end
*/

