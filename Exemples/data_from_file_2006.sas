data tb_from_file;
infile "C:\Fichiers_SAS\Fichiers_csv\f1_texte_num.csv" dsd missover dlm=";"
lrecl=5000 dsd missover end = fin /*n=5*/  firstobs=1; 

attrib val_num length=$10 informat=$10. format=$10.;
attrib val_car length=$10 informat=$10. format=$10.;

input
val_num $ val_car $
;
run;
data titi;
set tb_from_file;
new=input(val_num, 8.);
run;

