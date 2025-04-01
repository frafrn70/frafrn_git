/*Format à partir d'une table*/
data table_bis;
	start="O";end="O";label="oui";fmtname="blbis";type="C";output;
	start="N";end="N";label="non";fmtname="blbis";type="C";output;
	;
run;
/*
Si on crée le format à partir d'une table et qu'il est numérique
il n'est pas possible d'ajouter "Other" à cette table
Pour cela on ajoute un enregistrement sans START ni END mais avec un champ "HLO" renseigné à "O"*/
proc format cntlin=table_bis;run;

%macro mac_tst(var_num=, var_char=);

data tb_tst;
col_num=&var_num;
col_char=&var_char;
run;

%mend;

data tb_tmp;
tmp_num=111;tmp_char="table_bis";output;
run;

data tb_tmp2;
set tb_tmp;
	to_run='proc format cntlin='||tmp_char||';run;';
	call execute('proc format cntlin='||tmp_char||';run;');

run;
