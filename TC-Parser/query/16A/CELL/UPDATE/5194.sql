Update EVENT_5194 set pmDrxMeasSuccCgi=1   from EVENT_5194 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where CGIMEASRESULT=0 and CGIMEASMETHODTYPE=0;
Update EVENT_5194 set pmAgMeasSuccCgi=1 from EVENT_5194 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where CGIMEASRESULT=0 and CGIMEASMETHODTYPE=1;
