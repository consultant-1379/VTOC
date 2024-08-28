--------------------------------------INTERNAL_EVENT3_S1_ERROR_INDICATION-----------------------------------------------------------

-----1.pmS1ErrorIndEnbMiscS1Cause$------


Update EVENT3_5209 set pmS1ErrorIndEnbMiscS1Cause0 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 4  and  a3GPPCAUSE=0; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbMiscS1Cause1 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 4  and  a3GPPCAUSE=1;   
	
Update EVENT3_5209 set pmS1ErrorIndEnbMiscS1Cause2 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 4  and  a3GPPCAUSE=2;  
	
Update EVENT3_5209 set pmS1ErrorIndEnbMiscS1Cause3 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 4  and  a3GPPCAUSE=3;   
	
Update EVENT3_5209 set pmS1ErrorIndEnbMiscS1Cause4 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 4  and  a3GPPCAUSE=4;  
	
Update EVENT3_5209 set pmS1ErrorIndEnbMiscS1Cause5 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 4  and  a3GPPCAUSE=5;
-----------------------------------------------------------------------------------------------------------------------------------
------2.pmS1ErrorIndEnbNasS1Cause$------


Update EVENT3_5209 set pmS1ErrorIndEnbNasS1Cause0 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 2  and  a3GPPCAUSE=0;                                                                      
Update EVENT3_5209 set pmS1ErrorIndEnbNasS1Cause1 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 2  and  a3GPPCAUSE=1;                                                                      
Update EVENT3_5209 set pmS1ErrorIndEnbNasS1Cause2 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 2  and  a3GPPCAUSE=2;                                                                      
Update EVENT3_5209 set pmS1ErrorIndEnbNasS1Cause3 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 2  and  a3GPPCAUSE=3;                                                                      
Update EVENT3_5209 set pmS1ErrorIndEnbNasS1Cause4 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 2  and  a3GPPCAUSE=4;

---------------------------------------------------------------------------------------------------------------------
-----3.pmS1ErrorIndEnbProtS1Cause$------


Update EVENT3_5209 set pmS1ErrorIndEnbProtS1Cause0 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 3  and  a3GPPCAUSE=0;                                                                      
Update EVENT3_5209 set pmS1ErrorIndEnbProtS1Cause1 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 3  and  a3GPPCAUSE=1;                                                                      
Update EVENT3_5209 set pmS1ErrorIndEnbProtS1Cause2 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 3  and  a3GPPCAUSE=2;                                                                      
Update EVENT3_5209 set pmS1ErrorIndEnbProtS1Cause3 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 3  and  a3GPPCAUSE=3;                                                                      
Update EVENT3_5209 set pmS1ErrorIndEnbProtS1Cause4 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 3  and  a3GPPCAUSE=4; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbProtS1Cause5 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 3  and  a3GPPCAUSE=5; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbProtS1Cause6 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 3  and  a3GPPCAUSE=6;                                                                      

------------------------------------------------------------------------------------------------------------------------------------
------4.pmS1ErrorIndEnbRnlS1Cause$---------




Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause0  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=0;
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause1  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=1;  
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause2  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=2; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause3  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=3;  
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause4  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=4;  
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause5  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=5;
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause6  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=6;  
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause7  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=7; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause8  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=8;  
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause9  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=9; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause10 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=10; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause11 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=11; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause12 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=12; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause13 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=13;
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause14 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=14;
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause15 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=15;  
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause16 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=16; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause17 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=17;  
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause18 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=18; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause19 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=19; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause20 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=20; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause21 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=21; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause22 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=22; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause23 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=23; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause24 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=24; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause25 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=25; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause26 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=26; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause27 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=27; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause28 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=28; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause29 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=29; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause30 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=30; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause31 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=31; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause32 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=32; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause33 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=33;
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause34 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=34; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause35 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=35; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause36 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=36; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause37 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=37; 
	
Update EVENT3_5209 set pmS1ErrorIndEnbRnlS1Cause38 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=38; 



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------5.pmS1ErrorIndEnbTranS1Cause$-----------


Update EVENT3_5209 set pmS1ErrorIndEnbTranS1Cause0 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 1  and  a3GPPCAUSE=0; 
Update EVENT3_5209 set pmS1ErrorIndEnbTranS1Cause1 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 1 and a3GPPCAUSEGROUP = 1  and  a3GPPCAUSE=1; 
-------------------------------------------------------------------------------------------------------------------------------------------------------

-----6.pmS1ErrorIndMmeMiscS1Cause$------------



