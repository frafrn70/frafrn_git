data tb_test;
format col1 DDMMYY10.;
col1="01-Jan-06"d;col2="aaa";col3=111;output;
col1="01-Mar-06"d;col2="bbb";col3=222;output;
run;

data tb_test (index=(col1));
set tb_test;
run;


/*ou avec la proc datasets*/
proc datasets library=work;
    modify tb_test;
	index create col1 /unique;
quit;

data tb_test (index=(idx_tst=(col2 col3))); /*Marche mais écrase l'index existant*/
set tb_test;
run;
/*ou avec la proc datasets*/
proc datasets library=work; /*Marche et l'index s'ajoute*/
    modify tb_test;
	index create idx_tst=(col2 col3)/; /*la "/" se met devant UNIQUE ou NOMISS mais il ne gène pas s'il n'y a rien derrière*/
quit;


data tb_test (index=(idx_tst=(col2 col3)idx_tst2=(col1 col3))); /*Marche et crée les 2 index*/
set tb_test;
run;

proc datasets library=work; /*Supprime tous les index de la table*/
    modify tb_test;
	index delete _ALL_;
quit;
/*ou avec la proc datasets*/
proc datasets library=work; /*Marche et crée les 2 index*/
    modify tb_test;
	index create idx_tst=(col2 col3) /;
	index create col1 /unique;
quit;


proc datasets library=work; /*Supprimer l'index sur col1*/
    modify tb_test;
	index delete col1;
quit;




data tb_test (index=(month(col1))); /*Ne marche pas*/
set tb_test;
run;

