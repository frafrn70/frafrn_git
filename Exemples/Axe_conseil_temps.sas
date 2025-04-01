data &_output;
set &syslast;

Nb_ventes_declarees=1;
If INDICOM_VENTE_REALISE ="O" then Nb_Ventes_realisees = 1;
else Nb_Ventes_realisees = 0;

run;

run;

Data result;
set intit;
by Csl;
retain compt 0;
if first.csl then  compt=1;
else compt=compt+1;
id_=compress(csl !!"_"!!compt);
run;
