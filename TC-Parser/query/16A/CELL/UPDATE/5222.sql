Update EVENT_5222 set pmNoOfEtwsPrimSucc =1 from EVENT_5222 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where ETWSTYPE=0 or ETWSTYPE=2 and ETWSRESULT=0;
Update EVENT_5222 set pmNoOfEtwsSecSucc =1 from EVENT_5222 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where ETWSTYPE=1 or ETWSTYPE=2 and ETWSRESULT=0;
