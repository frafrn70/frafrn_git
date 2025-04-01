/*Librairies cr��es pour les besoins du test Windows*/
libname libtemp
"C:\Documents and Settings\frafrn\Mes documents\Franck\Interventions\Inter_Save_Tmp\00_En cours\2007\2007_05_Banque Postale\Scripts batches\Traitements_d�finitifs\AIX_v1 Batches corrig�s\Verif_Windows\temp";
libname libtarg
"C:\Documents and Settings\frafrn\Mes documents\Franck\Interventions\Inter_Save_Tmp\00_En cours\2007\2007_05_Banque Postale\Scripts batches\Traitements_d�finitifs\AIX_v1 Batches corrig�s\Verif_Windows\targ";


options NOQUOTELENMAX;
/*Variables de comptage des requ�tes au total, OK oou KO*/
%global TOTAL OK KO;
%LET TOTAL=0;%LET OK=0;%LET KO=0;


/*Macro d'ex�cution d'une requ�te (pass�e en param�tre*/
%macro lance_req(var_code=);


data _null_;
call execute ("proc sql;connect to db2 (datasrc=");
call execute ("&DB_NAME");
%put "Connexion";
%put &DB_NAME;
call execute (" user=");
call execute ("&DB_USER");
call execute (" password=");
call execute ("&DB_PWD");
call execute (" schema=");
call execute ("&DB_PROP_DWH");
call execute ("); create table ");
call execute ("&var_targ");
call execute (".");
call execute ("&var_tab");
call execute (" as select * from connection to db2 (");
call execute ("&var_req");

/*%do j=1 %to &i;*/
%do j=1 %to &i;
/*  call execute ("&&var_req&j");*/
    call execute ("&&var_req&j");
%end;

call execute ("); disconnect from db2; quit;");
run;

%LET TOTAL=%eval(&TOTAL+1);
/*Traitement des requ�tes en erreur*/
%IF &sqlrc ne 0
    %THEN %DO;
        %LET KO=%eval(&KO+1) ;/*Mise � jour du compteur*/
        data tb_tmp;
        /*format col_tab $124.;*/
        format col_req $3000.;

        /*Modification pour traitement des cha�nes longues*/
        /*
        col_tab="&var_tab";
        col_req="&var_req_orig";output;
        */
        /*
        %put &var_tab;%put &var_req_orig;
        %let var_req_orig=|&var_req_orig;
        */
        /*%let var_col_req=%sysfunc(substr(&var_col_req,2,length(&var_col_req)-1));*/
        /*%let var_col_req=%sysfunc(compress("&var_col_req",'"'));*/

        /*col_req=&var_tab"|"&var_req_orig;output;*/
        /*col_req=compress("&var_col_req",'"');*//*col_req=substr(col_req,2,length(col_req)-1);*/
        col_req="&&var_req_recup";
        output;
%put "zzzV�rif";
        %do j=1 %to &i;
            col_req="&&orig_var_req&j";output;
        %end;


        run;
        proc append base=tb_err data=tb_tmp;/*Ajout de la requ�te dans une table*/
        run;
    %END;
    %ELSE %LET OK=%eval(&OK+1) ;

%Mend;

/*%put &var_req;*/
%GLOBAL var_req;
%GLOBAL var_req_orig;


/*Macro de traitement d'un fichier de requ�te*/
/*
Les librairies utilis�es seront d�finies dans un fichier autoexec (sp�cifique ou non)
Il serait pr�f�rable d'avoir une librairie par type de requ�te pour que les "m�nages" soient distincts
Le m�nage du fichier sera plus simple � faire dans le fichier sh
*/
/*
var_file:
    fichier qui contiendra les requ�tes
var_rep:
    r�pertoire qui contiendra var_file
var_temps:
    valeur utilis�e pour les filtres de temps la valeur par d�faut sera positionn� par le script sh de lancement
var_mode:
    valeur indiquant si on charge l'ensemble des requ�tes ou une partie seulement (cas de reprise)
var_lib:
    librairie qui contiendra les tables temporaires
    on aura une librairie par type de fichier pour que le m�nage de l'une n'impacte pas les autres
    les librairies pourront �tre d�finies par un fichier autoexec sp�cifique (apr�s cr�ation du r�pertoire correspondant)
*/
%macro mac_lecture_fichier(var_file=,var_rep=,var_temps=, var_mode=, var_targ=);


