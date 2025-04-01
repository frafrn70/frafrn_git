/*
Pour convertir des nombres en une chaîne avec des 0 devant
*/
data tb_num;
input x;
cards;
5
10
225
3259
;
run;

data tb_char;
set tb_num;
x_char=put(x,z4.);
run;

/*
Pour convertir en nombre une chaîne avec des 0 devant
*/
data tb_num2;
x='0016';
x_num=input(x,4.);
run;

