data tb_tst;
	col1="aaa";col2="bbb";output;
	col1="ccc";col2="ddd";output;
	col1="eee";col2="fff";output;

run;

/*
attrn permet d'obtenir certaines informations concernant une table
Le 2nd argument est un mot clé. La liste des mots-clés est fournie par l'aide
*/
data tb_tst2 (drop=_:);
	_dsid = open('tb_tst');
	col_nobs=attrn(_dsid,'NOBS');
run;

	
/*On peut l'utiliser aussi pour initaliser une variable (à revoir)*/
data _null_;
  dsid = open('tb_tst');
  call symput('NB_LIB', NBOBS=attrn(dsid,'NOBS'));
  dsid = close(dsid);
  put NB_LIB;
run;

