filename file_f1 "C:\Fichiers_SAS\Fichiers_entrée\Rep Test\tst1.txt";
filename file_rep "C:\Fichiers_SAS\Fichiers_entrée\Rep Test";

data 
	tb_structure;
infile
	file_rep(fichier_structure.txt) obs=3;
/*
options obs pour limiter le chargement le temps de valider le format
*/
input
	col1 $ 1-5 col2 6-11 col3 $ 12-20 col4 21-22;
	/*
	On précise "$" pour les champs caractères
	Attention, pour le dernier champ il faut des espaces jusqu'au 20ème caractère pour que cela passe
	Par exemple, il faut la ligne suivante "aaa  123   xxx      " et non "aaa  123   xxx"
	*/
	/*Utilisation d'un IF*/
	IF col2 ne . ;col5=col4+col2; /*IF sans le THEN => on ne lit pas la ligne sinon*/
	/*IF col2 ne . then col5=col4+col2; else col5=col4;*/
	/*IF THEN ELSE on traite toutes les lignes*/
	/*Calcul d'une nouvelle colonne à partir de celles du fichier*/
run; 

/*
Export de la table dans un fichier
*/
data _null_;
set tb_structure;
file file_rep(fichier_structure_out.txt);
put
	col1 $ 1-5 col2 6-11 col3 $ 12-20 col4 21-22;
run;


/*
Anciens tests
*/
data tmp_tst2;
infile "/data/flf/MC6/incft/DRC/DATA_JOURNALIER.csv.old" dsd missover dlm="|"
lrecl=5000 dsd missover end = fin /*n=5*/  firstobs=2; 
/*dsd fait que les valeurs non renseignées dans le fichier sont prises en compte*/
attrib RowID length=8 informat=best12. format=best12.;
attrib date_appel length=8 informat=ANYDTDTE20. format=DDMMYY10.;
attrib debutPeriode length=$8 informat=$8. format=$8.;
attrib des_entite length=$50 informat=$50. format=$50.;
attrib des_niveau length=$50 informat=$50. format=$50.;
attrib des_produit length=$50 informat=$50. format=$50.;
attrib des_segment length=$50 informat=$50. format=$50.;
attrib des_parc length=$100 informat=$100. format=$100.;
attrib code_parc length=$100 informat=$100. format=$100.;
attrib des_site length=$100 informat=$100. format=$100.;
attrib centreDir length=$100 informat=$100. format=$100.;
attrib typeCentreDir length=$50 informat=$50. format=$50.;
attrib deborde length=8 informat=best12. format=best12.;
attrib p_front_he length=8 informat=best12. format=best12.;
attrib p_front_e length=8 informat=best12. format=best12.;
attrib p_deb1_local length=8 informat=best12. format=best12.;
attrib p_deb1_SEAD length=8 informat=best12. format=best12.;
attrib p_deb1_solidaire length=8 informat=best12. format=best12.;
attrib p_deb1_bis length=8 informat=best12. format=best12.;
attrib p_deb2 length=8 informat=best12. format=best12.;
attrib p_deb2_sead length=8 informat=best12. format=best12.;
attrib t_front_he length=8 informat=best12. format=best12.;
attrib t_front_e length=8 informat=best12. format=best12.;
attrib f_t_2 length=8 informat=best12. format=best12.;
attrib f_t_4 length=8 informat=best12. format=best12.;
attrib f_t_6 length=8 informat=best12. format=best12.;
attrib f_t_8 length=8 informat=best12. format=best12.;
attrib f_t_10 length=8 informat=best12. format=best12.;
attrib f_t_12 length=8 informat=best12. format=best12.;
attrib f_t_14 length=8 informat=best12. format=best12.;
attrib f_t_16 length=8 informat=best12. format=best12.;
attrib f_t_18 length=8 informat=best12. format=best12.;
attrib f_t_20 length=8 informat=best12. format=best12.;
attrib a_front length=8 informat=best12. format=best12.;
attrib a_deb1_local length=8 informat=best12. format=best12.;
attrib a_deb1_SEAD length=8 informat=best12. format=best12.;
attrib a_deb1_solidaire length=8 informat=best12. format=best12.;
attrib a_deb2 length=8 informat=best12. format=best12.;
attrib a_deb2_sead length=8 informat=best12. format=best12.;
attrib al_front length=8 informat=best12. format=best12.;
attrib dureeConvFront length=4 informat=best12. format=best12.;
attrib dureeLog_f length=4 informat=best12. format=best12.;
attrib dureeTotaleConv_f length=4 informat=best12. format=best12.;
attrib dureeNotReady_f length=4 informat=best12. format=best12.;
attrib delaiRepFront length=8 informat=best12. format=best12.;
attrib dureeAvtAbFront length=8 informat=best12. format=best12.;
attrib traiteAgent_f length=8 informat=best12. format=best12.;
attrib dissuade_f length=8 informat=best12. format=best12.;
attrib semaine length=$15 informat=$15. format=$15.;
attrib mois length=$10 informat=$10. format=$10.;
attrib jourSem length=$10 informat=$10. format=$10.;
attrib horaire length=$5 informat=$5. format=$5.;
attrib type_site length=$25 informat=$25. format=$25.;
attrib typeCDN length=$25 informat=$25. format=$25.;
attrib code_type length=$25 informat=$25. format=$25.;
attrib code_centre length=$25 informat=$25. format=$25.;
attrib TR20cible length=5 informat=best12. format=best12.;
attrib traite_front length=4 informat=best12. format=best12.;
attrib presente_parc length=4 informat=best12. format=best12.;
attrib appels_debordes length=4 informat=best12. format=best12.;
attrib traite_m20_front length=4 informat=best12. format=best12.;
attrib abandons_courts length=8 informat=best12. format=best12.;
attrib jour_ferie length=$10 informat=$10. format=$10.;

