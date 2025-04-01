/*Exemple 1*/
filename tstfic 
"C:\Fichiers_SAS\Fichiers_sortie\resultat.log";

data tb_tst;
col1="aaa";output;
col1="bbb";output;
run;

data _null_;
file tstfic;
set tb_tst;
put col1 "zzz";
put "111";
run;


/*Exemple 2*/
data tmp;
col1=10; col2="c";col3="zzz"; separ=';';output;
run;
data _null_;
file '/tmp/Liste_colonnes.txt' ;
set tmp;
/*
Ou bien affectation des variables directement si on ne se base pas sur une table
col1=10; col2="c";col3="zzz"; separ=';';
*/
put col1 separ col2 separ col3;
run ;
