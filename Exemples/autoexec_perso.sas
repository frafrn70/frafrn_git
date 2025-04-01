/*Librairies utilisées dans le 1er environnement*/
libname libC11 "C:\Fichiers_SAS\Librairies\Librairies_Custom1\LibC1_1";
libname libC12 "C:\Fichiers_SAS\Librairies\Librairies_Custom1\LibC1_2";
libname libC21 "C:\Fichiers_SAS\Librairies\Librairies_Custom2\LibC2_1";
libname libC22 "C:\Fichiers_SAS\Librairies\Librairies_Custom2\LibC2_2";

libname libF1 "C:\Fichiers_SAS\Librairies\Librairies_Foundation\LibF1";
libname libF2 "C:\Fichiers_SAS\Librairies\Librairies_Foundation\LibF2";

libname lib_spde spde
	'C:\Fichiers_SAS\LIB_SPDE\Meta_SPDE'
 	metapath=
			(
	'C:\Fichiers_SAS\LIB_SPDE\Meta_SPDE'
			)
   datapath=
			(
	'C:\Fichiers_SAS\LIB_SPDE\Data_001'
	'C:\Fichiers_SAS\LIB_SPDE\Data_002'
	'C:\Fichiers_SAS\LIB_SPDE\Data_003'
	'C:\Fichiers_SAS\LIB_SPDE\Data_004'
			)
   indexpath=
			(
	'C:\Fichiers_SAS\LIB_SPDE\Index001'
	'C:\Fichiers_SAS\LIB_SPDE\Index002'
			)
	PARTSIZE=32  
;

/*Librairies de tables créées pour les interventions*/
LIBNAME LIBINTER "C:\Fichiers_SAS\Librairies\Tmp_Interventions";

/*Librairies de tables créées pour tester les produits*/
libname libprod "C:\Fichiers_SAS\Librairies\Test_Produits";

libname lib_tst "C:\Fichiers_SAS\Librairies\Exemples";

libname lib_mac "C:\Fichiers_SAS\Macros";

libname lib_fmt "C:\Fichiers_SAS\Formats";


/*libname libfrn "C:\Documents and Settings\frafrn\Mes documents\Franck\Interventions\00_En cours\2006\2006_06a_Schneider\Vérifications SER\Lib_Win";*/

options mstored sasmstore=lib_mac;
options FMTSEARCH=(lib_fmt);
