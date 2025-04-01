data TB_TST; 
format col1 $10.;
col1="bbb";
	col2=3; output;
	col2=4; output;
col1="aaa";
	col2=1; output;
	col2=2; output;
col1="ccc";
	col2=5; output;
	col2=6; output;
run;

proc sort data=tb_tst;
by col1;run;

data tb2;
set tb_tst;
by col1;
retain compt ; /*Le 0 n'est pas forcément nécessaire*/
if first.col1 then  compt=col2;
else compt=compt+col2;
if last.col1 then  do;col2=compt;output;end;
run;



