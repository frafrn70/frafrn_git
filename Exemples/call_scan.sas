data artists;
   input string $60.;
   drop string;
   do i=1 to 99;
      call scan(string, i, position, length);
      if not position then leave;
      Name=substrn(string, position, length);
      output;
   end;
   datalines;
Picasso Toulouse-Lautrec Turner "Van Gogh" Velazquez
;

/*
--------------------------------------------------------------------------------
 
Syntax 
CALL SCAN(string, n, position, length <,delimiters>);  


Arguments


string 
specifies a character constant, variable, or expression.

n 
is a numeric constant, variable, or expression that specifies the number of the word in the character string that you want the CALL SCAN routine to select. The following rules apply: 

If n is positive, CALL SCAN counts words from left to right. 

If n is negative, CALL SCAN counts words from right to left. 

If n is zero, or |n| is greater than the number of words in the character string, CALL SCAN returns a position and length of zero. 

position 
specifies a numeric variable in which the position of the word is returned. 

length 
specifies a numeric variable in which the length of the word is returned. 

delimiters 
is a character constant, variable, or expression that specifies the characters that you want CALL SCAN to use to separate words in the character string. 

*/

