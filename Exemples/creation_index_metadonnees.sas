libname found "C:\SAS\EntBIServer\Lev1\SASMain\MetadataServer\MetadataRepositories\Foundation";

proc datasets library=found; /*Marche et cr�e les 2 index*/
    modify accentry;
	index create id;
quit;
