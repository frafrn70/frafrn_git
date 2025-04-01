options metaserver='localhost' 
metaprotocol=bridge 
metarepository="Foundation" 
		metauser='sasadm' 
		metaport=8561 
		metapass='sasadm';

/* Initialisation des param�tres pour cr�er votre biblioth�que    */
/* ces param�tres peuvent �tre centralis�s dans une table SAS */
%let repository=Foundation;
%let name=lbscript;
%let Preassigned=1;
%let Libref= lib_test;
%let DirectoryName="C:\Temp";
%let Appserv=SASMain;

/* D�but de la macro de cr�ation de la librairie*/
%macro CreateLibrary(list_var=);
/*
Pour les librairies:
	list_var= type nom path assigned libref
*/
data _null_;
  i=1;
  do while (scan("&LIST_VAR",i) ne "");
    call symput(compress('VAR_'!!i), compress(scan("&LIST_VAR",i)));
    i + 1;
  end;	 

%do i=1 to 5;
%put &var_i;
%end;

data _null_ ;
		length type id $256;
	
		/* Test l'existence �ventuel de l'objet avant de le cr�er */
		%IF &var_1="Librairie" %then %do;
			rc = metadata_resolve("omsobj:SASLibrary?@Name='&var_2'",type,id);
			call symput(test_exist,rc);
		%end;
run ;

%if &test_exist = 0 %then %do ;

data _null_ ;
		length uri uri2 $256;

		/* Cr�ation de la library */ 
		rc=metadata_newobj("SASLibrary",uri,"&var_2","&repository");
		rc=metadata_setattr(compress(uri),"Engine","BASE");
		rc=metadata_setattr(compress(uri),"IsPreassigned","&var_4");
		rc=metadata_setattr(compress(uri),"Libref","&var_5");
	
		/* Cr�ation d'un object Directory pour indiquer le chemin de stockage */
		rc=metadata_newobj("Directory",uri2,"&Libref._Directory","&repository");
		rc=metadata_setattr(compress(uri2),"DirectoryName","&var_3");

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
%put "La biblioth�que &name. est d�j� pr�sente avec identifiant" &testLibrary;
%end;

%mend CreateLibrary;
/* Fin de la macro de cr�ation de la librairie*/


/* ex�cution de la macro CreateLibrary*/


%CreateLibrary(list_var=Librairie lib222 C:\Temp 1 lib222)
