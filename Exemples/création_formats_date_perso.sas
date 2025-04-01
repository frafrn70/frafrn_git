/*
Création de 2 formats:
	1 format où tous les jours prennent la même valeur passée en dur
	1 format où tous les jours prennent la valeur du semestre
*/

data tb_fm_dt_semestre;
infile "C:\tmp\semestre.csv" dsd missover dlm=";"
/*
Le fichier contient uniquement
	semestre
	2006S4
*/
lrecl=5000 dsd missover end = fin firstobs=2; 
attrib label length=$6 informat=$6. format=$6.;
input label  $;
do start=today()-1000 to today()+1000;
end=start;
format="N";fmtname="fm_dt_semestre";
output;
end;
run;

data tb_fm_dt_regle;
/*format start ddmmyy10.;*/
format="N";fmtname="fm_dt_regle";
do start=today()-1000 to today()+1000;
label=compress(year(start)||"T"||qtr(start));
end=start;
output;
end;
run;

proc format 
cntlin=tb_fm_dt_regle;
run;
proc format 
cntlin=tb_fm_dt_semestre;
run;


options fmtsearch=(work);

data toto;
col=today();
col2=put(col,fm_dt_regle.); 
col3=put(col,fm_dt_semestre.);
output;
run;
