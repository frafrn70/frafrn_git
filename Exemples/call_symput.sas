data _null_;
	call symput('var1',2);
run;
/*Affecte la valeur 2 à la variable globale var1*/

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
