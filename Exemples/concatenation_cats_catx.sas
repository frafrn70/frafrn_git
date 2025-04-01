/*
Fonction bien décrites dans la documentation ou dans les notes suivantes:
	Pour CATS: http://support.sas.com/kb/24/513.html
	Pour CATX: http://support.sas.com/kb/24/514.html
*/
data tb_tst;
	col1="aaa aaa aaa";
	col2="  b b b  ";
	col3="ccccccc  c  ccc";
	col4="d d d d d d d";
	col_concat=col1||col2||col3||col4;
	col_concat_catc=catc(of col1-col4);/*Non documenté? Idem catx avec une virgule comme séparateur?*/
	col_concat_cats=cats(of col1-col4);/*Equivalent TRIM(LEFT(COL1))||TRIM(LEFT(COL2))||TRIM(LEFT(COL3))||TRIM(LEFT(COL4))*/
	col_concat_catt=catt(of col1-col4);/*Equivalent TRIM(COL1)||TRIM(COL2)||TRIM(COL3)||TRIM(COL4)*/
	col_concat_catx=catx("+", of col1-col4);/*Equivalent TRIM(LEFT(COL1))||"+"||TRIM(LEFT(COL2))||"+"||TRIM(LEFT(COL3))||"+"||TRIM(LEFT(COL4))*/
run;
