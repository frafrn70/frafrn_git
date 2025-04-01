data libprod.tb_tst;
col1=1;col2="aaa";output;
col1=2;col2="bbb";output;
col1=3;col2="ccc";output;
run;

proc datasets library=libprod;
audit tb_tst(alter=tst);
initiate;
quit;
/*=> Création d'un fichier tb_tst.sas7baud*/

data libprod.tb_tst2;
col1=4;col2="ddd";output;
run;

proc sql;
insert into libprod.tb_tst(alter=tst, write=tst)
select * from libprod.tb_tst2;
quit;

proc sql;
create table libprod.tb_tst_audit as
select * from libprod.tb_tst(type=audit);
quit;
/*=> Pour visualiser le contenu du fichier tb_tst.sas7baud*/
