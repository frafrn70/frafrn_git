libname ibu_ora oracle user="Login" password=MotDePasse path='IBUMET.WORLD';

proc sql;
connect to oracle as ibu (user="Login" password="MotDePasse" path='IBUPRO.WORLD');
select * from connection to ibu (select count(*) from TDCANAL);
disconnect from ibu;
quit;