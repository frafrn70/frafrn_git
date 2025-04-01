data libprod.tb_tst;
do i=1 to 35/*35000000*/;
      	col_ran = ranuni(1025);/* Génération de nombres alétaoires < 1 */
      	col_int1 = int(col_ran*100);/* Renvoie la partie entière */
      	col_int2 = ceil(col_ran*100);/* Renvoie le 1er entier supérieur ou égal */
		col_mod = mod(col_int1, 13);/* donne le reste de la division de col_int par 13 => chiffres de 0 à 12 */
		col_txt="aaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbb";
		output;
end;
run;

data libprod.tb_tst;
set sashelp.prdsale;
do i=1 to 3500/*35000000*/;
      	year = year+i;
		indic1 = ranuni(1025);/* Génération de nombres alétaoires < 1 */
      	indic2 = int(indic1*100);/* Renvoie la partie entière */
      	indic3 = ceil(indic1*100);/* Renvoie le 1er entier supérieur ou égal */
		col_mod = mod(col_int1, 13);/* donne le reste de la division de col_int par 13 => chiffres de 0 à 12 */
		col_txt="aaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbb";
		output;
end;
run;

