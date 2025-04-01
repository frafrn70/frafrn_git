libname found "C:\SAS\EntBIServer\Lev1\SASMain\MetadataServer\MetadataRepositories\Foundation";

proc datasets library=found; /*Marche et crée les 2 index*/
    modify accentry;
	index create id;
quit;
