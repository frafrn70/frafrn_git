
%let groupname=Name of Group;

%global _metaperson;

/* Note: The _metaperson macro variable is not set when running a  Stored Process in a  workspace server.
  You would need to set _metaperson manually to test
  for instance:
  %let _metaperson=SAS Demo User;
*/

data _null_;
    length obj  type $256 id $20;
	getperson=symget('_metaperson');
	getgroup=symget('groupname');
	type="";
	id="";
   obj="omsobj:IdentityGroup?IdentityGroup[@Name='"||"&groupname"
   ||"'][MemberIdentities/Person[@Name='"||"&_METAPERSON"||"']]";
   *put obj=;
   rc=metadata_resolve(obj,type,id);
   *put rc=;  /*  This should be 1  */
   if (rc) then do;
      *put type= id=;
      call symput('isamember','1');
      put" &_metaperson is a member of &groupname. "  rc=;
   end;
   else do;
      call symput('isamember','0');
      put "&_metaperson is a not member of &groupname. "  rc=;
   end;
 
run;

%put "Is &_metaperson  a member of &groupname rc= &isamember";
%put "Yes is 1, No is 0.";