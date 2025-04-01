PROC PRINTTO
LOG='/data/flf/BD1/users/sasdemo/admin/2005_01_21_Tests_Logs/log.log'
/*S'aggrandit � chaque ex�cution de l'�tape data*/
;
run;

data toto;
FILE '/data/flf/BD1/users/sasdemo/admin/2005_01_21_Tests_Logs/messages.log';
/*Est �cras� � chaque ex�cution de l'�tape data*/
a=1;output;
put "msg1: message pour le fichier trace";
put "msg2: message pour le fichier trace";
putlog "msglog: ceci est un message dans la log";
/*
Attention ce message va s'afficher 2 fois dans la log
	la 1�re fois parce que la log reproduit l'�tape data 
	la 2nde fois parce que le putlog est ex�cut�
*/
run;

PROC PRINTTO
PRINT='/data/flf/BD1/users/sasdemo/admin/2005_01_21_Tests_Logs/messages2ter.log' new;
/*S'aggrandit � chaque ex�cution de l'�tape data*/
;
run;
proc print data=toto;
title "aaa";
run;

data titi;
/*Est �cras� � chaque ex�cution de l'�tape data*/
/*Commandes UNIX � lancer dans une session UNIX et non via Guide*/
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
	la 1�re fois parce que la log reproduit l'�tape data
	la 2nde fois parce que le putlog est ex�cut�
*/
run;

data tutu;
/*Est �cras� � chaque ex�cution de l'�tape data*/
a=1;output;
put "msg5: message pour le fichier trace";
put "msg6: message pour le fichier trace";
putlog "msglog: ceci est un message dans la log";
/*
Attention ce message va s'afficher 2 fois dans la log
	la 1�re fois parce que la log reproduit l'�tape data 
	la 2nde fois parce que le putlog est ex�cut�
*/
run;

