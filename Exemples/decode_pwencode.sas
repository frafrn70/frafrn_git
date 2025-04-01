%macro decodeAttachement(encoded,decoded);
 data _null_;
 length bits $500 char $1 string $76;
 retain bits;

 /* char arrays used to decode from base64 */
 array lookup{64} $ ('A','B','C','D','E','F','G','H','I','J','K','L','M',
 'N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
 'a','b','c','d','e','f','g','h','i','j','k','l','m',
 'n','o','p','q','r','s','t','u','v','w','x','y','z',
 '0','1','2','3','4','5','6','7','8','9','+','/');

 /* input file */
 infile &encoded;
 /* output file */
 file &decoded;

 input string;
 /* decode each character read from input file if it is not a EOF (13) or = (61)*/
  do i=1 to length(string);
    if  rank(substr(string,i,1)) not in (13,61) then
       do;
	index=1;
	/* find the index of character */
  	do while(lookup[index] ne substr(string,i,1));
		index=index+1;
	end;
	/* decrement it as array should be 0 based */
	index=index-1;
	/* get binary value of index (take only 6 digits, first two are always 00)
		and connect it to the previous ones */
	bits=compress(bits)||substr(put(index,binary8.),3);
       end;
  end;

 /* take only full numbers (8 characters) and write them to the
     output file - the rest should be used with next line */
 do while (length(bits) ge 8);
	char=input(substr(bits,1,8),$binary8.);
	put char 1.;
	bits=substr(bits,9);		
 end;
run;
%mend;



filename encoded 'c:\savedfile.txt';
filename decoded 'c:\original.xls' recfm=N;

%decodeAttachement(encoded,decoded);


libname lib_tmp "c:\";
proc sql;
create table tb_new as
select count(CIF) as count_of_cif
from lib_tmp.supra_new_bd_201108_12months t1;
quit;

