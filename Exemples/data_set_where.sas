data toto;
an=1900;output;an=1901;output;an=1902;output;an=1903;output;an=1904;output;
run;

data titi;
set toto (where=(an=1901 OR an=1902));
run;
