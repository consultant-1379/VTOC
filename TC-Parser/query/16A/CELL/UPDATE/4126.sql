Update EVENT_4126 set pmUeCtxtModSucc=1 from EVENT_4126 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID;
Update EVENT_4126 set pmUeCtxtModSucc=1 from EVENT_4126 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where UEMODRESULT=0;
