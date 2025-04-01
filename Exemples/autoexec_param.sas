
filename prgm "/app/essdrep/d/prgm/etl/adm";
%let vtest="sasetl1";

/******************************************************************/
/*           Fichier de Configuration des répertoires             */
/*         avec des instructions de définitions de variables 	  */
/*		concernant des répertoires			  */
/******************************************************************/
%include prgm (config_rep.sas);


/******************************************************************/
/*           Fichier de Configuration des librairies SAS9         */
/*	   qui contiendra des instructions de type LIBNAME	  */
/******************************************************************/
%include prgm (config_lib.sas);


/******************************************************************/
/*           Fichier de Configuration des variables SAS9          */
/*         avec des instructions de définitions de variables 	  */
/******************************************************************/
%include prgm (config_var.sas);

/******************************************************************/
/*           Fichier de Configuration des options SAS9            */
/*		définition d'options comme 			  */
/*		options fmtsearch=(FMTPERSO), etc...	  	  */
/******************************************************************/
%include prgm (config_opt.sas);




%let NomFichier=20060520_070;
%let DateAlim=20060520;
%let Flux=STMT;
%let MoiStat=200604;
