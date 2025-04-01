data TB_TST; 
format col1 $10.;
col1="bbb";
	col2=3; output;
	col2=4; output;
	col2=5; output;
col1="aaa";
	col2=1; output;
	col2=2; output;
col1="ccc";
	col2=6; output;
	col2=7; output;
	col2=8; output;
	col2=9; output;
col1="ddd";
	col2=10; output;
col1="eee";
	col2=11; output;
run;

proc sort data=tb_tst;
by col1;run;

data tb2(keep=col1 compt);
set tb_tst;
by col1;
retain compt ; /*Le 0 n'est pas forcément nécessaire*/
if first.col1 then  compt=col2;
else compt=compt+col2;
if last.col1 then  do;col2=compt;output;end;
run;


data tb_doubles tb_simples tb_full(keep=col1 compt);
set tb_tst;
by col1;
retain compt 0;
	if first.col1 then  compt=1;
	else compt=compt+1;
if last.col1 then  do;
		if compt=1 then do; 
			output tb_simples tb_full;
		end;
		else do; 
			output tb_doubles tb_full;
		end;
end;
run;

