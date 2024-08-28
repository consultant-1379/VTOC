Update EVENT_4134 set pmNonPlannedPciMeasFailEutranCgi=1 from EVENT_4134 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where REJECTMEASCAUSE=1 and NONPLANNEDPCIMEASURERESULT=1;
Update EVENT_4134 set pmNonPlannedPciMeasSuccEutranCgi=1 from EVENT_4134 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where NONPLANNEDPCIMEASURERESULT=0;
Update EVENT_4134 set pmDrxMeasSuccCgi=1 from EVENT_4134 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where NONPLANNEDPCIMEASURERESULT=0 and CGIMEASMETHODTYPE=0;
Update EVENT_4134 set pmAgMeasSuccCgi=1 from EVENT_4134 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where NONPLANNEDPCIMEASURERESULT=0 and CGIMEASMETHODTYPE=1;
Update EVENT_4134 set pmDrxMeasSuccCgiQci1=1 from EVENT_4134 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where NONPLANNEDPCIMEASURERESULT=0 and CGIMEASMETHODTYPE=0 and STARTCGIMEASQCI1=1;
Update EVENT_4134 set pmAgMeasSuccCgiQci1=1 from EVENT_4134 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where NONPLANNEDPCIMEASURERESULT=0 and CGIMEASMETHODTYPE=1 and STARTCGIMEASQCI1=1;

