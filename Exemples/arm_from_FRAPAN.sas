proc datasets lib=work kill ;
run ;
quit ;

%let path=C:\SAS\BIServer\Lev1\SASMain\OLAPServer\logs;
* filename armlog "&path\arm.tir15";
filename armlmog "&path\OLAP_ARM.log" ;
%armproc;
%armjoin;
run;

/* Restitution des performances */
proc sort data=updtview out=test;
by txname ;
run ;

ods listing close ;
ods html file="c:\temp\last.html" ;
proc print data=test ;
sum deltelap deltcpu noncpu ;
*by txname ;
* sumby txname ;
where txname="MDX_QUERY" ;
var calldt fmt2Buff txcpu updtdata ;
run ;
ods html close ;
ods listing ;

