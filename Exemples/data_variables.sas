filename file_f1 "&HOME_CIREF\LDAP\liste_variables.csv";

data 
	_null_;
format
metaserver metaport metauser metapass metaprotocol metarepository ADServer ADPort ADPerBaseDN ADGrpBaseDN ADBindUser ADBindPW $250.;
infile
	file_param dsd missover dlm=";" lrecl=5000 dsd missover end = fin /*n=5*/  firstobs=2;
/*
options obs pour limiter le chargement le temps de valider le format
*/
input
	metaserver $ metaport $ metauser $ metapass $ metaprotocol $ metarepository $ ADServer $ ADPort $ ADPerBaseDN $ ADGrpBaseDN $ ADBindUser $ ADBindPW;
run; 

	%let metaserver=%sysget(metaserver);
	%let metaport=%sysget(metaport);
	%let metauser=%sysget(metauser);
	%let metapass=%sysget(metapass);
	%let metaprotocol=%sysget(metaprotocol);
	%let metarepository=%sysget(metarepository);
	%let ADServer=%sysget(ADServer);
	%let ADPort=%sysget(ADPort);
	%let ADPerBaseDN=%sysget(ADPerBaseDN);
	%let ADGrpBaseDN=%sysget(ADGrpBaseDN);
	%let ADBindUser=%sysget(ADBindUser);
	%let ADBindPW=%sysget(ADBindPW) ;

	call symput("metaserver",metaserver);
	call symput("metaport",metaport);
	call symput("metauser",metauser);
	call symput("metapass",metapass);
	call symput("metaprotocol",metaprotocol);
	call symput("metarepository",metarepository);
	call symput("ADServer",ADServer);
	call symput("ADPort",ADPort);
	call symput("ADPerBaseDN",ADPerBaseDN);
	call symput("ADGrpBaseDN",ADGrpBaseDN);
	call symput("ADBindUser",ADBindUser);
	call symput("ADBindPW",ADBindPW) ;
run ;
