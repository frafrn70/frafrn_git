/* 
   Code pour écrire dans un fichier externe.
   Option mod pour être en mise à jour

*/


      %let var1=aaa;
      filename file "/tmp/tmp_put.txt";
         data _null_;
         file file mod;
         put "&var1";
         run;
