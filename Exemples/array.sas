/*Cas tableau à une seule dimension*/
data toto;

col1="111000";col2=222;col3=333;output;
col1="123000";col2=345;col3=567;output;
col1="987000";col2=765;col3=543;output;
run;

data toto_new /*(drop=i)*/;
length col1 $12.; /*Nécessaire car la longueur est à 6*/
set toto;
/*2 tableaux car un tableau doit contenir des données de même type*/
array list_col{2} col2-col3; /*On fait un tableau de 2 "cases" qui correspondront à chaque champ colX*/
array list_col_car{1} $ col1; /*On fait un tableau de 1 "case" qui correspond à col1 */
array list_col_new1{2}; /*On fait un tableau de 3 "cases" qui ne correspondront à rien car ce sont des nouvelles colonnes*/
array list_col_new2{2}; /*On fait un tableau de 3 "cases" qui ne correspondront à rien car ce sont des nouvelles colonnes*/
	do i=1 to 2;
		list_col_new1{i}=list_col{i}+5;/*Alimente les nouvelles colonnes avec les anciennes valeurs*/
		list_col{i}=list_col{i}+1;/*Re-crée les mêmes colonnes avec mise à jour des valeurs*/
		list_col_new2{i}=list_col{i}+5;/*même formule que list_col_new1 mais sur la base des nouvelles valeurs*/
		val=list_col{i}; /*ne met dans val que la dernière valeur (ici list_col{3} et donc col3 et donc 333 puis 567 puis 543*/
		/*output;*/
		/*Si je mets le output:
			J'ai aussi les valeurs pour list_col{2} dans val
			Mais quand list_col_new11 renseigné list_col_new12 ne l'est pas encore 
		*/
		dim1=dim(list_col); /*dim renvoie la dimension du tableau*/
		dim2=dim(list_col_car);
	end;
	list_col_car(1)="NEW"||col1;
run;



/*Cas tableau à 2 dimensions*/

/*Tests non terminés*/
data toto;
	col11="111000";col21=222;col31=333;
	col12="999";col22=777;col32=666;
	output;
	col11="123000";col21=345;col31=567;
	col12="111";col22=222;col32=333;
	output;
	col11="987000";col21=765;col31=543;
	col12="666";col22=234;col32=789;
	output;
run;

data toto_new /*(drop=i)*/;
length col1 $12.; /*Nécessaire car la longueur est à 6*/
set toto;
/*2 tableaux car un tableau doit contenir des données de même type*/
array list_col{2,2} 
/*	col21 col22 col31 col32*/
	col21-col32
	do i=2 to 3; coli.1-coli.2 end

;
/*On fait un tableau de 2 "cases" qui correspondront à chaque champ colX*/
array list_col_car{2,1} $ col11-col12;
; /*On fait un tableau de 1 "case" qui correspond à col1 */
/*
do i=2 to 3;
		do j=1 to 2;
			val1=list_col{i,j};
		end;
	end;
	list_col_car(1)="NEW"||col1;
*/
run;


data toto;
do i=1 to 3;

