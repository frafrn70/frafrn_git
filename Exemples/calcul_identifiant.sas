
/*Table initiale à 4 enregistrements*/
data tb_tmp(drop=i);
	do i=1 to 4;
		col1="aaa";id=i;output;
	end;
run;

/*Calcul nombre enregistrements*/
data _null_;
set tb_tmp;
call symput("nb_enr_base", _n_+1);
run;

/*Calcul identifiant*/
data tmp_new (drop=tmp);
	set tb_tmp;
	retain tmp &nb_enr_base;
	if col1 ne "" 
		then do;
			id2=tmp;
			tmp=tmp+1;
			output;
			*id2=&nb_enr_base;
			*&nb_enr_base=&nb_enr_base+1;
			*put &nb_enr_base;
		end;

/*	output;*/
run;
		
