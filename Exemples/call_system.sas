PROC PRINTTO
LOG='/data/flf/BD1/users/sasdemo/admin/2005_01_21_Tests_Logs/log.log'
/*S'aggrandit à chaque exécution de l'étape data*/
;
run;

data toto;
FILE '/data/flf/BD1/users/sasdemo/admin/2005_01_21_Tests_Logs/messages.log';
/*Est écrasé à chaque exécution de l'étape data*/
a=1;output;
put "msg1: message pour le fichier trace";
put "msg2: message pour le fichier trace";
putlog "msglog: ceci est un message dans la log";
/*
Attention ce message va s'afficher 2 fois dans la log
	la 1ère fois parce que la log reproduit l'étape data 
	la 2nde fois parce que le putlog est exécuté
*/
run;

PROC PRINTTO
PRINT='/data/flf/BD1/users/sasdemo/admin/2005_01_21_Tests_Logs/messages2ter.log' new;
/*S'aggrandit à chaque exécution de l'étape data*/
;
run;
proc print data=toto;
title "aaa";
run;

data titi;
/*Est écrasé à chaque exécution de l'étape data*/
/*Commandes UNIX à lancer dans une session UNIX et non via Guide*/
/*
call system ("pwd");
call system ("echo 'aaa1'>>/tmp/test.log");
*/
a=1;output;
/*call system("echo 'aaa2'>>/tmp/test.log");*/
put "msg3: message pour le fichier trace";
put "msg4: message pour le fichier trace";
putlog "msglog: ceci est un message dans la log";
/*
Attention ce message va s'afficher 2 fois dans la log
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

