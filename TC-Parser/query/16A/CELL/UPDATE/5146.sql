Update EVENT_5146 set pmAnrNeighbrelAddEUtran=1 from EVENT_5146 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where ANRRESULT=0;
Update EVENT_5146 set pmAnrNeighbrelAddGeran =1 from EVENT_5146 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where ANRRESULT=0 AND RAT=1;
Update EVENT_5146 set pmAnrNeighbrelAddUtran=1 from EVENT_5146 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where ANRRESULT=0 AND RAT=2;