Update EVENT_4110 set apmHoPrepAttLteInterFAto = 1  
from EVENT_4110 A
inner
  join topo_cellrelation B
    on 	A.CELL_ID = B.CELL_ID and 
	A.ENB_ID = B.ENB_ID and
	A.NBR_ENB_ID = B.NBR_ENB_ID and
	A.NBR_CELL_ID = B.NBR_CELL_ID
where HOSOURCEORTARGETTYPE = 1  AND PROCHOPREPOUTATTEMPTCAUSE = 14 ;

Update EVENT_4110 set apmHoPrepSuccLteInterFAto = 1 
from EVENT_4110 A
inner
  join topo_cellrelation B
    on 	A.CELL_ID = B.CELL_ID and 
	A.ENB_ID = B.ENB_ID and
	A.NBR_ENB_ID = B.NBR_ENB_ID and
	A.NBR_CELL_ID = B.NBR_CELL_ID
where HOSOURCEORTARGETTYPE = 1 AND PROCHOPREPOUTRESULT = 0 AND PROCHOPREPOUTATTEMPTCAUSE = 14 ;

