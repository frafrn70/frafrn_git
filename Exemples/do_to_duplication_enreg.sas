libname libF1 "C:\Fichiers_SAS\Librairies\Librairies_Foundation\LibF1";

data libF1.prdsale_F1_fat;set sashelp.prdsale;col_verif="F1_fat";do i=1 to 1000;output;end;run;
