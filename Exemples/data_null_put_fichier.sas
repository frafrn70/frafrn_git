/* 
   Code pour �crire dans un fichier externe.
   Option mod pour �tre en mise � jour

*/


      %let var1=aaa;
      filename file "/tmp/tmp_put.txt";
         data _null_;
         file file mod;
         put "&var1";
         run;
