/*   Route the ARM log    */                                                                                                                                                                                                                                                                             
options armloc="c:\temp\arm.log";                                                                                                                                                                                                                                               
/*  Turn on Step instrumentation    */                                                                                                                                                                                                                                                                             
options armsubsys=(arm_proc);
/*options armsubsys=(arm_proc, arm_dsio); */   /* options tr�s bavardes avec d�tails des requ�tes */                                                                                                                                                                                                                                               /* Do some work  */                                                                                                                                                                                                                                                                             
data work.a;                                                                                                                            
  set sashelp.prdsale;                                                                                                                  
  where actual>predict;                                                                                                                 
run;                                                                                                                                                                                                                                                                            
proc print data=work.a;                                                                                                                 
run;                  

 
/*  Turn off instrumentation  */                                                                                                                                                                                                                                                                             
options armsubsys=(arm_none);
