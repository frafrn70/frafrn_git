data tb_tst(drop=_:);


/*Attention, type datetime 
	=> secondes => col_datetime-1 col_datetime - 1 seconde!!!
*/
format col_dtdate dtdate.;format col_dtdate9 dtdate9.;
format col_datetime datetime.;format col_datetime2 datetime.;

do _date="01Jan06"d to "01Jan06"d + 365;
	col1=_date;

	col_dtdate=dhms(col1-1,0,0,0);/*passage nécessaire de heure-minute-seconde*/
	col_dtdate9=dhms(col1-1,0,0,0);
	col_datetime=dhms(col1-1,0,0,0);
	col_datetime2=col_datetime-1;
	output;
end;
run;
