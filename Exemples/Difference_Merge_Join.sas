data tb_tst1;
col_id=1;col_char="aaa";output;
col_id=1;col_char="bbb";output;
col_id=2;col_char="ccc";output;
col_id=2;col_char="ddd";output;
col_id=2;col_char="eee";output;
run;

data tb_tst2;
col_id=1;col_num=111;output;
col_id=1;col_num=112;output;
col_id=2;col_num=221;output;
col_id=2;col_num=222;output;
run;

proc sort data=tb_tst1;
by col_id;
run;
proc sort data=tb_tst2;
by col_id;
run;

data tb_tst_full_merge;
merge tb_tst1 (in = a) tb_tst2(in = b) ;
by col_id;
if a and b then output;
run;
data tb_tst_merge_gauche;
merge tb_tst1 (in = a) tb_tst2(in = b) ;
by col_id;
if a then output;
run;
data tb_tst_merge_droite;
merge tb_tst1 (in = a) tb_tst2(in = b) ;
by col_id;
if a then output;
run;
/*
data t3_merge_gauche;
merge t2 (in = b) t1 (in = a) ;
by c1;
if a then output;
run;

data t3_merge_droite;
merge t2 (in = b) t1 (in = a) ;
by c1;
if b then output;
run;

proc sql;
create table tb_tst_sql_join as
select t1.*, t2.col_num
from tb_tst1 t1, tb_tst2 t2
where t1.col_id=t2.col_id;
quit;
