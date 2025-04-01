/*
Voir documentation à l'adresse
 http://support.sas.com/onlinedoc/913/getDoc/en/bisecag.hlp/a003094012.htm
*/

options metaserver=localhost
metaport=8561

metauser='sasadm'

metapass='11@@abcd'

metarepository=Foundation;

%mdugrpac

(scope=ALL,

mode=EXECUTE);
