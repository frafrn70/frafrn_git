/*Sans fichier XML*/
PROC INFOMAPS
METAPASS="11@@abcd"
METAPORT=8561
METAREPOSITORY="Foundation"
METASERVER="localhost"
METAUSER="sasdemo"
MAPPATH="/BIP Tree/ReportStudio/Maps/Tests";
delete infomap "MPTST_SCRIPT_SANSXML_Bis";
open infomap "MPTST_SCRIPT_SANSXML_Bis";

insert datasource sasserver='SASMain'
	cube="SASMain - OLAP Schema".CBTST_PRDSALELIGHT;

insert folder 'MesMesures';
insert folder 'MesDimensions';

insert dataitem 
expression="<<Dim_Prod>>" 
name="Dim_Prod" type=character  classification=category  folder='MesDimensions';

insert dataitem 
expression="<<Dim_Geo>>" 
name="Dim_Geo" type=character  classification=category  folder='MesDimensions';

insert dataitem 
expression="<<Dim_Temps>>.HIERARCHY" 
name="Dim_Temps" type=character  classification=category  folder='MesDimensions';

insert dataitem 
expression="<<Dim_Division>>.HIERARCHY" 
name="Dim_Division" type=character  classification=category  folder='MesDimensions';

insert dataitem 
expression="<<Measures.actual>>" 
name="Actual" type=numeric classification=measure folder='MesMesures';

insert dataitem 
expression="<<Measures.predict>>" 
name="predict" type=numeric classification=measure folder='MesMesures';

insert dataitem 
expression="<<Measures.taux_real>>" 
name="taux_real" type=numeric classification=measure folder='MesMesures';

insert dataitem 
expression="<<Measures.taux_inverse>>" 
name="taux_inverse" type=numeric classification=measure folder='MesMesures';

save;
run;
