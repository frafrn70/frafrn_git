data toto;
set lib_ora.exemple (obs=1);
run;
/*Faire une requête à la souris pour voir le code*/

data titi;
set toto
(where=(
date="1Jun2005:0:0:0"dt));
run;

