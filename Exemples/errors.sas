/*
Limite le nombre de fois qu'est répété la même erreur
On a 3 erreurs à cause des valeurs A62, B68, C58 mais seules les 2 premières sont affichées
*/

options errors=2;
data tb_tst_errors;
/*
infile certif01;
*/
input
ID 1-4
Name $ 6-25
RestHR 27-29 
MaxHR 31-33
RecHR 35-37
TimeMin 39-40
TimeSec 42-43
Tolerance $ 45-45;
datalines;
2501 Bonaventure, T       78  177 139 11 13 I
2523 Johnson, R           69  A62 214 9  42 S
2539 LaMance, K           75  B68 341 11 46 D
2552 Reberson, P          69  C58 439 15 41 D
run;

