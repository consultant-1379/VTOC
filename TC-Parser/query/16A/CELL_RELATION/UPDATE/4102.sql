Update EVENT_4102 set apmHoPrepAttLteInterFAto = 1  
from EVENT_4102 A inner   join topo_cellrelation B on A.CELL_ID = B.CELL_ID and 
	A.ENB_ID = B.ENB_ID and
	A.NBR_ENB_ID = B.NBR_ENB_ID and
	A.NBR_CELL_ID = B.NBR_CELL_ID where HOSOURCEORTARGETTYPE = 1  AND PROCHOPREPOUTATTEMPTCAUSE = 14 ;
Update EVENT_4102 set apmHoPrepSuccLteInterFAto = 1 from EVENT_4102 A inner  join topo_cellrelation B  on A.CELL_ID = B.CELL_ID and 
	A.ENB_ID = B.ENB_ID and
	A.NBR_ENB_ID = B.NBR_ENB_ID and
	A.NBR_CELL_ID = B.NBR_CELL_ID where HOSOURCEORTARGETTYPE = 1 AND PROCHOPREPOUTRESULT = 0 AND PROCHOPREPOUTATTEMPTCAUSE = 14 ;
Update EVENT_4102 set pmHoPrepAttAto =1 from EVENT_4102 A inner join topo_cellrelation B on A.CELL_ID = B.CELL_ID and 
	A.ENB_ID = B.ENB_ID and
	A.NBR_RNC_ID = B.NBR_RNC_ID and
	A.NBR_MCC_ID = B.NBR_MCC and
	A.NBR_MNC_ID = B.NBR_MCC and
	A.NBR_CELL_ID = B.NBR_CELL_ID where HOSOURCEORTARGETTYPE=2 and PROCHOPREPOUTATTEMPTCAUSE=14 ;
Update EVENT_4102 set pmHoPrepSuccAto =1 from EVENT_4102 A inner  join topo_cellrelation B on A.CELL_ID = B.CELL_ID and 
	A.ENB_ID = B.ENB_ID and
	A.NBR_RNC_ID = B.NBR_RNC_ID and
	A.NBR_MCC_ID = B.NBR_MCC and
	A.NBR_MNC_ID = B.NBR_MCC and
	A.NBR_CELL_ID = B.NBR_CELL_ID where (HOSOURCEORTARGETTYPE=2 and PROCHOPREPOUTRESULT=0) and PROCHOPREPOUTATTEMPTCAUSE=14 ;
Update EVENT_4102 set pmHoPrepAttSrvccAto =1 from EVENT_4102 A inner join topo_cellrelation B on 	A.CELL_ID = B.CELL_ID and 
	A.ENB_ID = B.ENB_ID and
	A.NBR_RNC_ID = B.NBR_RNC_ID and
	A.NBR_MCC_ID = B.NBR_MCC and
	A.NBR_MNC_ID = B.NBR_MCC and
	A.NBR_CELL_ID = B.NBR_CELL_ID where (HOSOURCEORTARGETTYPE=2 and PROCHOPREPOUTATTEMPTCAUSE=14) and (SRVCCTYPE=1 OR SRVCCTYPE=2);
Update EVENT_4102 set pmHoPrepSuccSrvccAto =1 from EVENT_4102 A inner join topo_cellrelation B on	A.CELL_ID = B.CELL_ID and 
	A.ENB_ID = B.ENB_ID and
	A.NBR_RNC_ID = B.NBR_RNC_ID and
	A.NBR_MCC_ID = B.NBR_MCC and
	A.NBR_MNC_ID = B.NBR_MCC and
	A.NBR_CELL_ID = B.NBR_CELL_ID where (HOSOURCEORTARGETTYPE=2 and PROCHOPREPOUTRESULT=0 and PROCHOPREPOUTATTEMPTCAUSE=14) and (SRVCCTYPE=1 or SRVCCTYPE=2);