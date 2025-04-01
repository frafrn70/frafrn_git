data tb_tst;
format col1 yymmdd10.;
format col2 date9.;
col1=today();
col2=intnx( 'month', col1, -1,'end');
call symput("var1", put(col2,yymmdd10.));
run;
%put &var1;
