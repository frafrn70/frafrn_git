PROC METAOPERATE
SERVER="localhost"
PORT=8561
USERID="sasadm"
PASSWORD="sasadm"
ACTION=REFRESH
OPTIONS="<ARM ARMSUBSYS=""(arm_oma, arm_dsio, arm_iom)"" ARMLOC=""C:\SAS\EntBIServer\Lev1\SASMain\MetadataServer\logs\omaarmlog.log""/>"
NOAUTOPAUSE;
RUN;
