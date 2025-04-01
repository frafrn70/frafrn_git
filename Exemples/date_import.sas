/*Avec un fichier du type (en changeant le format selon ce que l'on veut charger */
/*
aaa;1111;15-02-2004 00:00:00
aaa;1111;30-05-2004 00:00:00
bbb;2222;24-12-2005 00:00:00
*/

filename source '/users/bdlra/work/test.txt';
/* Permet de déclarer un "alias" pour un fichier d'entrée */

data work.tst_date;
   infile source DLM=';';
   input 	col1 3.
   			col2 $
			datechar 12.
			date1;

	informat date1 DDMMYY10.;
	format date1 yymmddn8.;
	/*format date2 10.;*/
	date2=input(substr(datechar,1,8), 8.);
	/*date2=put(input(substr(datechar,1,8), 8.),DDMMYY10.);*/
run;
