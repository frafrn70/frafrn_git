
libname lib_aix "C:\Franck\Interventions\Inter_Save_Tmp\00_En cours\2008\2008_04_Maif\Tests\LIBAIX";
libname lib_aix "C:\Fichiers_SAS\Librairies\LIBAIX";


data lib_aix.tb_tst (
outrep=RS_6000_AIX_64
/*Il n'est pas possible de créer un index avec CEDA*/
/*index=(idx_key=(col1_aix64 col2_aix64)/unique col3_aix64=(col3_aix64))*/
);
	col1_aix64=123;col2_aix64=1;col3_aix64="1aaa";output;
	col1_aix64=456;col2_aix64=2;col3_aix64="2aaa";output;
	col1_aix64=789;col2_aix64=3;col3_aix64="3aaa";output;
run;

