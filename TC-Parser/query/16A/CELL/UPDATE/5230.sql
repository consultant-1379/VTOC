Update EVENT_5230 set pmAdvCellSupRecoveryCellSucc =1 from EVENT_5230 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where ADVCELLSUPRECOVERYMETHOD=0;
Update EVENT_5230 set pmAdvCellSupRecoveryNodeSucc =1 from EVENT_5230 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where ADVCELLSUPRECOVERYMETHOD=1;


