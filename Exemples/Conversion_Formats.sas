data tb_tst_conv_num;
a=1;b=put(a,$20.);output;
run;
data titi_conv_char;
a="1";b=input(a,8.);output;
run;

data tb_tst;
col1=today();
col2=put(today(),year4.);
col3=put(today(),qtr.);
col4=put(today(),month.);
col5=(put(intnx("month",today(),-3),year4.)||"T"||put(intnx("month",today(),-3),qtr.));
run;

/*
put fait passer du numérique en texte
input fait passer du texte en numérique
putn formatte un numérique
putc formatte une chaîne
*/


/*Etape data: la conversion se fait bien*/
data tutu;
set toto;
col=put(c, $20.);
run
;

/*Proc sql: la même conversion ne passe pas*/
proc sql;
create table tutu as
select input(c, $20.)
from toto;
quit
;



proc format;
   value writfmt 1='date9.' 
                 2='mmddyy10.';
run;
data dates;
   input number key;
   datefmt=put(key,writfmt.);
   date=putn(number,datefmt);
   datalines;
15756 1
14552 2
;

