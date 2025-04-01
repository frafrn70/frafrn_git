options metaserver='localhost' 
metaprotocol=bridge 
metarepository="Foundation" 
		metauser='sasadm' 
		metaport=8561 
		metapass='sasadm';

/* Initialisation des param�tres pour cr�er votre biblioth�que    */
/* ces param�tres peuvent �tre centralis�s dans une table SAS */
%let repository=Foundation;
%let name=lib_test;
%let Preassigned=1;
%let Libref= libbatch;
%let DirectoryName="C:\Fichiers_SAS\Librairies\Librairies_Foundation\Par_Script";
%let Appserv=SASMain;

/* D�but de la macro de cr�ation de la librairie*/
%macro CreateLibrary ;
	 
data _null_ ;
		length type id $256;
	
		/* Test l'existence �ventuel de l'objet avant de le cr�er */
		rc = metadata_resolve("omsobj:SASLibrary?@Name='&name'",type,id);
		call symput("testLibrary",rc);
run ;

%if &testLibrary = 0 %then %do ;

data _null_ ;
		length uri uri2 $256;

		/* Cr�ation de la library */ 
		rc=metadata_newobj("SASLibrary",uri,"&name","&repository");
		rc=metadata_setattr(compress(uri),"Engine","BASE");
		rc=metadata_setattr(compress(uri),"IsPreassigned","&Preassigned");
		rc=metadata_setattr(compress(uri),"Libref","&Libref");
	
		/* Cr�ation d'un object Directory pour indiquer le chemin de stockage */
		rc=metadata_newobj("Directory",uri2,"&Libref._Directory","&repository");
		rc=metadata_setattr(compress(uri2),"DirectoryName",&DirectoryName);

		/* Association d'une Directory � la library */
		rc=metadata_setassn(compress(uri),"UsingPackages", "Append", compress(uri2));

		/* Association d'un ServerContext � la library */
	rc=metadata_setassn("omsobj:SASLibrary?@Name='&name'",
"DeployedComponents", 
"Append", 
"omsobj:ServerContext?@Name='&Appserv'");
run;

%put "La biblioth�que &name. a �t� cr��";
%end;
%else %do;
%put "La biblioth�que &name. est d�j� pr�sente";
%end;

%mend CreateLibrary;
/* Fin de la macro de cr�ation */

%CreateLibrary;
