data tb_tst;
conn='01feb94:8:45'dt;
servdate=datepart(conn);
date=put(servdate, ddmmyy10.);
put servdate ddmmyy10.;
run;
