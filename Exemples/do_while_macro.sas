%Macro Boucle(num);
data work.boucle&num.;
n=0;
do while(n<&num);
  put n;
	n+1;
output;
end;
run;
%Mend;

do i=1 to 4; 
%Boucle(n);
n+1;
end;
run;
