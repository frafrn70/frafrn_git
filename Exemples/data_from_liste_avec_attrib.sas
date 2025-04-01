data test_code( compress= NO label= "Table SIRT des données téléphonie journalier" ) ;
/*Faire suivre les colonnes caractère d'un $ (sinon considérée comme numérique et conflit avec la partie attrib*/
input col1_num col2_date col3_caract $;
attrib 
col1_num length=8 format=best12. informat=best12. label="col1"
col2_date length=8 format=DDMMYY10. informat=ANYDTDTE20. label="col2"
col3_caract length=$8 format=$8. informat=$8. label="col3"
/* Les valeurs de plus de 8 caractères seront tronquées => "blablabla" devient "blablabl"*/

;
DATALINES;
48 2005/23/05 blabla
48 2005/12/06 blablabla
48 2005/12/05 blabla
24 2005-23-05 blabla
24 2005-12-06 blablabla
24 2005-12-05 blabla
36 20052305 blabla
36 20051206 blablabla
;
/*
Format DDMMYYYY => ne comprend pas la 2nde ligne
48 31051999 blabla
48 20052000 blabla
*/
/*
Format YYYYDDMM => considère que c'est YYYYMMDD => ne comprend pas du tout la 1ère et interpète mal la suivante
48 20052305 blabla
48 20051206 blablabla
*/

/*
Changements de séparateurs => correctement interprété
48 2005/23/05 blabla
48 2005/12/06 blablabla
48 2005/12/05 blabla
24 2005-23-05 blabla
24 2005-12-06 blablabla
24 2005-12-05 blabla
36 20052305 blabla
36 20051206 blablabla
*/
run;
