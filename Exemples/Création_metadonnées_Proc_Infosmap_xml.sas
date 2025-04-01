/*Avec fichier XML*/
filename xml_map "C:\Franck\SAS\SAS_Save_Tmp\Exemples\XML\tst_infomap_aware.xml";

PROC INFOMAPS
METAPASS="s@s@dmV9 "
METAPORT=8561
METAREPOSITORY="Foundation"
METASERVER="localhost"
METAUSER="sasadm"
MAPPATH="/BIP Tree/ReportStudio/Maps/Tests";
open infomap "MPTST_SCRIPT";
IMPORT FILE=xml_map;
save;
run;


