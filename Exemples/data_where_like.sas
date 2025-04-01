data tb_tst;
col1="abcdef";col2=1;output;
col1="abcdef";col2=2;output;
col1="zabcdef";col2=3;output;
col1="zabcdef";col2=4;output;
col1="zzbcdef";col2=4;output;
run;

data tb_tst2;
set tb_tst (where=(not(col1 like "%a%")));
run;

data tb_tst3;
set tb_tst (where=(col1 like "a%"));
run;
