options metaserver='localhost' 
metaprotocol=bridge 
metarepository="Foundation" 
		metauser='sasadm' 
		metaport=8561 
		metapass='sasadm';

/* Initialisation des paramètres pour créer votre bibliothèque    */
/* ces paramètres peuvent être centralisés dans une table SAS */
%let repository=Foundation;
%let name=lib_test;
%let Preassigned=1;
%let Libref= libbatch;
%let DirectoryName="C:\Fichiers_SAS\Librairies\Librairies_Foundation\Par_Script";
%let Appserv=SASMain;

/* Début de la macro de création de la librairie*/
%macro CreateLibrary ;
	 
data _null_ ;
		length type id $256;
	
		/* Test l'existence éventuel de l'objet avant de le créer */
		rc = metadata_resolve("omsobj:SASLibrary?@Name='&name'",type,id);
		call symput("testLibrary",rc);
run ;

%if &testLibrary = 0 %then %do ;

data _null_ ;
		length uri uri2 $256;

		/* Création de la library */ 
		rc=metadata_newobj("SASLibrary",uri,"&name","&repository");
		rc=metadata_setattr(compress(uri),"Engine","BASE");
		rc=metadata_setattr(compress(uri),"IsPreassigned","&Preassigned");
		rc=metadata_setattr(compress(uri),"Libref","&Libref");
	
		/* Création d'un object Directory pour indiquer le chemin de stockage */
		rc=metadata_newobj("Directory",uri2,"&Libref._Directory","&repository");
		rc=metadata_setattr(compress(uri2),"DirectoryName",&DirectoryName);

		/* Association d'une Directory à la library */
		rc=metadata_setassn(compress(uri),"UsingPackages", "Append", compress(uri2));

		/* Association d'un ServerContext à la library */
	rc=metadata_setassn("omsobj:SASLibrary?@Name='&name'",
"DeployedComponents", 
"Append", 
"omsobj:ServerContext?@Name='&Appserv'");
run;

%put "La bibliothèque &name. a été créé";
%end;
%else %do;
%put "La bibliothèque &name. est déjà présente";
%end;

%mend CreateLibrary;
/* Fin de la macro de création */

%CreateLibrary;
