Update EVENT_4117 set pmAnrMeasFailEutranCgi  = 1 from EVENT_4117 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID WHERE REJECTMEASCAUSE =1 and ANRMEASURERESULT = 1;	
Update EVENT_4117 set pmAnrMeasSuccEutranCgi  = 1 from EVENT_4117 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID WHERE ANRMEASURERESULT = 0; 
Update EVENT_4117 set pmDrxMeasSuccCgi  = 1 from EVENT_4117 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID WHERE ANRMEASURERESULT = 0 and  CGIMEASMETHODTYPE=0;
UPDATE EVENT_4117 SET pmAgMeasSuccCgi=1 from EVENT_4117 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID WHERE ANRMEASURERESULT=0 AND CGIMEASMETHODTYPE = 1; 