Update EVENT_5147 set pmAnrNeighbrelDelGeran=1   from EVENT_5147 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where ANRRESULT=0 and RAT=1;
Update EVENT_5147 set pmAnrNeighbrelDelUtran=1   from EVENT_5147 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where ANRRESULT=0 and RAT=2;