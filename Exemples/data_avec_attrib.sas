/*
	Attributs de col1 d�finis via attrib
	Attributs de col2 d�finis label, length, format, informat, ...
*/
data tb_tst;
attrib 
	col1 length=$12. format=$12. informat=$12. label="colonne1";

label col2="colonne2";
length col2 $12.;
format col2 $12.;
informat col2 $12.;

col1="aaa";col2="bbbbbb";
run;
