/*
Comment faire les 2 index en m�me temps?
Si je mets les 2 seul le 2nd est pris en compte
*/
data tb_tst_idx
(
	/*index=(idx_key=(col1 col2) /unique, (col3=(col3)))*/ /*=> Erreur*/
	/*index=(idx_key=(col1 col2) /unique (col3=(col3)))*/ /*=> Erreur*/
	/*index=(idx_key=(col1 col2)) index=(idx_col3=(col3))*/ /*=> seul le 2nd est pris*/
index=(idx_key=(col1 col2)/unique col3=(col3)) /*=> OK */

);
format 
	col1=1;col2=1;col3="1aaa";output;
	col1=1;col2=2;col3="2aaa";output;
	col1=2;col2=1;col3="3aaa";output;
run;

/*G�n�re une erreur � cause de la contrainte*/
proc sql undo_policy=required;
insert into tb_tst_idx(col1, col2, col3) values (1, 1, "bbb");
quit;

/*N'insert pas la ligne mais ne g�n�re pas d'erreur*/
proc sql undo_policy=none;
insert into tb_tst_idx(col1, col2, col3) values (1, 1, "bbb");
quit;


/*Plante � cause de la cl� col1-col2 en double */
data tb_tst2(index=(idx_key=(col1 col2) /unique) index=(col3=(col3) /NOMISS));  
	col1=1;col2=1;col3="1aaa";output;
	col1=1;col2=1;col3="1aaa";output;
	col1=1;col2=2;col3="2aaa";output;
	col1=2;col2=1;col3="3aaa";output;
run;

/*??? Ne plante pas malgr� col3 � vide*/
/*mais l'enregistrements n'est pas cr��*/

data tb_tst3(index=(idx_key=(col1 col2) /unique) index=(col3=(col3) /NOMISS));  
	col1=1;col2=1;col3=1;output;
	col1=1;col2=2;col3=.;output;
	col1=1;col2=3;col3=3;output;
	col1=2;col2=1;col3=4;output;
run;
