data tb_tst_1;
	col1="zzz"; col2=111; output;	col1="bbb"; col2=999; output;	col1="aaa"; col2=222; output;
run;
proc sort data=tb_tst_1; by col1; run;

data tb_tst_2;
	col1="www"; col2=222; output;	col1="bbb"; col2=888; output; col1="bbb"; col2=333; output;
run;
proc sort data=tb_tst_2; by col1; run;

data tb_tst_2;
	update tb_tst_1 tb_tst_2;
	by col1; /*Ajoute les enregistrements de tb_tst_1 sauf si identifiant dejà existant*/ 
run;
