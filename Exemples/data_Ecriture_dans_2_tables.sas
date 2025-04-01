data tb_tst1;
col_id=1;col_val1="aaa";col_val2="zzz";output;
col_id=2;col_val1="bbb";col_val2="yyy";output;
col_id=3;col_val1="ccc";col_val2="xxx";output;
col_id=4;col_val1="ccc";col_val2="www";output;
run;

data tb_tst2 tb_tst3;
set tb_tst1;
IF
	col_id<3 
then
	output tb_tst2;
else
	output tb_tst3;
run;
