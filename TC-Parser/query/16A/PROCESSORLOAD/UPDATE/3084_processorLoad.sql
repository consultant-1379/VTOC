Update EVENT_3084 set pmProcessorLoadSamp = 1
from EVENT_3084 A
inner
  join topo_processorload B
    on 	A.SLOT_ID = B.SLOT_ID and
	  A.ENB_ID = B.ENB_ID;
	
Update EVENT_3084 set pmProcessorLoadSum =1
from EVENT_3084 A
inner
  join topo_processorload B
    on 	A.SLOT_ID = B.SLOT_ID and
	A.ENB_ID = B.ENB_ID;
	
Update EVENT_3084 set pmProcessorLoadMax = (select MAX(PROCESSORLOAD) from EVENT_3084)
from EVENT_3084 A
inner
  join topo_processorload B
    on 	A.SLOT_ID = B.SLOT_ID and
	A.ENB_ID = B.ENB_ID ;