%IF %sysfunc(UPCASE(&var_temps))='DEFAULT'
%then %DO;
    %LET var_temps=%sysfunc(compress("current date - day(current date) DAY",'"'));
    /*%LET var_temps=%sysfunc(compress(&var_temps,'"'));*/
        %put "wwwwwwww";
    %put &var_temps;

%END;
proc datasets library=work;
    delete TB_TMP TB_ERR;
quit;


/*Retir� car risque de m�nage non souhait� si erreur dans le param�tre &var_tag*/
/*Remplac� par un move lors de l'�criture dans la librairie d�finitive*/
/*
%IF "&var_mode"="init"
%THEN %DO;
proc datasets library=&var_targ kill;
    quit;
%END;
*/

/*%let rc=%sysfunc(filename(filreq,"C:\Temp\req_avec_filtre_prs.csv"));*/
%let rc=%sysfunc(filename(filreq,"&var_rep&var_file"));
%put "fichier lu";
%put "&var_rep&var_file";
%let fid=%sysfunc(fopen(&filreq));

%if &fid > 0 %then
   %do %while(%sysfunc(fread(&fid)) = 0);
      %let i=0;
      %let rc=%sysfunc(fget(&fid,var_req,450));

      %put "Ligne fichier";
      %put &var_req;
      %LET var_req_recup=&var_req;
/*
      %let var_req="&var_req";
      %put "0000c";
      %put &var_req;

      %let var_req3=%sysfunc(compress(%sysfunc(scan(&var_req, 1, '|')),'"'));
      */
      %let var_tab=%sysfunc(scan("&var_req", 1, "|"));
      /*%let var_tab_orig=%sysfunc(substr(1,%sysfunc(index("&var_req", "|"))));*/


%let var_req_orig=%sysfunc(scan("&var_req", 2, "|"));

      %put "Requ�te Fichier";
      %put &var_req_orig;
      %put "Pr�sence @";
      %put %sysfunc(count("&var_req_orig",@));
/*D�but traitement des cha�nes longues*/
%let var_req=%sysfunc(compress("&var_req_orig",'@'));
%let var_req=%sysfunc(compress(&var_req,'"'));
%put "Requ�te OK";
%put &var_req;
%let var_req_tmp=&var_req_orig;
%do %while(%sysfunc(count("&var_req_tmp",@)) ne 0);
      %let i=%eval(&i+1);
      %let rc=%sysfunc(fread(&fid));
      %let rc=%sysfunc(fget(&fid,var_req&i,450));
      %let orig_var_req&i=&&var_req&i;/*N�cessaire pour garder la version avec"@" en cas d'�chec et la rejouer*/
      %let var_req_tmp=&&var_req&i;
      %put "Requ�te temporaire";
      %put &var_req_tmp;
      %put "Ligne fichier allong�e n�"&i;
      %put &&var_req&i;
      %put "&&var_req&i";
      /*%let var_req&i=%sysfunc(compress("&&var_req&i",@));*/
      %If
            %sysfunc(count("&var_req_tmp",@)) ne 0
      %THEN
            %LET var_req&i=%sysfunc(compress("&&var_req&i", @));
            /*%LET var_req&i=%sysfunc(substr("&&var_req&i", 1,length("&&var_req&i")-1));*/

      %put "V1: Ligne fichier allong�e sans @ n�"&i;
      %put &&var_req&i;
      %put "&&var_req&i";
      /*%let var_req&i=%sysfunc(compress(&&var_req&i,'"'));*/
      %put "V2: Ligne fichier allong�e sans @ n�"&i;
      %put &&var_req&i;

%end;

