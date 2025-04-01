data tb_tst;
col1=1;output;
col1=2;output;
run;

proc sql;
create table tb_tst2 as
select 
sum((case when
col1=1
then 10
else 20 end)) as c2
from tb_tst;
quit;

proc sql;
create table tb_tst3 as
select 
sum(ifn(col1=3,1,0)) as c2
from tb_tst;
quit;
