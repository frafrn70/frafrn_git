/*Cas avec les variables sans pas entre les valeurs*/
data tb_tst3;
do i=1, 3, 17;
	col1=i;output;
end;
run;


data tb_test_1;
	col2="aaa";	ancien_nom=col2; ancien2="zzz";
	do i=1 to 6 by 2; /*Le by est facultatif et peut être négatif: do i=6 to 1 by -2 par exemple*/
		col1=i;output;
	end;
	col3=i;output;
run;
/*Attention!!!: on a bien i=7*/

data tb_test 
(
	drop=i 
	rename=(ancien_nom=Nouvelle_Colonne ancien2=Nouvelle2)
	where=(Nouvelle2="zzz" and col1>1) /*condition dans le data => nouveau nom*/
)
;
set tb_test_1
	(
		where=(ancien2="zzz")/*condition dans le set => ancien nom*/
	)
;
run;


/*Boucles de types différents et imbriquées*/
data tb_tst2;
result=0;
do year=1 to 25 until (result>10000);/*On s'arrête au bout de 25 ou si le résultat est supérieur à 10000*/
	result=500+(result*2);
end;
output;
run;
