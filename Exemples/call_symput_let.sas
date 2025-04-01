data _null_;
	call symput('var1',2);
run;
/*Affecte la valeur 2 à la variable globale var1*/

data tbtst;
	col_num=123;
	col_car='123';
	/*col_dt="aaa";*/
run;

data _null_;
%GLOBAL var_a_num;%GLOBAL var_a_car;
%GLOBAL var_num_global1;%GLOBAL var_num_global2;
%GLOBAL var_car_global1;%GLOBAL var_car_global2;
%GLOBAL var_num_col;%GLOBAL var_car_col;

  set tbtst;
  call symput('var_a_num',col_num);call symput('var_b_num',col_num);%LET var_num_global1=&var_a_num;
  call symput('var_a_car',col_car);call symput('var_b_car',col_car);%LET var_car_global1=&var_a_car;
  %LET var_num_col=col_num;%LET var_car_col=col_car;
  %put "Hello";
  %put _user_;
run;
  %LET var_num_global2=&var_a_num;
  %LET var_car_global2=&var_a_car;
  %put "Hello";
  %put _user_;
/*Affecte du contenu des colonnes à des variables globales var_a_num et var_a_car*/
/*
!!!Attention, la variable n'est affectée qu'après le run!!!
  => Seuls les %LET après le run sont bien affectés
  => Voir le résultat de %put _user pour confirmation
*/

data toto;
	col1=1;col2="aaa";output;
	col1=2;col2="bbb";output;
	col1=3;col2="bbb";output;
run;

%Macro tst_mac();
	%IF &var1 ne 2 
		%THEN %DO;
		data titi;
		set toto (where=(col1=&var1));
		run;
		%END;
	%ELSE %DO; /*END du IF*/
		%LET var2="bbb";
		/*Affecte la valeur "bbb" à la variable locale var2*/
		data titi (where=(col2=&var2));
		set toto;
		run;
	%END; /*END du ELSE*/
%Mend;

%tst_mac();
