/*
Extrait du fichier en entrée et obtenu par au ls -lR
lancé à partir de la racine

./TT_DB:
total 36
-rw-r--r--   1 root       root          1024 Feb  8  2005 access_table.ind
-rw-r--r--   1 root       root          3072 Feb  8  2005 access_table.rec
-rw-r--r--   1 root       root          2048 Feb  8  2005 file_object_map.ind
-rw-r--r--   1 root       root          2048 Feb  8  2005 file_object_map.rec
-rw-r--r--   1 root       root          2048 Feb  8  2005 file_table.ind
*/

/*****************************************************************************/
/* Etape de recuperation des informations du listing des fichiers du serveur */
/*****************************************************************************/
data listefile(drop=_:) ;
  nbRepertoire = 0 ;
  length _texte repertoire $256 
         fichier $50
         user  $10
         group $10
         droit $10
         type  $20
         taille 6
         date  6.;
  format date ddmmyy10.;
  _racine = "" ;
  _rc = filename('fic','C:\Documents and Settings\frafrn\Mes documents\Franck\Interventions\2006\2006_06a_Schneider\Recup_Infos\Fichiers Serveur\listfile_new.txt') ;
  _fid = fopen('fic') ;
  do while(fread(_fid) eq 0) ;
    _texte = "" ;
    _rc = fget(_fid,_texte,256) ;
    if (substr(trim(left(_texte)),1,1) eq ".") then repertoire = _racine !! substr(trim(left(scan(_texte,1,':'))),2) ;
	/*put substr(trim(left(scan(_texte,1,':'))),2);*/
    if (substr(trim(left(_texte)),1,1) eq "-") then do ;
      taille = input(scan(_texte,5,' '),best.) ;
      fichier = scan(_texte,9,' ') ;
      type = scan(scan(_texte,9,' '),2,'.') ;
      droit = scan(_texte,1,' ') ;
      user = scan(_texte,3,' ') ;
      group = scan(_texte,4,' ') ;
	  if index(scan(_texte,8,' '), ':') 
        then date = input(compress(scan(_texte,7,' ') !! scan(_texte,6,' ') !! scan(_texte,8,' ')), date9.);
        else date = input(compress(scan(_texte,7,' ') !! scan(_texte,6,' ') !! '2006'), date9.);
      nbRepertoire = count(repertoire,'/') ;
      if (count(fichier,'.') eq 1) then  output ;
    end ;
  end ;
  _fid = fclose(_fid) ;
run ;
