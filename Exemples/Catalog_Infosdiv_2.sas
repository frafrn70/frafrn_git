/*Répertoire contenant le catalogue*/
libname cata_rep "/data/flf/MC6/users/admin/FNI/work/2005_12_08_Droits_OLAP_Automatiques/catalogue";

/*Répertoire d'une partie du catalogue*/
proc catalog catalog=cata_rep.pgm;
contents 
out=tmp_cata 
file=tmp;
run;

data toto;
col1=a;
run;

