yyy
/*
	Dans ce cas on veut r�cup�rer une valeur dans tb_tst2 si l'identifiant existe dans tb_tst1 sinon
*/

data tb_tst1;
col_id="id3";col_val="val_3a";output; /*Valeur de col_id absente de tb_tst2 => on veut r�cup�rer cette valeur pour col_val*/
col_id="id1";col_val="val_1a";output;
col_id="id2";col_val="val_2a";output; 

run;

data tb_tst2;
col_id="id2";col_val="val_2b";output; /*Valeur de col_val diff�rente de tb_tst1 => on veut r�cup�rer cette valeur*/
col_id="id1";col_val="val_1b";output; /*Valeur de col_val diff�rente de tb_tst1 => on veut r�cup�rer cette valeur*/
run;

/*
Attention, le merge ne fait pas exactement la m�me chose qu'une jointure
Pour que cela marche bien il ne faut pas que l'on ait plusieurs fois le m�me col_id dans les 2 tables
*/

/*Tris n�cessaires pour que le merge se fasse*/
proc sort data=tb_tst1;by col_id;run;
proc sort data=tb_tst2;by col_id;run;


data tb_tst3 (drop=_:);
merge 
	tb_tst1(in=t1 rename=(col_val=_col_valt1)) 
	tb_tst2(in=t2 rename=(col_val=_col_valt2)) ;
by 
	col_id;
if
	t2 /*Identifiant pr�sent dans t2 seulement ou dans les 2 tables => on prend la valeur de la 2nde*/
then do;
	col_val=_col_valt2; output; end;
else 
if 
	t1 
	/*Identifiant pr�sent dans t1 seulement  => on prend la valeur de t1
	  Le if-then est facultatif mais rend le code plus clair*/
then do;
	col_val=_col_valt1; output; 
end;
run;

proc sql;
create table tb_tst4 as
select 
t1.col_id, 
(case t2.col_val when  '' then t1.col_val else t2.col_val end) as valeur
from 
tb_tst1 t1 LEFT join tb_tst2 t2 on t1.col_id=t2.col_id;
quit;




