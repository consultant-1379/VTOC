Update EVENT_4121 set pmRrcConnReestAttHof = 1 from EVENT_4121 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where  REESTABCAUSE=1;
Update EVENT_4121 set pmRrcConnReestAttOthf = 1 from EVENT_4121 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where  REESTABCAUSE=2;
Update EVENT_4121 set pmRrcConnReestAttRecf = 1 from EVENT_4121 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where  REESTABCAUSE=0;
Update EVENT_4121 set pmRrcConnReestSuccHof = 1 from EVENT_4121 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where  REESTABRESULT=0  AND REESTABCAUSE=1;
Update EVENT_4121 set pmRrcConnReestSuccOthf = 1 from EVENT_4121 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where  REESTABRESULT=0  AND REESTABCAUSE=2;
Update EVENT_4121 set pmRrcConnReestSuccRecf = 1 from EVENT_4121 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where  REESTABRESULT=0  AND REESTABCAUSE=0;
Update EVENT_4121 set pmRrcConnReestAttUeUnknown = 1 from EVENT_4121 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where  REESTABMULTITARGETTYPE=0;
Update EVENT_4121 set pmRrcConnReestSuccUeUnknown = 1 from EVENT_4121 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where  REESTABMULTITARGETTYPE=0 AND REESTABRESULT=0 ; 