/*Fin traitement des cha�nes longues*/
/*%let var_req="&var_req_orig";*//*Inutile dans le cas de cha�nes longues*/

      %put "Requ�te utilis�e";
      %put &var_req;

/*         %LET var_req="proc sql;create table "||scan(&var_req,1,"|")||" as "||scan(&var_req,2,"|");*/
/*
      %LET var_req=
                        %sysfunc
                                (
                                        compress
(
'proc sql;connect to db2 (datasrc=' &DB_NAME ' user=' &DB_USER ' password=' &DB_PWD ' schema=' &DB_PROP_DWH '); create table ' &var_targ'.'&var_tab ' as select * from connection to db2 (' &var_req'); disconnect from db2; quit;'
                                                ,"'"
                                                )
                                );
*/
      %put "Requ�te pour DB2";
      %put &var_req;
      %put %sysfunc(count("&var_req",#));
        %IF %sysfunc(count("&var_req",#)) = 0 %THEN %lance_req(var_code="&var_req");
      %end;
   %else %do;
        %put "Fichier incorrect";
   %end;
   %let rc=%sysfunc(fclose(&fid));
%let rc=%sysfunc(filename(filreq));

%put &KO;%put &OK;%put &TOTAL;

%IF
    &KO > 0
%THEN %DO;
    proc export
    data=tb_err outfile=
    "&var_rep&var_file._erreurs.csv"
    DBMS=DLM

    REPLACE;
        delimiter='|';
run;
%END;
%ELSE
    %IF &OK>0
    %THEN %DO;
        proc datasets library=&var_targ;
          copy out=libtarg move;
        quit;
    %END;
%mend;


%LET DB_NAME=tstname;
%LET DB_USER=tstusr;
%LET DB_PWD=tstpwd;
%LET DB_PROP_DWH=tstschema;

%let var_rep1=C:\Temp\;
/*%let var_file1=tst_req4.csv_from_erreurs.csv;*/
%let var_file1=test_chaines_longues_test2.csv;
%let var_targ1=libtemp;
%let var_mode1=init;
%let var_temps1='DEFAULT';



%mac_lecture_fichier(var_rep=&var_rep1, var_file=&var_file1, var_targ=&var_targ1, var_mode=&var_mode1, var_temps=&var_temps1);
%put &KO;%put &OK;%put &TOTAL;
%macro mac_tst();
data _null_;
	call execute ("data tb_tst;");
	call execute ("col1=");	call execute ("123;");
	call execute ("run;");
run;
%Mend;

%mac_tst();

%macro mac_tst();
data _null_;
	call execute ("data tb_tst;");
	call execute ("col1=");	call execute (123);call execute(";");
	call execute ("run;");
run;
%Mend;

%mac_tst();

%macro mac_tst();
%let var1=123;
%let var2='&var_temps';
%let var3=%sysfunc(compress(&var2,'"'));
%put &var2;
%put &var3;

%LET var_temps 'aaa';
data _null_;
	call execute ("data tb_tst;");
	call execute ("col1=");	call execute (&var1);
	call execute ("col2=");	call execute (&var2);/*Cette variable est bien interpr�t�e mais sans guillemets*/
	call execute ("col3=");	call execute (&var3);/*Cette variable n'est pas interpr�t�e*/
	call execute(";");
	call execute ("run;");
run;
%Mend;

%mac_tst();

/*Passage de cha�ne avec guillemets est OK*/
%macro mac_tst();
data _null_;
	call execute ("data tb_tst;");
	call execute ("col1=");	call execute ("'aaa';");
	call execute ("run;");
run;
%Mend;


%mac_tst();
/*Mais KO avec une variable*/
*%let var1="'";
%let var2="aaa";
*%let var3="'";
%let var4=";";

%let var3a="a'aaa";
%put %sysfunc(index(&var3a,"'"));

%do %while %to 

data _null_;
	call execute ("data tb_tst;");
	call execute ("col1=");	
	*call execute ("&var1");
	call execute ("'""&var2""'");
	*call execute ("&var3");
	call execute ("&var4");
	call execute ("run;");
run;
%Mend;
%mac_tst();
