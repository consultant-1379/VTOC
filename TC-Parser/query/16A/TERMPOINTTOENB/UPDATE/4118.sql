Update EVENT_4118 set pmX2ConnEstabFailInMiscX2Cause0 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 4 AND a3GPPCAUSE=0;

Update EVENT_4118 set pmX2ConnEstabFailInMiscX2Cause1 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 4 AND a3GPPCAUSE=1;

Update EVENT_4118 set pmX2ConnEstabFailInMiscX2Cause2 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 4 AND a3GPPCAUSE=2;

Update EVENT_4118 set pmX2ConnEstabFailInMiscX2Cause3 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 4 AND a3GPPCAUSE=3;

Update EVENT_4118 set pmX2ConnEstabFailInMiscX2Cause4 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 4 AND a3GPPCAUSE=4;






Update EVENT_4118 set pmX2ConnEstabFailInProtX2Cause0 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=0;

Update EVENT_4118 set pmX2ConnEstabFailInProtX2Cause1 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=1;

Update EVENT_4118 set pmX2ConnEstabFailInProtX2Cause2 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=2;

Update EVENT_4118 set pmX2ConnEstabFailInProtX2Cause3 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=3;

Update EVENT_4118 set pmX2ConnEstabFailInProtX2Cause4 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=4;

Update EVENT_4118 set pmX2ConnEstabFailInProtX2Cause5 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=5;

Update EVENT_4118 set pmX2ConnEstabFailInProtX2Cause6 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=6;


Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause0 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=0;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause1 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=1;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause2 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=2;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause3 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=3;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause4 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=4;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause5 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=5;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause6 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=6;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause7 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=7;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause8 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=8;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause9 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=9;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause10 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=10;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause11 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=11;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause12 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=12;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause13 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=13;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause14 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=14;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause15 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=15;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause16 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=16;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause17 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=17;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause18 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=18;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause19 = 1
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
 where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=19;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause20 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=20;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause21 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=21;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause22 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=22;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause23 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=23;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause24 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=24;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause25 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=25;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause26 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=26;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause27 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=27;

Update EVENT_4118 set pmX2ConnEstabFailInRnlX2Cause28 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=28;


Update EVENT_4118 set pmX2ConnEstabFailInTranX2Cause0 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 1 AND a3GPPCAUSE=0;

Update EVENT_4118 set pmX2ConnEstabFailInTranX2Cause1 = 1
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
 where  (X2SETUPRESULT != 0 and X2CAUSE = 1 ) AND a3GPPCAUSEGROUP = 1 AND a3GPPCAUSE=1;





Update EVENT_4118 set pmX2ConnEstabFailOutMiscX2Cause0 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 4  AND a3GPPCAUSE=0;

Update EVENT_4118 set pmX2ConnEstabFailOutMiscX2Cause1 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 4  AND a3GPPCAUSE=1;

Update EVENT_4118 set pmX2ConnEstabFailOutMiscX2Cause2 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 4 AND a3GPPCAUSE=2;

Update EVENT_4118 set pmX2ConnEstabFailOutMiscX2Cause3 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 4 AND a3GPPCAUSE=3;

Update EVENT_4118 set pmX2ConnEstabFailOutMiscX2Cause4 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 4 AND a3GPPCAUSE=4;





Update EVENT_4118 set pmX2ConnEstabFailOutProtX2Cause0 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=0 ;

Update EVENT_4118 set pmX2ConnEstabFailOutProtX2Cause1 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=1 ;

Update EVENT_4118 set pmX2ConnEstabFailOutProtX2Cause2 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=2 ;

Update EVENT_4118 set pmX2ConnEstabFailOutProtX2Cause3 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=3 ;

Update EVENT_4118 set pmX2ConnEstabFailOutProtX2Cause4 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=4;

Update EVENT_4118 set pmX2ConnEstabFailOutProtX2Cause5 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=5 ;

Update EVENT_4118 set pmX2ConnEstabFailOutProtX2Cause6 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 3 AND a3GPPCAUSE=6 ;




Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause0 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=0;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause1 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=1;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause2 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=2;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause3 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=3;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause4 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=4;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause5 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and

		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=5;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause6 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=6;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause7 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=7;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause8 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=8;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause9 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=9;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause10 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=10;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause11 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=11;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause12 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=12;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause13 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=13;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause14 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=14;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause15 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=15;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause16 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=16;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause17 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=17;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause18 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=18;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause19 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=19;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause20 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=20;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause21 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=21;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause22 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=22;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause23 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=23;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause24 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=24;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause25 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=25;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause26 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=26;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause27 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=27;

Update EVENT_4118 set pmX2ConnEstabFailOutRnlX2Cause28 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 0 AND a3GPPCAUSE=28;


Update EVENT_4118 set pmX2ConnEstabFailOutTranX2Cause0 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 1 AND a3GPPCAUSE=0;

Update EVENT_4118 set pmX2ConnEstabFailOutTranX2Cause1 = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  (X2SETUPRESULT != 0 and X2CAUSE = 0 ) AND a3GPPCAUSEGROUP = 1 AND a3GPPCAUSE=1;

Update EVENT_4118 set pmX2ConnEstabSucc = 1 
from EVENT_4118 A
inner
  join topo_termpointtoenb B
    on 	A.EXTENB_ID = B.EXTENB_ID and
		A.MCC = B.MCC and
		A.ENB_ID = B.ENB_ID and
		A.MNC = B.MNC
where  X2SETUPRESULT = 0;