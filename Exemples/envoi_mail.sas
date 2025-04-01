data tb_tst;
col1="aaa";col2=111;
run;

filename mel  email to="frafrn@fra.sas.com"
              subject="Compte-rendu d''importation des tables Oracle "
              attach="C:\Tmp\test.html" type="text/html";


ods html file="C:\Tmp\test.html";
options byline;

proc print data=tb_tst noobs label;
 title "Compte rendu  general du traitement d importation des tables Oracle dans le systeme SAS";

run;

options byline;

ods html close;
ods listing;

Data _null_;
 file mel;
Put " Rapport import des tables Oracle :" ;
put ;
put " -------------------------------------------";
put "Le detail fichier HTML joint";
run;