input
RowID  date_appel debutPeriode  des_entite  des_niveau  des_produit 
des_segment  des_parc  code_parc  des_site  centreDir  typeCentreDir  
deborde  p_front_he  p_front_e  p_deb1_local  p_deb1_SEAD  p_deb1_solidaire  p_deb1_bis
p_deb2  p_deb2_sead  t_front_he  t_front_e  f_t_2  f_t_4  f_t_6  f_t_8  f_t_10  f_t_12
f_t_14  f_t_16  f_t_18  f_t_20  a_front  a_deb1_local  a_deb1_SEAD  a_deb1_solidaire  
a_deb2  a_deb2_sead  al_front  dureeConvFront  dureeLog_f  dureeTotaleConv_f  dureeNotReady_f  
delaiRepFront  dureeAvtAbFront  traiteAgent_f  dissuade_f  semaine  mois  jourSem  
horaire  type_site  typeCDN  code_type  code_centre  TR20cible  traite_front  
presente_parc  appels_debordes  traite_m20_front  abandons_courts  jour_ferie ;
/* le même input avec distinction numérique ou non mais cela ne semble pas indispensable */
/* RowID  date_appel debutPeriode $ des_entite $ des_niveau $ des_produit $
des_segment $ des_parc $ code_parc $ des_site $ centreDir $ typeCentreDir $ 
deborde  p_front_he  p_front_e  p_deb1_local  p_deb1_SEAD  p_deb1_solidaire  p_deb1_bis
p_deb2  p_deb2_sead  t_front_he  t_front_e  f_t_2  f_t_4  f_t_6  f_t_8  f_t_10  f_t_12
f_t_14  f_t_16  f_t_18  f_t_20  a_front  a_deb1_local  a_deb1_SEAD  a_deb1_solidaire  
a_deb2  a_deb2_sead  al_front  dureeConvFront  dureeLog_f  dureeTotaleConv_f  dureeNotReady_f  
delaiRepFront  dureeAvtAbFront  traiteAgent_f  dissuade_f  semaine $ mois $ jourSem $ 
horaire $ type_site $ typeCDN $ code_type $ code_centre $ TR20cible  traite_front  
presente_parc  appels_debordes  traite_m20_front  abandons_courts  jour_ferie $;*/
run;
