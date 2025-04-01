/*
Source: Une table des parents avec X fois 3 champs pour les X enfants (3 enfants dans l'exemple)
Cible: Une table des enfants avec X champs pour les parents (un seul champ dans l'exemple)
*/

data parents;
	parent="P1";
		enf11=111;enf12=112;enf13=113; /*Champ enf1 pour les 3 enfants*/
		enf21=121;enf22=122;enf23=123; /*Champ enf2 pour les 3 enfants*/
		enf31=131;enf32=132;enf33=133; /*Champ enf3 pour les 3 enfants*/
		output;
	parent="P2";
		enf11=211;enf12=212;enf13=.;
		enf21=221;enf22=222;enf23=.;
		enf31=444;enf32=555;enf33=.;
		output;
	parent="P3";
		enf11=311;enf12=.;enf13=.;
		enf21=777;enf22=.;enf23=.;
		enf31=888;enf32=.;enf33=.;
		output;
	parent="P4";
		enf11=.;enf12=.;enf13=.;
		enf21=.;enf22=.;enf23=.;
		enf31=.;enf32=.;enf33=.;
		output;
run;

/**/

%Macro Mac_enfants(nb_enf, mode, periode, chargement);

data enfants (keep=parent enf1 enf2 enf3 num_enfant);
		set parents 
		/*Version avec tableau à 1 seule dimension*/
		/*
		array chp1{&nb_enf} enf11-enf1&nb_enf.;
		array chp2{&nb_enf} enf21-enf2&nb_enf.;
		array chp3{&nb_enf} enf31-enf3&nb_enf.;
		*/

		array chps{3,&nb_enf} %do i=1 %to 3; enf&i.1-enf&i.&nb_enf. %end;;

		%do enf=1 %to &nb_enf;
			%do col=1 %to 3;
				enf&col=chps{&j,enf};
			%end;
			num_enfant=&i;
			if enf1 ne "" then output;
		%end;
	/*Version avec tableau à 1 seule dimension*/
	/*
		%do i=1 %to &nb_enf;
			enf1=chp1{&i};
			enf2=chp2{&i};
			enf3=chp3{&i};
			num_enfant=&i;
			if enf1 ne "" then output;
		%end;
	*/
run;

%Mend;
%Mac_enfants(3);


/*Ancienne version*/
/*
%Macro Mac_Tst();
%do i=1 %to 3;
	data toto_temp  (rename=(enf&i.1=enf1 enf&i.2=enf2 enf&i.3=enf3));
		set parents (keep=parent enf&i.1-enf&i.3 where=(enf&i.1 ne .));
	run;
	Proc Append Base=enfants_cible Data=toto_temp; run;
%end;
%Mend;
%Mac_Tst();
*/
/*La table cible n'a pas besoin d'être créée car elle le sera par le premier append*/

