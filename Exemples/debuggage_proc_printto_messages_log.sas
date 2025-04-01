PROC PRINTTO
LOG='C:\Fichiers_SAS\Logs\log.log'
/*S'aggrandit tant que section active*/
/*Pour revenir à la normale: LOG=LOG*/
;
run;
options NOSOURCE;
data tb_tst2;
FILE 'C:\Fichiers_SAS\Logs\messages.log';
/*Est écrasé à chaque exécution de l'étape data*/
a=1;output;
put "msg1: message pour le fichier trace";
put "msg2: message pour le fichier trace";
putlog "msglog: ceci est un message dans la log";
/*
Attention si on ne met pas l'option NOSOURCE ce message va s'afficher 2 fois dans la log
	la 1ère fois parce que la log reproduit l'étape data 
	la 2nde fois parce que le putlog est exécuté
*/
run;

PROC PRINTTO
PRINT='C:\Fichiers_SAS\Logs\messages2ter.log' new;
/*S'aggrandit à chaque exécution de l'étape data*/
;
run;
proc print data=tb_tst2;
title "aaa";
run;

data tb_tst1;
/*Est écrasé à chaque exécution de l'étape data*/
/*Commandes UNIX à lancer dans une session UNIX et non via Guide*/
/*
call system ("pwd");
call system ("echo 'aaa1'>>/tmp/test.log");
*/
a=1;output;b="aaa";c="zzzz";
/*call system("echo 'aaa2'>>/tmp/test.log");*/
put a=;/*Ecrit "a=" puis la valeur du champ*/ 
put "msg3: message pour le fichier trace";
put "msg4: message pour le fichier trace";
put _all_;/*Affiche les valeurs de tous les champs, de _n_ et de _error_	*/
put _user_;/*Affiche les valeurs les variables globales et leurs valeurs (ne donne rien ici) */
putlog "msglog: ceci est un message dans la log";

/*
Attention si on ne met pas l'option NOSOURCE ce message va s'afficher 2 fois dans la log
	la 1ère fois parce que la log reproduit l'étape data
	la 2nde fois parce que le putlog est exécuté
*/
run;

data tutu;
/*Est écrasé à chaque exécution de l'étape data*/
a=1;output;
put "msg5: message pour le fichier trace";
put "msg6: message pour le fichier trace";
putlog "msglog: ceci est un message dans la log";
/*
Attention ce message va s'afficher 2 fois dans la log
	la 1ère fois parce que la log reproduit l'étape data 
	la 2nde fois parce que le putlog est exécuté
*/
run;

