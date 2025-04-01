data tb_tst1;
col_id=1;col1="aaa";output;
col_id=2;col1="";output;
col_id=3;col1="ccc";output;
run;

/*Le IF nous permet de remplir col1 lorsque col2 n'est pas renseignée*/
data tb_tst2;
set tb_tst1;
IF col1 ne "" then output;
ELSE DO;col1="zzz"; output; END;
run;

/*Le IF nous permet de remplir une table différente lorsque col2 n'est pas renseignée*/
data tb_tst2 tb_tst3;
set tb_tst1;
IF col1 ne "" then output tb_tst2;
ELSE DO; col1="zzz"; output tb_tst3; END;
run;

	
