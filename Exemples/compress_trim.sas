data tb_tst;
length col1 $30.;
col1=" aa    aa a ";
col_num=1;
col_tmp=compbl(col1||col_num);
col2="zzz"||compress(col1)||"zzz";/*Vire tous les blancs même ceux présents au coeur de la chaine*/
col3="zzz"||trim(col1)||"zzz";/*Vire les blancs uniquement en fin de chaine*/
col4="zzz"||compbl(col1)||"zzz";/*Laisse un seul blanc quand il y en a plusieurs mais laisse ceux en tête et en queue*/
col5a="zzz"||trim(left(col1))||"zzz";
col5b="zzz"||strip(col1)||"zzz";/*Equivalent au trim(left => vire les blancs en tête et en fin sans toucher à la chaîne intérieure*/
col6="zzz"||trim(compbl(col1))||"zzz";
run;


data tb_tst;
length col1 $30.;
col1='aa b b c bc"aa" ca ';
col_num=1;
col_tmp=compbl(col1||col_num);
col2="zzz"||compress(col1,"bc")||"zzz";/*Marche aussi avec d'autres caractères*/
col3="zzz"||trim(col1)||"zzz";/*Vire les blancs uniquement en fin de chaine*/
col4="zzz"||compbl(col1)||"zzz";/*Laisse un seul blanc quand il y en a plusieurs mais laisse ceux en tête et en queue*/
col5="zzz"||trim(compbl(col1))||"zzz";
run;
