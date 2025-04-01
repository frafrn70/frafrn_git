options linesize=250;
   /*------------------------------------*/
   /* Create SALES data set.             */
   /*------------------------------------*/

data libprod.tb_tst;
  length product  $9;
  input product invoice renewal;
datalines;
FSP        1270.00        570
SAS        1650.00        850
STAT       570.00         0
STAT       970.82         600
OR         239.36         0
SAS        7478.71        1100
SAS        800.00         800
;


   /*----------------------------------*/
   /* Create an audit trail with a     */
   /* user variable.                   */
   /*----------------------------------*/

proc datasets lib=libprod nolist;
  audit tb_tst;
    initiate;
    user_var reason_code $ 20;
run;



   /*----------------------------------*/
   /* Do an update.                    */
   /*----------------------------------*/
 proc sql;
   insert into libprod.tb_tst
       set product = 'AUDIT',
           invoice = 2000,
           renewal = 970,
       reason_code = "Add new product";
quit;

 proc sql;
   update libprod.tb_tst
       set product = 'AUDIT3'
   where product = 'AUDIT2';
quit;

   /*----------------------------------------*/
   /* Print the audit trail. */
   /*----------------------------------------*/
proc sql;
  create table tb_audit as
	select product,
         reason_code,
         _atopcode_,
         _atuserid_ format=$6.,
         _atdatetime_
         from libprod.tb_tst(type=audit);
quit;
