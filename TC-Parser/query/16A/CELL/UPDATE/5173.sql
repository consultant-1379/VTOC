Update EVENT_5173 set pmAnrMeasSuccEutranPci = 1 from EVENT_5173 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where  ANRPCIMEASURERESULT=0;
Update EVENT_5173 set pmAnrMeasFailEutranPci = 1 from EVENT_5173 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where  ANRPCIMEASURERESULT=1;
Update EVENT_5173 set pmAnrUeCapFailUtran = 1 from EVENT_5173 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where  (ANRPCIMEASURERESULT=1 AND RAT=2) AND UECAPANRFEATUREINDICATORS > 0 ;
Update EVENT_5173 set pmAnrUeCapFailGeran = 1 from EVENT_5173 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where  (ANRPCIMEASURERESULT=1 AND RAT=1) AND UECAPANRFEATUREINDICATORS > 0 ;
Update EVENT_5173 set pmAnrUeCapSuccGeran = 1 from EVENT_5173 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where  ANRPCIMEASURERESULT=0 AND RAT=1 ;
Update EVENT_5173 set pmAnrUeCapSuccUtran = 1 from EVENT_5173 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where  ANRPCIMEASURERESULT=0 AND RAT=2 ;

