Update EVENT_4120 set pmRrcConnReconfAgSucc = 1 from EVENT_4120 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where RRCRECONFIGRESULT = 0 AND (RRCRECONFIGCAUSE = 11 or RRCRECONFIGCAUSE = 12 ) ;
Update EVENT_4120 set pmRrcConnReconfAgSuccQci1 = (case when RRCRECONFIGRESULT = 0 and (RRCRECONFIGCAUSE = 12 or RRCRECONFIGCAUSE = 15) and STARTCGIMEASQCI1 = 1 then 1 else 0 end) from EVENT_4120 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID;
Update EVENT_4120 set pmRrcConnReconfDrxFail = (case when RRCRECONFIGRESULT = 1 and (RRCRECONFIGCAUSE = 0 or RRCRECONFIGCAUSE = 7 or RRCRECONFIGCAUSE = 14) then 1 else 0 end) from EVENT_4120 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID;
Update EVENT_4120 set pmRrcConnReconfDrxSucc = (case when RRCRECONFIGRESULT = 0 and (RRCRECONFIGCAUSE = 0 or RRCRECONFIGCAUSE = 7 or RRCRECONFIGCAUSE = 14) then 1 else 0 end) from EVENT_4120 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID;
Update EVENT_4120 set pmRrcConnReconfDrxSuccQci1 = (case when RRCRECONFIGRESULT = 0 and (RRCRECONFIGCAUSE = 7 or RRCRECONFIGCAUSE = 14) and STARTCGIMEASQCI1 = 1 then 1 else 0 end) from EVENT_4120 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID;





