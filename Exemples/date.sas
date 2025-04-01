data toto;
x=date()-input("01/01/2005", ddmmyy10.);/*donne le n° du jour dans l'année*/
put x;
run;

data toto;
x=input("01/01/2005", ddmmyy10.);/*donne le n° du jour dans l'année*/
put x;
y=input(compress(put(x, 4.);
format x ddmmyy10.;
/*format y $4.;*/
run;

data _null_;
 x="03/DEC/2005"d;
 y=input("01/12/2005", ddmmyy10.);
/*format x date9.;*/
put x=;
put y=;
run;

data tmp_dt_chiffre;
x=16570;
put x;

format x DDMMYY10.;
run;


/*Ajout 07/06/2005*/
data toto;
 date1="31/JAN/2005"d;
 date2="02/MAR/2005"d;
 date3="31/MAR/2005"d;
 date4="1/APR/2005"d;
 diff_2a=intck('day', date1, date2);
 diff_2b=intck('month', date1, date2);
 diff_2c=intck('year', date1, date2);
 diff_3=intck('month', date1, date3);
 diff_4=intck('month', date1, date4);

 x=date1;
y=x+1;
z=x;
date = compress(year(intnx( 'month', x, -1 )) || "/" || put(month(intnx( 'month', x, -1 )), Z2.));
format z monyy5.; 
/*format date yymon7.;*/
format x date9.;
format y date9.;
put x=;
put y=;
run;


data toto;
 x="28/JAN/2005"d;
jour_plus_sept = (intnx( 'day', x, +7 ));
mois_precedent = compress(year(intnx( 'month', x, -1 )) || "/" || put(month(intnx( 'month', x, -1 )), Z2.));
annee_precedente = year(intnx( 'year', x, -1 ));
format x date9.;
format jour_plus_sept date9.;
run;

proc sql;
select x, year(intnx( 'month', x, -1 )) ||"/"||month(intnx( 'month', x, -1 )) as mois_prec from toto;
quit;

