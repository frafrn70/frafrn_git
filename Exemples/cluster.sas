libname test 'c:\temp' ;

libname testspde spde 'C:\Temp\spde\meta' datapath=('C:\Temp\spde\data1' 'C:\Temp\spde\data2') indexpath=('C:\Temp\spde\index');

Libname testspds sasspds 'testspds' host="tours" serv="41017" user="anonymous";

data test.tmp(drop=occ i);
do annee=2006 to 2006;
   do mois=1 to 12;
   	  occ=floor(ranuni(600000)*600000);
	  do i=1 to occ;
	  	idcli=floor(ranuni(100)*100);
		montant=ranuni(10000)*10000;
		idcom=compress(input(put(annee,z4.),$8.))!!compress(input(put(mois,z2.),$8.))!!'CCID'!!input(put(i+13579,z15.),$15.);
		idexp='CLID  :           '!!input(put(idcli,8.),$8.)!!'          -          CLCOL :         '!!input(put(annee,z4.),$8.)!!input(put(mois,z2.),$8.)!!'CCID'!!input(put(i+13579,z15.),$15.);
		output;
	  end;
   end;
end;
run;

%macro split();

/* uniquement pour les quatres premiers mois */

%do i=1 %to 4;

data testspds.mois&i;

set test.tmp;
where annee=2006 and mois=%trim(&i);

run;

%end;


%mend;

%split();

proc spdo library=testspds;
set acluser admin;
CLUSTER create clust
mem=mois1
mem=mois2
mem=mois3
mem=mois4
maxslot=12;/*Nombre maxi de membres*/
quit;

proc sql;

select * from testspds.clust where annee=2006 and mois=1 ;
quit;



/*
proc sql;

connect to sasspds(dbq='testspds' server=tours.41017 user=anonymous )

execute(create table testspds.mois&i as select * from test.tmp)by sasspds;

quit;

*/