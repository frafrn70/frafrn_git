libname temp "/data/flf/files/work/to_del";
filename fic_dat pipe "gunzip -c /users/bdlra/EBDLDSFD.20050419.dat.gz";
data temp_delta_19;
infile fic_dat dsd missover dlm="|";
attrib 
	SRVFCDOS_CLIENT_NU length=$10 format=$10. informat=$10. label="N° client"
	SRVFCDOS_DOSSIER_NU length=$10 format=$10. informat=$10. label="N° dossier"
	SRVFCDOS_PRESFACT_CO length=$5 format=$5. informat=$5. label="Code prestation"
	SRVFCDOS_DT_DEBUT length=4 format=DDMMYY10. informat=YYMMDD8. label="Date debut prestation" 
	SRVFCDOS_DT_FIN length=4 format=DDMMYY10. informat=YYMMDD8. label="Date fin prestation"
	SRVFCDOS_MT_TARIF_PREST length=8 format=COMMAX20. informat=COMMA20. label="Tarif prestation"
	SRVFCDOS_NB_QUANT length=8 format=3. informat=3. label="Quantite prestation"
	SRVFCDOS_IN_PONCT_TERM length=$2 format=$2. informat=$2. label="Nature prestation"
	SRVFCDOS_CO_PROD length=$5 format=$5. informat=$5. label="Produit code"
	SRVFCDOS_NU_SEQ length=4 format=4. informat=4. label="Numero sequence" ;
run;
