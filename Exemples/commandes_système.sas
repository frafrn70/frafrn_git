/*Pour connaître l'ensemble des variables systèmes*/
filename test1 pipe "set";
data _null_;
length text $132;
infile test1 truncover;
input text 1-132;
put text=;
run;
