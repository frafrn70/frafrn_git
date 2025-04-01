options metaserver='localhost' 
metaprotocol=bridge 
metarepository="Foundation" 
		metauser='sasadm' 
		metaport=8561 
		metapass='sasadm';

%let repository=Foundation;
%let Appserv=SASMain;

/*
	Exemple XML associ� � un ACE et affich� via le Metadata Utility
*/
/*
<AccessControlEntry Id="A5CGYKEA.A8001I0L" Name="ace79.34979948742283" MetadataCreated="07Jan2008:18:15:43" MetadataUpdated="07Jan2008:18:21:38">
	<Identities>
		<Person Id="A5CGYKEA.AR000D4B" Name="USR3"/></Identities>
	<Objects>
		<PhysicalTable Id="A5CGYKEA.BG000WEP" Name="VENTES_DIMPROD_3"/></Objects>
	<Permissions>
		<Permission Id="A5CGYKEA.A2000001" Name="ReadMetadata"/></Permissions>
</AccessControlEntry>
*/

/*
	Exemple Code de cr�ation d'ACE
/*
Voir 
Load_ACTs.sas
sous
C:\Documents and Settings\frafrn\Mes documents\Franck\Interventions\Inter_Save_Tmp\00_En cours\2007\2007_RTE\2007_01_RTE_Authentification\Habilitations\Scripts_ACTs\Livraison\2007_03_08\Livraison
*/
data tb_tst;
		length type id_ACE $256;
	
		/* Test l'existence �ventuel de l'objet avant de le cr�er */
		id_ACE="";
		rc=metadata_newobj
				(
					"AccessControlEntry",
					id_ACE,
					"tst_ACE1",
					"Foundation"
				);/*On cr�e l'ACE*/
		output;
		rc=metadata_setattr
				(
					id_ACE,
					"Desc",
					"tst_ACE1 cr�� par script"
				);/*On met une description pour indiquer la cr�ation par script*/
		output;
	
		rc=METADATA_SETASSN
				(
					id_ACE,
					/*"omsobj:AccessControlEntry?@Name='tst_ACE1 cr�� par script'",*/
					/*"omsobj:AccessControlEntry?@Name='tst_ACE1'",*/
					"Objects",
	                "Append", 
					"omsobj:PhysicalTable?@Name='TB_TST_NON_ADDITIVE'");
		output;
		rc=METADATA_SETASSN
				(
					id_ACE,
					"Identities",
	                "Append", 
					"omsobj:Person?@Name='USR3'", 
					"omsobj:Person?@Name ='USR5'");

					output;
*/
					rc=METADATA_SETASSN
				(
					id_ACE,
					"Permissions",
	                "Append", 
					/*"omsobj:Permission?@Name='ReadMetadata' AND @Type='grant'");*/
					"omsobj:Permission?@Id='A5CGYKEA.A2000001'");


		output;

run ;


