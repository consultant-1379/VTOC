Alter Table EVENT3_4124 add MOID as varchar(12) default(null);

Update EVENT3_4124
set MOID =TOPO_ENBFUNCTION.MOID from TOPO_ENBFUNCTION INNER JOIN EVENT3_4124 ON TOPO_ENBFUNCTION.ENB_ID=EVENT3_4124.ENB_ID;


Alter Table EVENT3_5209 add MOID as varchar(12) default(null);

Update EVENT3_5209
set MOID =TOPO_ENBFUNCTION.MOID from TOPO_ENBFUNCTION INNER JOIN EVENT3_5209 ON TOPO_ENBFUNCTION.ENB_ID=EVENT3_5209.ENB_ID;


Alter Table EVENT3_4123 add MOID as varchar(12) default(null);

Update EVENT3_4123
set MOID =TOPO_ENBFUNCTION.MOID from TOPO_ENBFUNCTION INNER JOIN EVENT3_4123 ON TOPO_ENBFUNCTION.ENB_ID=EVENT3_4123.ENB_ID;


Alter Table EVENT3_5210 add MOID as varchar(12) default(null);

Update EVENT3_5210
set MOID =TOPO_ENBFUNCTION.MOID from TOPO_ENBFUNCTION INNER JOIN EVENT3_5210 ON TOPO_ENBFUNCTION.ENB_ID=EVENT3_5210.ENB_ID;


