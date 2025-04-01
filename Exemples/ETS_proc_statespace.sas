/*Exemple totalement bidon utilisé pour tester la licence SAS/ETS*/
proc statespace data=sashelp.prdsale cancorr out=tb_tst; 
      var actual; 
   run;
