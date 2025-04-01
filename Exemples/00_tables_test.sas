data tb_tst1;
col_id=1;col2="aaa";output;
col_id=2;col2="bbb";output;
col_id=4;col2="ddd";output;
col_id=5;col2="eee";output;
col_id=6;col2="fff";output;

run;

data tb_tst2;
col_id=1;col3="111aaa";output;
col_id=3;col4="333ccc";output;
col_id=5;col4="555eee";output;
col_id=6;col4="666fff";output;
run;

proc sql;
create table tb_tst3 as
select t1.col2, t2.*
from tb_tst1 t1, tb_tst2 t2
where 
t1.col_id=t2.col_id;
quit;

proc sql;
create table tb_tst4 as
select t1.*
from 
	tb_tst1 t1, 
	(select max(col_id) as col_id from tb_tst2) tm
where t1.col_id = tm.col_id;
quit;

/*------------------------------------------------------------------------*/
/* SOCIETE        : RSI                                                   */
/*                                                                        */
/* NOM DU FICHIER : autoexec                                              */
/*                                                                        */
/*                                                                        */
/* OBJET DU PROGRAMME                                                     */
/*       Définition des variables, des librairies, des options, etc...    */
/*                                                                        */
/* EN ENTREE                                                              */
/*                                                                        */
/*                                                                        */
/* EN SORTIE                                                              */
/*                                                                        */
/*                                                                        */
/* MACROS APPELEES                                                        */
/*                                                                        */
/* PARAMETRES                                                             */
/*                                                                        */
/*                                                                        */
/*                                                                        */
/*------------------------------------------------------------------------*/
/* CREATION       : 16/09/2008                                            */
/* AUTEURS        : SAS (FRAFRN)                                          */
/*                                                                        */
/*                                                                        */
/* MODIFICATION 001 : JJ/MM/AAAA                                          */
/* AUTEURS          : SAS (FRAFRN)                                        */
/* OBJET            :                                                     */
/*                                                                        */
/*------------------------------------------------------------------------*/


/*------------------------------------------------------------------------*/
/* DEBUT : recuperation des variables d'environnement                     */
/*------------------------------------------------------------------------*/
   /*%let vg_repparam   = %sysget(REPPARAM);*/
   %let vg_okprpfmt = %sysget(OKPRPFMT);
   %let vg_okprpprmtab = %sysget(OKPRPPRMTAB);
   %let vg_okprpprmfic = %sysget(OKPRPPRMFIC);
   %let vg_okpcfsas   = %sysget(OKPCFSAS);
   %let vg_okprpmac  = %sysget(OKPRPMAC);
   %let vg_okprppgmac  = %sysget(OKPRPPGMAC);

/*------------------------------------------------------------------------*/
/* FIN   : recuperation des variables d'environnement                     */
/*------------------------------------------------------------------------*/

/*------------------------------------------------------------------------*/
/* DEBUT : declaration des libname                                        */
/*------------------------------------------------------------------------*/

   libname LIBPARAM "&vg_okprpprmtab";
   libname SASFMT "&vg_okprpfmt";
   libname WRSTEMP "&vg_okpcfsas./Lev1/SASMain/Data/wrstemp";
   libname MAILLIB "&vg_okpcfsas./Lev1/SASMain/Data/wrsdist";
   libname SASMAC "&vg_okprpmac";

   LIBNAME CRACREF ORACLE  READBUFF=2500  PATH=OCAPIDEV  USER=ocapinat  PASSWORD="{sas001}b2NhcGluYXQ=";

/*------------------------------------------------------------------------*/
/* FIN   : declaration des libname                                        */
/*------------------------------------------------------------------------*/


/*------------------------------------------------------------------------*/
/* DEBUT : declaration des filename                                       */
/*------------------------------------------------------------------------*/
FILENAME RPPRM "&vg_okprpprmfic";
/*------------------------------------------------------------------------*/
/* FIN   : declaration des filename                                       */
/*------------------------------------------------------------------------*/

/*------------------------------------------------------------------------*/
/* DEBUT : definitions des options                                        */
/*------------------------------------------------------------------------*/

   /* Déclaration des formats */
   options FMTSEARCH=(SASFMT WORK);

   /* Déclaration des macros */
   options mstored sasmstore=SASMAC;

/*------------------------------------------------------------------------*/
/* FIN   : definitions des options                                        */
/*------------------------------------------------------------------------*/

/*------------------------------------------------------------------------*/
/* DEBUT : compilation des macros                                         */
/*------------------------------------------------------------------------*/
   %include "&vg_okprppgmac./*.sas";

/*------------------------------------------------------------------------*/
/* FIN   : compilation des macros                                         */
/*------------------------------------------------------------------------*/

