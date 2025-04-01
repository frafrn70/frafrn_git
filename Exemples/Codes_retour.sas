On peut par exemple avoir le contenu suivant pour un fichier bat:
"Chemin_sas.exe" -sysin "Chemin_script_SAS"
set ERR=%ERRORLEVEL%
echo debut > c:\Temp\log.txt
date/T >> c:\Temp\log.txt
time/T >> c:\Temp\log.txt

echo ***************************************************** >> c:\Temp\log.txt

echo retour SAS: %ERR% >> c:\Temp\log.txt

if %ERR% EQU O goto RETOUR_OK0
if %ERR% EQU 1 goto RETOUR_OK1
if %ERR% EQU 2 goto RETOUR_ER2
if %ERR% GTR 2 goto RETOUR_ERREURAutre
