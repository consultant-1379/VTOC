Update EVENT_4116 set pmS1ConnEstabFailMiscS1Cause0 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
	A.MME_GROUP_ID = B.MME_GROUP_ID and
	A.MCC = B.MCC and
	A.ENB_ID = B.ENB_ID and
	A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 4 AND a3GPPCAUSE=0;

Update EVENT_4116 set pmS1ConnEstabFailMiscS1Cause1 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
	A.MME_GROUP_ID = B.MME_GROUP_ID and
	A.MCC = B.MCC and
	A.ENB_ID = B.ENB_ID and
	A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 4 AND a3GPPCAUSE=1;

Update EVENT_4116 set pmS1ConnEstabFailMiscS1Cause2 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 4 AND a3GPPCAUSE=2;

Update EVENT_4116 set pmS1ConnEstabFailMiscS1Cause3 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 4 AND a3GPPCAUSE=3;

Update EVENT_4116 set pmS1ConnEstabFailMiscS1Cause4 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 4 AND a3GPPCAUSE=4;

Update EVENT_4116 set pmS1ConnEstabFailMiscS1Cause5 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
	    A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 4 AND a3GPPCAUSE=5;



Update EVENT_4116 set pmS1ConnEstabFailNasS1Cause0 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 2 AND a3GPPCAUSE=0 AND a3GPPCAUSE=0;

Update EVENT_4116 set pmS1ConnEstabFailNasS1Cause1 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 2 AND a3GPPCAUSE=0 AND a3GPPCAUSE=1;

Update EVENT_4116 set pmS1ConnEstabFailNasS1Cause2 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 2 AND a3GPPCAUSE=0 AND a3GPPCAUSE=2;

Update EVENT_4116 set pmS1ConnEstabFailNasS1Cause3 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 2 AND a3GPPCAUSE=0 AND a3GPPCAUSE=3;

Update EVENT_4116 set pmS1ConnEstabFailNasS1Cause4 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 2 AND a3GPPCAUSE=0 AND a3GPPCAUSE=4;


Update EVENT_4116 set pmS1ConnEstabFailProtS1Cause0 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=0;

Update EVENT_4116 set pmS1ConnEstabFailProtS1Cause1 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=1;

Update EVENT_4116 set pmS1ConnEstabFailProtS1Cause2 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
	    A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=2;

Update EVENT_4116 set pmS1ConnEstabFailProtS1Cause3 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=3;

Update EVENT_4116 set pmS1ConnEstabFailProtS1Cause4 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=4;

Update EVENT_4116 set pmS1ConnEstabFailProtS1Cause5 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=5;

Update EVENT_4116 set pmS1ConnEstabFailProtS1Cause6 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=6;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause0 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=0;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause1 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=1;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause2 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=2;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause3 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=3;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause4 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=4;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause5 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=5;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause6 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=6;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause7 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=7;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause8 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=8;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause9 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=9;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause10 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=10;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause11 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=11;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause12 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=12;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause13 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=13;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause14 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=14;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause15 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=15;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause16 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=16;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause17 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=17;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause18 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=18;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause19 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=19;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause20 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=20;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause21 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=21;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause22 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
        A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=22;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause23 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=23;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause24 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=24;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause25 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=25;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause26 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=26;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause27 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=27;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause28 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=28;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause29 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=29;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause30 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=30;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause31 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=31;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause32 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=32;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause33 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=33;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause34 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=34;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause35 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=35;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause36 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=36;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause37 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=37;

Update EVENT_4116 set pmS1ConnEstabFailRnlS1Cause38 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=38;


Update EVENT_4116 set pmS1ConnEstabFailTranS1Cause0 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 1 AND a3GPPCAUSE=0;

Update EVENT_4116 set pmS1ConnEstabFailTranS1Cause1 = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT != 0  AND a3GPPCAUSEGROUP = 1 AND a3GPPCAUSE=1;


Update EVENT_4116 set pmS1ConnEstabSucc = 1 
from EVENT_4116 A
inner join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
		where S1SETUPRESULT = 0;

Update EVENT_4116 set pmS1ConnEstabTimeDistr = 1 
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where S1SETUPRESULT = 0;

Update EVENT_4116 set pmS1ConnEstabTimeSum = ( select max(((TIMESTAMPSTOPHOUR-TIMESTAMPSTARTHOUR)*3600000) + (( TIMESTAMPSTOPMINUTE-TIMESTAMPSTARTMINUTE)*60000) + ((TIMESTAMPSTOPSECOND
-TIMESTAMPSTARTSECOND)*1000) 
+ (TIMESTAMPSTOPMILLISEC-TIMESTAMPSTARTMILLISEC)) AS 'Duration'  from EVENT_4116 where S1SETUPRESULT = 0 )
from EVENT_4116 A
inner
  join topo_termpointtomme B
    on 	A.MME_CODE = B.MME_CODE and
		A.MME_GROUP_ID = B.MME_GROUP_ID and
        A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC;