/*Pour conna�tre l'ensemble des variables syst�mes*/
filename test1 pipe "set";
data _null_;
length text $132;
infile test1 truncover;
input text 1-132;
put text=;
run;