Update EVENT3_5209 set pmS1ErrorIndMmeMiscS1Cause0 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 4  and  a3GPPCAUSE=0; 
Update EVENT3_5209 set pmS1ErrorIndMmeMiscS1Cause1 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 4  and  a3GPPCAUSE=1; 
Update EVENT3_5209 set pmS1ErrorIndMmeMiscS1Cause2 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 4  and  a3GPPCAUSE=2; 
Update EVENT3_5209 set pmS1ErrorIndMmeMiscS1Cause3 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 4  and  a3GPPCAUSE=3; 
Update EVENT3_5209 set pmS1ErrorIndMmeMiscS1Cause4 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 4  and  a3GPPCAUSE=4; 
Update EVENT3_5209 set pmS1ErrorIndMmeMiscS1Cause5 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 4  and  a3GPPCAUSE=5; 

---------------------------------------------------------------------------------------------------------------------------------------------
-------7.pmS1ErrorIndMmeNasS1Cause$-------------



Update EVENT3_5209 set pmS1ErrorIndMmeNasS1Cause0 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 2  and  a3GPPCAUSE=0;
Update EVENT3_5209 set pmS1ErrorIndMmeNasS1Cause1 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 2  and  a3GPPCAUSE=1;
Update EVENT3_5209 set pmS1ErrorIndMmeNasS1Cause2 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 2  and  a3GPPCAUSE=2;
Update EVENT3_5209 set pmS1ErrorIndMmeNasS1Cause3 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 2  and  a3GPPCAUSE=3;
Update EVENT3_5209 set pmS1ErrorIndMmeNasS1Cause4 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 2  and  a3GPPCAUSE=4; 

------------------------------------------------------------------------------------------------------------------------------------------------------

-----------8.pmS1ErrorIndMmeProtS1Cause$------------------------



Update EVENT3_5209 set pmS1ErrorIndMmeProtS1Cause0 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 3  and  a3GPPCAUSE=0;
Update EVENT3_5209 set pmS1ErrorIndMmeProtS1Cause1 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 3  and  a3GPPCAUSE=1;
Update EVENT3_5209 set pmS1ErrorIndMmeProtS1Cause2 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 3  and  a3GPPCAUSE=2;
Update EVENT3_5209 set pmS1ErrorIndMmeProtS1Cause3 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 3  and  a3GPPCAUSE=3;
Update EVENT3_5209 set pmS1ErrorIndMmeProtS1Cause4 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 3  and  a3GPPCAUSE=4;
Update EVENT3_5209 set pmS1ErrorIndMmeProtS1Cause5 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 3  and  a3GPPCAUSE=5;
Update EVENT3_5209 set pmS1ErrorIndMmeProtS1Cause6 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 3  and  a3GPPCAUSE=6;

-----------------------------------------------------------------------------------------------------------------------------------------------

--------9.pmS1ErrorIndMmeRnlS1Cause$-----------





Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause0  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=0;
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause1  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=1;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause2  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=2;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause3  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=3;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause4  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=4;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause5  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=5;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause6  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=6;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause7  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=7;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause8  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=8;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause9  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=9;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause10 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=10;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause11 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=11;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause12 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=12;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause13 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=13;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause14 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=14;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause15 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=15;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause16 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=16;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause17 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=17;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause18 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=18;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause19 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=19;  
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause20 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=20;    
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause21 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=21; 
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause22 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=22; 
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause23 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=23; 
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause24 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=24; 
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause25 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=25; 
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause26 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=26; 
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause27 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=27; 
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause28 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=28; 
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause29 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=29; 
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause30 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=30; 
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause31 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=31; 
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause32 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=32; 
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause33 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=33; 
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause34 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=34; 
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause35 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=35; 
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause36 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=36; 
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause37 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=37; 
Update EVENT3_5209 set pmS1ErrorIndMmeRnlS1Cause38 =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 0  and  a3GPPCAUSE=38; 

----------------------------------------------------------------------------------------------------------------------------------------

------------------10.pmS1ErrorIndMmeTranS1Cause$--------------

Update EVENT3_5209 set pmS1ErrorIndMmeTranS1Cause0  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 1  and  a3GPPCAUSE=0;
Update EVENT3_5209 set pmS1ErrorIndMmeTranS1Cause1  =   1 from EVENT3_5209 A 
inner
  join TOPO_ENBFUNCTION B
    on A.ENB_ID = B.ENB_ID WHERE MESSAGEDIRECTION = 0 and a3GPPCAUSEGROUP = 1  and  a3GPPCAUSE=1;
