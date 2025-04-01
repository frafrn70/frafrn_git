/*Do While
	Exécute ce qui se trouve avant le end
	tant que la condition est vérifiée
*/
data _null_;
i=3;
do while (i>0);
	put "message"
	put i;
	i=i-1;
end;
run;
