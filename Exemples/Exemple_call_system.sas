{\rtf1\ansi\ansicpg1252\deff0\deflang1036{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\*\generator Msftedit 5.41.15.1503;}\viewkind4\uc1\pard\f0\fs20 data _null_;\par
\tab command="copy &file1&dfile &file2" ;\par
\tab call system(command);\par
\tab command="ren &file2&dfile &dfile..xls";\par
\tab call system(command);\par
run;\par
}
 