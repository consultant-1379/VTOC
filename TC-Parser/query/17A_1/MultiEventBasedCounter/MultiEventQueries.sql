drop table if exists DCTRS_MultiEventCounter;
create table DCTRS_MultiEventCounter (gritEVENTID INTEGER NULL,
  CounterName Varchar(45) NULL,
 CounterValue bigint NULL,
 MOID Varchar(255) NULL);


insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmhoexeattlteinterfuemeas',Sum(pmhoexeattlteinterfuemeas),CELLRELATIONMOID from DCTRS_4104 group by CELLRELATIONMOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmhoexeattlteinterfuemeas',Sum(pmhoexeattlteinterfuemeas),CELLRELATIONMOID from DCTRS_4112 group by CELLRELATIONMOID , gritEventID;

 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)  
 Select gritEventID,'pmhoexeattlteinterfuemeasrsrp',Sum(pmhoexeattlteinterfuemeasrsrp),CELLRELATIONMOID from DCTRS_4104 group by CELLRELATIONMOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmhoexeattlteinterfuemeasrsrp',Sum(pmhoexeattlteinterfuemeasrsrp),CELLRELATIONMOID from DCTRS_4112 group by CELLRELATIONMOID , gritEventID;

 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExeAttBlindInterFreq',Sum(pmHoExeAttBlindInterFreq),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExeAttBlindInterFreq',Sum(pmHoExeAttBlindInterFreq),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExeAttBlindIntraFreq',Sum(pmHoExeAttBlindIntraFreq),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExeAttBlindIntraFreq',Sum(pmHoExeAttBlindIntraFreq),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExeAttMeasBasedInterFreq',Sum(pmHoExeAttMeasBasedInterFreq),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExeAttMeasBasedInterFreq',Sum(pmHoExeAttMeasBasedInterFreq),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExeAttMeasBasedIntraFreq',Sum(pmHoExeAttMeasBasedIntraFreq),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExeAttMeasBasedIntraFreq',Sum(pmHoExeAttMeasBasedIntraFreq),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig0',Sum(pmHoExecAttDrxConfig0),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig0',Sum(pmHoExecAttDrxConfig0),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig1',Sum(pmHoExecAttDrxConfig1),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig1',Sum(pmHoExecAttDrxConfig1),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig2',Sum(pmHoExecAttDrxConfig2),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig2',Sum(pmHoExecAttDrxConfig2),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig3',Sum(pmHoExecAttDrxConfig3),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig3',Sum(pmHoExecAttDrxConfig3),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig4',Sum(pmHoExecAttDrxConfig4),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig4',Sum(pmHoExecAttDrxConfig4),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig5',Sum(pmHoExecAttDrxConfig5),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig5',Sum(pmHoExecAttDrxConfig5),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig6',Sum(pmHoExecAttDrxConfig6),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig6',Sum(pmHoExecAttDrxConfig6),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig7',Sum(pmHoExecAttDrxConfig7),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig7',Sum(pmHoExecAttDrxConfig7),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig8',Sum(pmHoExecAttDrxConfig8),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig8',Sum(pmHoExecAttDrxConfig8),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig9',Sum(pmHoExecAttDrxConfig9),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig9',Sum(pmHoExecAttDrxConfig9),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig10',Sum(pmHoExecAttDrxConfig10),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig10',Sum(pmHoExecAttDrxConfig10),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig11',Sum(pmHoExecAttDrxConfig11),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig11',Sum(pmHoExecAttDrxConfig11),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig12',Sum(pmHoExecAttDrxConfig12),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig12',Sum(pmHoExecAttDrxConfig12),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig13',Sum(  pmHoExecAttDrxConfig13),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig13',Sum(  pmHoExecAttDrxConfig13),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig14',Sum(pmHoExecAttDrxConfig14),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig14',Sum(pmHoExecAttDrxConfig14),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig15',Sum(pmHoExecAttDrxConfig15),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig15',Sum(pmHoExecAttDrxConfig15),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig16',Sum(pmHoExecAttDrxConfig16),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig16',Sum(pmHoExecAttDrxConfig16),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig17',Sum(pmHoExecAttDrxConfig17),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig17',Sum(pmHoExecAttDrxConfig17),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig18',Sum(pmHoExecAttDrxConfig18),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig18',Sum(pmHoExecAttDrxConfig18),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig19',Sum(pmHoExecAttDrxConfig19),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig19',Sum(pmHoExecAttDrxConfig19),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig20',Sum(pmHoExecAttDrxConfig20),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig20',Sum(pmHoExecAttDrxConfig20),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig21',Sum(pmHoExecAttDrxConfig21),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig21',Sum(pmHoExecAttDrxConfig21),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig22',Sum(pmHoExecAttDrxConfig22),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig22',Sum(pmHoExecAttDrxConfig22),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig23',Sum(pmHoExecAttDrxConfig23),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig23',Sum(pmHoExecAttDrxConfig23),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig24',Sum(pmHoExecAttDrxConfig24),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig24',Sum(pmHoExecAttDrxConfig24),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig25',Sum(pmHoExecAttDrxConfig25),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig25',Sum(pmHoExecAttDrxConfig25),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig26',Sum(pmHoExecAttDrxConfig26),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig26',Sum(pmHoExecAttDrxConfig26),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig27',Sum(pmHoExecAttDrxConfig27),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig27',Sum(pmHoExecAttDrxConfig27),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig28',Sum(pmHoExecAttDrxConfig28),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig28',Sum(pmHoExecAttDrxConfig28),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig29',Sum(pmHoExecAttDrxConfig29),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig29',Sum(pmHoExecAttDrxConfig29),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig30',Sum(pmHoExecAttDrxConfig30),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig30',Sum(pmHoExecAttDrxConfig30),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig31',Sum(pmHoExecAttDrxConfig31),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig31',Sum(pmHoExecAttDrxConfig31),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig32',Sum(pmHoExecAttDrxConfig32),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig32',Sum(pmHoExecAttDrxConfig32),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig33',Sum(pmHoExecAttDrxConfig33),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig33',Sum(pmHoExecAttDrxConfig33),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig34',Sum(pmHoExecAttDrxConfig34),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig34',Sum(pmHoExecAttDrxConfig34),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig35',Sum(pmHoExecAttDrxConfig35),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig35',Sum(pmHoExecAttDrxConfig35),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig36',Sum(pmHoExecAttDrxConfig36),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig36',Sum(pmHoExecAttDrxConfig36),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig37',Sum(pmHoExecAttDrxConfig37),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig37',Sum(pmHoExecAttDrxConfig37),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig38',Sum(pmHoExecAttDrxConfig38),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig38',Sum(pmHoExecAttDrxConfig38),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig39',Sum(pmHoExecAttDrxConfig39),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig39',Sum(pmHoExecAttDrxConfig39),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig40',Sum(pmHoExecAttDrxConfig40),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig40',Sum(pmHoExecAttDrxConfig40),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig41',Sum(pmHoExecAttDrxConfig41),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig41',Sum(pmHoExecAttDrxConfig41),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig42',Sum(pmHoExecAttDrxConfig42),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig42',Sum(pmHoExecAttDrxConfig42),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig43',Sum(pmHoExecAttDrxConfig43),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecAttDrxConfig43',Sum(pmHoExecAttDrxConfig43),MOID from DCTRS_4112 group by MOID , gritEventID;
 
insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecOutFailCause1',Sum(pmHoExecOutFailCause1),MOID from DCTRS_4104 group by MOID , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecOutFailCause1',Sum(pmHoExecOutFailCause1),MOID from DCTRS_4112 group by MOID , gritEventID;
  
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmHoExecOutFailCause2',Sum(pmHoExecOutFailCause2),MOID from DCTRS_4104 group by MOID , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecOutFailCause2',Sum(pmHoExecOutFailCause2),MOID from DCTRS_4112 group by MOID , gritEventID;
 
  insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmHoExecOutFailCause3',Sum(pmHoExecOutFailCause3),MOID  from DCTRS_4104 group by MOID , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecOutFailCause3',Sum(pmHoExecOutFailCause3),MOID  from DCTRS_4112 group by MOID , gritEventID;
 
   insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmHoExecOutFailCause4',Sum(pmHoExecOutFailCause4),MOID  from DCTRS_4104 group by MOID , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecOutFailCause4',Sum(pmHoExecOutFailCause4),MOID  from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmHoExecOutFailCause5',Sum(pmHoExecOutFailCause5),MOID  from DCTRS_4104 group by MOID , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecOutFailCause5',Sum(pmHoExecOutFailCause5),MOID  from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmHoExecOutFailCause6',Sum(pmHoExecOutFailCause6),MOID  from DCTRS_4104 group by MOID , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecOutFailCause6',Sum(pmHoExecOutFailCause6),MOID  from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmhoexesucclteinterfuemeasrsrp',Sum(pmhoexesucclteinterfuemeasrsrp),CELLRELATIONMOID  from DCTRS_4104 group by CELLRELATIONMOID , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmhoexesucclteinterfuemeasrsrp',Sum(pmhoexesucclteinterfuemeasrsrp),CELLRELATIONMOID  from DCTRS_4112 group by CELLRELATIONMOID , gritEventID;

 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmhoexesucclteinterfuemeas',Sum(pmhoexesucclteinterfuemeas),CELLRELATIONMOID  from DCTRS_4104 group by CELLRELATIONMOID , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmhoexesucclteinterfuemeas',Sum(pmhoexesucclteinterfuemeas),CELLRELATIONMOID  from DCTRS_4112 group by CELLRELATIONMOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig0',Sum(pmHoExecSuccDrxConfig0),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig0',Sum(pmHoExecSuccDrxConfig0),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig1',Sum(pmHoExecSuccDrxConfig1),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig1',Sum(pmHoExecSuccDrxConfig1),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig2',Sum(pmHoExecSuccDrxConfig2),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig2',Sum(pmHoExecSuccDrxConfig2),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig3',Sum(pmHoExecSuccDrxConfig3),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig3',Sum(pmHoExecSuccDrxConfig3),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig4',Sum(pmHoExecSuccDrxConfig4),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig4',Sum(pmHoExecSuccDrxConfig4),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig5',Sum(pmHoExecSuccDrxConfig5),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig5',Sum(pmHoExecSuccDrxConfig5),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig6',Sum(pmHoExecSuccDrxConfig6),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig6',Sum(pmHoExecSuccDrxConfig6),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig7',Sum(pmHoExecSuccDrxConfig7),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig7',Sum(pmHoExecSuccDrxConfig7),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig8',Sum(pmHoExecSuccDrxConfig8),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig8',Sum(pmHoExecSuccDrxConfig8),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig9',Sum(pmHoExecSuccDrxConfig9),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig9',Sum(pmHoExecSuccDrxConfig9),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig10',Sum(pmHoExecSuccDrxConfig10),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig10',Sum(pmHoExecSuccDrxConfig10),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig11',Sum(pmHoExecSuccDrxConfig11),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig11',Sum(pmHoExecSuccDrxConfig11),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig12',Sum(pmHoExecSuccDrxConfig12),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig12',Sum(pmHoExecSuccDrxConfig12),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig13',Sum(pmHoExecSuccDrxConfig13),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig13',Sum(pmHoExecSuccDrxConfig13),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig14',Sum(pmHoExecSuccDrxConfig14),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig14',Sum(pmHoExecSuccDrxConfig14),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig15',Sum(pmHoExecSuccDrxConfig15),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig15',Sum(pmHoExecSuccDrxConfig15),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig16',Sum(pmHoExecSuccDrxConfig16),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig16',Sum(pmHoExecSuccDrxConfig16),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig17',Sum(pmHoExecSuccDrxConfig17),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig17',Sum(pmHoExecSuccDrxConfig17),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig18',Sum(pmHoExecSuccDrxConfig18),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig18',Sum(pmHoExecSuccDrxConfig18),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig19',Sum(pmHoExecSuccDrxConfig19),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig19',Sum(pmHoExecSuccDrxConfig19),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig20',Sum(pmHoExecSuccDrxConfig20),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig20',Sum(pmHoExecSuccDrxConfig20),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig21',Sum(pmHoExecSuccDrxConfig21),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig21',Sum(pmHoExecSuccDrxConfig21),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig22',Sum(pmHoExecSuccDrxConfig22),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig22',Sum(pmHoExecSuccDrxConfig22),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig23',Sum(pmHoExecSuccDrxConfig23),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig23',Sum(pmHoExecSuccDrxConfig23),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig24',Sum(pmHoExecSuccDrxConfig24),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig24',Sum(pmHoExecSuccDrxConfig24),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig25',Sum(pmHoExecSuccDrxConfig25),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig25',Sum(pmHoExecSuccDrxConfig25),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig26',Sum(pmHoExecSuccDrxConfig26),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig26',Sum(pmHoExecSuccDrxConfig26),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig27',Sum(pmHoExecSuccDrxConfig27),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig27',Sum(pmHoExecSuccDrxConfig27),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig28',Sum(pmHoExecSuccDrxConfig28),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig28',Sum(pmHoExecSuccDrxConfig28),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig29',Sum(pmHoExecSuccDrxConfig29),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig29',Sum(pmHoExecSuccDrxConfig29),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig30',Sum(pmHoExecSuccDrxConfig30),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig30',Sum(pmHoExecSuccDrxConfig30),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig31',Sum(pmHoExecSuccDrxConfig31),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig31',Sum(pmHoExecSuccDrxConfig31),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig32',Sum(pmHoExecSuccDrxConfig32),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig32',Sum(pmHoExecSuccDrxConfig32),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig33',Sum(pmHoExecSuccDrxConfig33),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig33',Sum(pmHoExecSuccDrxConfig33),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig34',Sum(pmHoExecSuccDrxConfig34),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig34',Sum(pmHoExecSuccDrxConfig34),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig35',Sum(pmHoExecSuccDrxConfig35),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig35',Sum(pmHoExecSuccDrxConfig35),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig36',Sum(pmHoExecSuccDrxConfig36),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig36',Sum(pmHoExecSuccDrxConfig36),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig37',Sum(pmHoExecSuccDrxConfig37),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig37',Sum(pmHoExecSuccDrxConfig37),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig38',Sum(pmHoExecSuccDrxConfig38),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig38',Sum(pmHoExecSuccDrxConfig38),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig39',Sum(pmHoExecSuccDrxConfig39),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig39',Sum(pmHoExecSuccDrxConfig39),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig40',Sum(pmHoExecSuccDrxConfig40),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig40',Sum(pmHoExecSuccDrxConfig40),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig41',Sum(pmHoExecSuccDrxConfig41),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig41',Sum(pmHoExecSuccDrxConfig41),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig42',Sum(pmHoExecSuccDrxConfig42),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig42',Sum(pmHoExecSuccDrxConfig42),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig43',Sum(pmHoExecSuccDrxConfig43),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExecSuccDrxConfig43',Sum(pmHoExecSuccDrxConfig43),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExeSuccBlindInterFreq',Sum(pmHoExeSuccBlindInterFreq),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExeSuccBlindInterFreq',Sum(pmHoExeSuccBlindInterFreq),MOID from DCTRS_4112 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExeSuccBlindIntraFreq',Sum(pmHoExeSuccBlindIntraFreq),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExeSuccBlindIntraFreq',Sum(pmHoExeSuccBlindIntraFreq),MOID from DCTRS_4112 group by MOID , gritEventID;
 
  insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExeSuccMeasBasedInterFreq',Sum(pmHoExeSuccMeasBasedInterFreq),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExeSuccMeasBasedInterFreq',Sum(pmHoExeSuccMeasBasedInterFreq),MOID from DCTRS_4112 group by MOID , gritEventID;
 
  insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExeSuccMeasBasedIntraFreq',Sum(pmHoExeSuccMeasBasedIntraFreq),MOID from DCTRS_4104 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoExeSuccMeasBasedIntraFreq',Sum(pmHoExeSuccMeasBasedIntraFreq),MOID from DCTRS_4112 group by MOID , gritEventID;
 
   
   insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmHoPrepAttLteInterFQci',Sum(pmHoPrepAttLteInterFQci),MOID from DCTRS_4102 group by MOID , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoPrepAttLteInterFQci',Sum(pmHoPrepAttLteInterFQci),MOID from DCTRS_4110 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmHoPrepAttLteIntraFQci',Sum(pmHoPrepAttLteIntraFQci),MOID from DCTRS_4102 group by MOID , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoPrepAttLteIntraFQci',Sum(pmHoPrepAttLteIntraFQci),MOID from DCTRS_4110 group by MOID , gritEventID;
 
   insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmhoprepattlteinterfato',Sum(apmhoprepattlteinterfato),CELLRELATIONMOID  from DCTRS_4102 group by CELLRELATIONMOID  , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmhoprepattlteinterfato',Sum(pmhoprepattlteinterfato),CELLRELATIONMOID  from DCTRS_4110 group by CELLRELATIONMOID  , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmhoprepsucclteinterfato',Sum(apmhoprepsucclteinterfato),CELLRELATIONMOID  from DCTRS_4102 group by CELLRELATIONMOID  , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmhoprepsucclteinterfato',Sum(pmhoprepsucclteinterfato),CELLRELATIONMOID  from DCTRS_4110 group by CELLRELATIONMOID  , gritEventID;
 
  insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmHoPrepOutFailTo',Sum(pmHoPrepOutFailTo),MOID from DCTRS_4102 group by MOID , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoPrepOutFailTo',Sum(pmHoPrepOutFailTo),MOID from DCTRS_4110 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmHoPrepOutAttQci',Sum(pmHoPrepOutAttQci),MOID from DCTRS_4102 group by MOID , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoPrepOutAttQci',Sum(pmHoPrepOutAttQci),MOID from DCTRS_4110 group by MOID , gritEventID;
 
  insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmHoPrepOutSuccQci',Sum(pmHoPrepOutSuccQci),MOID from DCTRS_4102 group by MOID , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoPrepOutSuccQci',Sum(pmHoPrepOutSuccQci),MOID from DCTRS_4110 group by MOID , gritEventID;
 
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmHoPrepSuccLteIntraFQci',Sum(pmHoPrepSuccLteIntraFQci),MOID from DCTRS_4102 group by MOID , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoPrepSuccLteIntraFQci',Sum(pmHoPrepSuccLteIntraFQci),MOID from DCTRS_4110 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmHoPrepSuccLteInterFQci',Sum(pmHoPrepSuccLteInterFQci),MOID from DCTRS_4102 group by MOID , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmHoPrepSuccLteInterFQci',Sum(pmHoPrepSuccLteInterFQci),MOID from DCTRS_4110 group by MOID, gritEventID;
 
  insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmhopreprejinlicmobinterfreq',Sum(pmhopreprejinlicmobinterfreq),MOID from DCTRS_4103 group by MOID, gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmhopreprejinlicmobinterfreq',Sum(pmhopreprejinlicmobinterfreq),MOID from DCTRS_4111 group by MOID, gritEventID;
 
   insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmhopreprejinlicmobintermode',Sum(pmhopreprejinlicmobintermode),MOID from DCTRS_4103 group by MOID, gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmhopreprejinlicmobintermode',Sum(pmhopreprejinlicmobintermode),MOID from DCTRS_4111 group by MOID, gritEventID;
 
  
    insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmhoexeinattqci',Sum(pmhoexeinattqci),MOID from DCTRS_4113 group by MOID, gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmhoexeinattqci',Sum(pmhoexeinattqci),MOID from DCTRS_4105 group by MOID, gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,)
 Select gritEventID,'pmhoexeinsuccqci',Sum(pmhoexeinsuccqci),MOID from DCTRS_4113 group by MOID, gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmhoexeinsuccqci',Sum(pmhoexeinsuccqci),MOID from DCTRS_4105 group by MOID, gritEventID;
 
 
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci1',Sum(pmErabRelAttQci1),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci1',Sum(pmErabRelAttQci1),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci2',Sum(pmErabRelAttQci2),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci2',Sum(pmErabRelAttQci2),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci3',Sum(pmErabRelAttQci3),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci3',Sum(pmErabRelAttQci3),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci4',Sum(pmErabRelAttQci4),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci4',Sum(pmErabRelAttQci4),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci5',Sum(pmErabRelAttQci5),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci5',Sum(pmErabRelAttQci5),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci6',Sum(pmErabRelAttQci6),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci6',Sum(pmErabRelAttQci6),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci7',Sum(pmErabRelAttQci7),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci7',Sum(pmErabRelAttQci7),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci8',Sum(pmErabRelAttQci8),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci8',Sum(pmErabRelAttQci8),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci9',Sum(pmErabRelAttQci9),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelAttQci9',Sum(pmErabRelAttQci9),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbMiscS1Cause0',Sum(pmErabRelEnbMiscS1Cause0),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbMiscS1Cause0',Sum(pmErabRelEnbMiscS1Cause0),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbMiscS1Cause1',Sum(pmErabRelEnbMiscS1Cause1),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbMiscS1Cause1',Sum(pmErabRelEnbMiscS1Cause1),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbMiscS1Cause2',Sum(pmErabRelEnbMiscS1Cause2),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbMiscS1Cause2',Sum(pmErabRelEnbMiscS1Cause2),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbMiscS1Cause3',Sum(pmErabRelEnbMiscS1Cause3),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbMiscS1Cause3',Sum(pmErabRelEnbMiscS1Cause3),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbMiscS1Cause4',Sum(pmErabRelEnbMiscS1Cause4),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbMiscS1Cause4',Sum(pmErabRelEnbMiscS1Cause4),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbMiscS1Cause5',Sum(pmErabRelEnbMiscS1Cause5),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbMiscS1Cause5',Sum(pmErabRelEnbMiscS1Cause5),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbNasS1Cause0',Sum(pmErabRelEnbNasS1Cause0),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbNasS1Cause0',Sum(pmErabRelEnbNasS1Cause0),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbNasS1Cause1',Sum(pmErabRelEnbNasS1Cause1),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbNasS1Cause1',Sum(pmErabRelEnbNasS1Cause1),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbNasS1Cause2',Sum(pmErabRelEnbNasS1Cause2),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbNasS1Cause2',Sum(pmErabRelEnbNasS1Cause2),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbNasS1Cause3',Sum(pmErabRelEnbNasS1Cause3),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbNasS1Cause3',Sum(pmErabRelEnbNasS1Cause3),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbNasS1Cause4',Sum(pmErabRelEnbNasS1Cause4),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbNasS1Cause4',Sum(pmErabRelEnbNasS1Cause4),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 
insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbProtS1Cause0',Sum(pmErabRelEnbProtS1Cause0),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbProtS1Cause0',Sum(pmErabRelEnbProtS1Cause0),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbProtS1Cause1',Sum(pmErabRelEnbProtS1Cause1),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbProtS1Cause1',Sum(pmErabRelEnbProtS1Cause1),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbProtS1Cause2',Sum(pmErabRelEnbProtS1Cause2),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbProtS1Cause2',Sum(pmErabRelEnbProtS1Cause2),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbProtS1Cause3',Sum(pmErabRelEnbProtS1Cause3),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbProtS1Cause3',Sum(pmErabRelEnbProtS1Cause3),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbProtS1Cause4',Sum(pmErabRelEnbProtS1Cause4),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbProtS1Cause4',Sum(pmErabRelEnbProtS1Cause4),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbProtS1Cause5',Sum(pmErabRelEnbProtS1Cause5),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbProtS1Cause5',Sum(pmErabRelEnbProtS1Cause5),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbProtS1Cause6',Sum(pmErabRelEnbProtS1Cause6),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbProtS1Cause6',Sum(pmErabRelEnbProtS1Cause6),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause0',Sum(pmErabRelEnbRnlS1Cause0),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause0',Sum(pmErabRelEnbRnlS1Cause0),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause1',Sum(pmErabRelEnbRnlS1Cause1),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause1',Sum(pmErabRelEnbRnlS1Cause1),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause2',Sum(pmErabRelEnbRnlS1Cause2),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause2',Sum(pmErabRelEnbRnlS1Cause2),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause3',Sum(pmErabRelEnbRnlS1Cause3),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause3',Sum(pmErabRelEnbRnlS1Cause3),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause4',Sum(pmErabRelEnbRnlS1Cause4),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause4',Sum(pmErabRelEnbRnlS1Cause4),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause5',Sum(pmErabRelEnbRnlS1Cause5),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause5',Sum(pmErabRelEnbRnlS1Cause5),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause6',Sum(pmErabRelEnbRnlS1Cause6),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause6',Sum(pmErabRelEnbRnlS1Cause6),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause7',Sum(pmErabRelEnbRnlS1Cause7),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause7',Sum(pmErabRelEnbRnlS1Cause7),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause8',Sum(pmErabRelEnbRnlS1Cause8),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause8',Sum(pmErabRelEnbRnlS1Cause8),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause9',Sum(pmErabRelEnbRnlS1Cause9),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause9',Sum(pmErabRelEnbRnlS1Cause9),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause10',Sum(pmErabRelEnbRnlS1Cause10),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause10',Sum(pmErabRelEnbRnlS1Cause10),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause11',Sum(pmErabRelEnbRnlS1Cause11),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause11',Sum(pmErabRelEnbRnlS1Cause11),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause12',Sum(pmErabRelEnbRnlS1Cause12),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause12',Sum(pmErabRelEnbRnlS1Cause12),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause13',Sum(pmErabRelEnbRnlS1Cause13),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause13',Sum(pmErabRelEnbRnlS1Cause13),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause14',Sum(pmErabRelEnbRnlS1Cause14),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause14',Sum(pmErabRelEnbRnlS1Cause14),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName,CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause15',Sum(pmErabRelEnbRnlS1Cause15),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause15',Sum(pmErabRelEnbRnlS1Cause15),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause16',Sum(pmErabRelEnbRnlS1Cause16),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause16',Sum(pmErabRelEnbRnlS1Cause16),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause17',Sum(pmErabRelEnbRnlS1Cause17),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause17',Sum(pmErabRelEnbRnlS1Cause17),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause18',Sum(pmErabRelEnbRnlS1Cause18),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause18',Sum(pmErabRelEnbRnlS1Cause18),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause19',Sum(pmErabRelEnbRnlS1Cause19),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause19',Sum(pmErabRelEnbRnlS1Cause19),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause20',Sum(pmErabRelEnbRnlS1Cause20),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause20',Sum(pmErabRelEnbRnlS1Cause20),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause21',Sum(pmErabRelEnbRnlS1Cause21),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause21',Sum(pmErabRelEnbRnlS1Cause21),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause22',Sum(pmErabRelEnbRnlS1Cause22),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause22',Sum(pmErabRelEnbRnlS1Cause22),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause23',Sum(pmErabRelEnbRnlS1Cause23),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause23',Sum(pmErabRelEnbRnlS1Cause23),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause24',Sum(pmErabRelEnbRnlS1Cause24),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause24',Sum(pmErabRelEnbRnlS1Cause24),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause25',Sum(pmErabRelEnbRnlS1Cause25),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause25',Sum(pmErabRelEnbRnlS1Cause25),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause26',Sum(pmErabRelEnbRnlS1Cause26),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause26',Sum(pmErabRelEnbRnlS1Cause26),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause27',Sum(pmErabRelEnbRnlS1Cause27),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause27',Sum(pmErabRelEnbRnlS1Cause27),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause28',Sum(pmErabRelEnbRnlS1Cause28),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause28',Sum(pmErabRelEnbRnlS1Cause28),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause29',Sum(pmErabRelEnbRnlS1Cause29),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause29',Sum(pmErabRelEnbRnlS1Cause29),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause30',Sum(pmErabRelEnbRnlS1Cause30),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause30',Sum(pmErabRelEnbRnlS1Cause30),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause31',Sum(pmErabRelEnbRnlS1Cause31),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause31',Sum(pmErabRelEnbRnlS1Cause31),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause32',Sum(pmErabRelEnbRnlS1Cause32),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause32',Sum(pmErabRelEnbRnlS1Cause32),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause33',Sum(pmErabRelEnbRnlS1Cause33),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause33',Sum(pmErabRelEnbRnlS1Cause33),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause34',Sum(pmErabRelEnbRnlS1Cause34),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause34',Sum(pmErabRelEnbRnlS1Cause34),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause35',Sum(pmErabRelEnbRnlS1Cause35),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause35',Sum(pmErabRelEnbRnlS1Cause35),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause36',Sum(pmErabRelEnbRnlS1Cause36),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause36',Sum(pmErabRelEnbRnlS1Cause36),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause37',Sum(pmErabRelEnbRnlS1Cause37),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause37',Sum(pmErabRelEnbRnlS1Cause37),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause38',Sum(pmErabRelEnbRnlS1Cause38),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbRnlS1Cause38',Sum(pmErabRelEnbRnlS1Cause38),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbTranS1Cause0',Sum(pmErabRelEnbTranS1Cause0),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbTranS1Cause0',Sum(pmErabRelEnbTranS1Cause0),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbTranS1Cause1',Sum(pmErabRelEnbTranS1Cause1),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelEnbTranS1Cause1',Sum(pmErabRelEnbTranS1Cause1),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeMiscS1Cause0',Sum(pmErabRelMmeMiscS1Cause0),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeMiscS1Cause0',Sum(pmErabRelMmeMiscS1Cause0),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeMiscS1Cause1',Sum(pmErabRelMmeMiscS1Cause1),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeMiscS1Cause1',Sum(pmErabRelMmeMiscS1Cause1),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeMiscS1Cause2',Sum(pmErabRelMmeMiscS1Cause2),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeMiscS1Cause2',Sum(pmErabRelMmeMiscS1Cause2),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeMiscS1Cause3',Sum(pmErabRelMmeMiscS1Cause3),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeMiscS1Cause3',Sum(pmErabRelMmeMiscS1Cause3),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeMiscS1Cause4',Sum(pmErabRelMmeMiscS1Cause4),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeMiscS1Cause4',Sum(pmErabRelMmeMiscS1Cause4),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeMiscS1Cause5',Sum(pmErabRelMmeMiscS1Cause5),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeMiscS1Cause5',Sum(pmErabRelMmeMiscS1Cause5),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeNasS1Cause0',Sum(pmErabRelMmeNasS1Cause0),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeNasS1Cause0',Sum(pmErabRelMmeNasS1Cause0),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeNasS1Cause1',Sum(pmErabRelMmeNasS1Cause1),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeNasS1Cause1',Sum(pmErabRelMmeNasS1Cause1),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeNasS1Cause2',Sum(pmErabRelMmeNasS1Cause2),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeNasS1Cause2',Sum(pmErabRelMmeNasS1Cause2),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeNasS1Cause3',Sum(pmErabRelMmeNasS1Cause3),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeNasS1Cause3',Sum(pmErabRelMmeNasS1Cause3),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeNasS1Cause4',Sum(pmErabRelMmeNasS1Cause4),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeNasS1Cause4',Sum(pmErabRelMmeNasS1Cause4),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeProtS1Cause0',Sum(pmErabRelMmeProtS1Cause0),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeProtS1Cause0',Sum(pmErabRelMmeProtS1Cause0),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeProtS1Cause1',Sum(pmErabRelMmeProtS1Cause1),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeProtS1Cause1',Sum(pmErabRelMmeProtS1Cause1),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeProtS1Cause2',Sum(pmErabRelMmeProtS1Cause2),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeProtS1Cause2',Sum(pmErabRelMmeProtS1Cause2),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeProtS1Cause3',Sum(pmErabRelMmeProtS1Cause3),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeProtS1Cause3',Sum(pmErabRelMmeProtS1Cause3),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeProtS1Cause4',Sum(pmErabRelMmeProtS1Cause4),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeProtS1Cause4',Sum(pmErabRelMmeProtS1Cause4),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeProtS1Cause5',Sum(pmErabRelMmeProtS1Cause5),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeProtS1Cause5',Sum(pmErabRelMmeProtS1Cause5),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeProtS1Cause6',Sum(pmErabRelMmeProtS1Cause6),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeProtS1Cause6',Sum(pmErabRelMmeProtS1Cause6),MOID from DCTRS_4125 group by MOID , gritEventID;

 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause0',Sum(pmErabRelMmeRnlS1Cause0),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause0',Sum(pmErabRelMmeRnlS1Cause0),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause1',Sum(pmErabRelMmeRnlS1Cause1),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause1',Sum(pmErabRelMmeRnlS1Cause1),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause2',Sum(pmErabRelMmeRnlS1Cause2),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause2',Sum(pmErabRelMmeRnlS1Cause2),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause3',Sum(pmErabRelMmeRnlS1Cause3),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause3',Sum(pmErabRelMmeRnlS1Cause3),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause4',Sum(pmErabRelMmeRnlS1Cause4),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause4',Sum(pmErabRelMmeRnlS1Cause4),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause5',Sum(pmErabRelMmeRnlS1Cause5),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause5',Sum(pmErabRelMmeRnlS1Cause5),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause6',Sum(pmErabRelMmeRnlS1Cause6),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause6',Sum(pmErabRelMmeRnlS1Cause6),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause7',Sum(pmErabRelMmeRnlS1Cause7),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause7',Sum(pmErabRelMmeRnlS1Cause7),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause8',Sum(pmErabRelMmeRnlS1Cause8),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause8',Sum(pmErabRelMmeRnlS1Cause8),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause9',Sum(pmErabRelMmeRnlS1Cause9),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause9',Sum(pmErabRelMmeRnlS1Cause9),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause10',Sum(pmErabRelMmeRnlS1Cause10),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause10',Sum(pmErabRelMmeRnlS1Cause10),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause11',Sum(pmErabRelMmeRnlS1Cause11),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause11',Sum(pmErabRelMmeRnlS1Cause11),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause12',Sum(pmErabRelMmeRnlS1Cause12),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause12',Sum(pmErabRelMmeRnlS1Cause12),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause13',Sum(pmErabRelMmeRnlS1Cause13),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause13',Sum(pmErabRelMmeRnlS1Cause13),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause14',Sum(pmErabRelMmeRnlS1Cause14),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause14',Sum(pmErabRelMmeRnlS1Cause14),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause15',Sum(pmErabRelMmeRnlS1Cause15),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause15',Sum(pmErabRelMmeRnlS1Cause15),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause16',Sum(pmErabRelMmeRnlS1Cause16),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause16',Sum(pmErabRelMmeRnlS1Cause16),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause17',Sum(pmErabRelMmeRnlS1Cause17),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause17',Sum(pmErabRelMmeRnlS1Cause17),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause18',Sum(pmErabRelMmeRnlS1Cause18),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause18',Sum(pmErabRelMmeRnlS1Cause18),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause19',Sum(pmErabRelMmeRnlS1Cause19),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause19',Sum(pmErabRelMmeRnlS1Cause19),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause20',Sum(pmErabRelMmeRnlS1Cause20),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause20',Sum(pmErabRelMmeRnlS1Cause20),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause21',Sum(pmErabRelMmeRnlS1Cause21),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause21',Sum(pmErabRelMmeRnlS1Cause21),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause22',Sum(pmErabRelMmeRnlS1Cause22),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause22',Sum(pmErabRelMmeRnlS1Cause22),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause23',Sum(pmErabRelMmeRnlS1Cause23),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause23',Sum(pmErabRelMmeRnlS1Cause23),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause24',Sum(pmErabRelMmeRnlS1Cause24),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause24',Sum(pmErabRelMmeRnlS1Cause24),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause25',Sum(pmErabRelMmeRnlS1Cause25),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause25',Sum(pmErabRelMmeRnlS1Cause25),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause26',Sum(pmErabRelMmeRnlS1Cause26),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause26',Sum(pmErabRelMmeRnlS1Cause26),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause27',Sum(pmErabRelMmeRnlS1Cause27),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause27',Sum(pmErabRelMmeRnlS1Cause27),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause28',Sum(pmErabRelMmeRnlS1Cause28),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause28',Sum(pmErabRelMmeRnlS1Cause28),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause29',Sum(pmErabRelMmeRnlS1Cause29),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause29',Sum(pmErabRelMmeRnlS1Cause29),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause30',Sum(pmErabRelMmeRnlS1Cause30),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause30',Sum(pmErabRelMmeRnlS1Cause30),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause31',Sum(pmErabRelMmeRnlS1Cause31),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause31',Sum(pmErabRelMmeRnlS1Cause31),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause32',Sum(pmErabRelMmeRnlS1Cause32),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause32',Sum(pmErabRelMmeRnlS1Cause32),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause33',Sum(pmErabRelMmeRnlS1Cause33),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause33',Sum(pmErabRelMmeRnlS1Cause33),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause34',Sum(pmErabRelMmeRnlS1Cause34),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause34',Sum(pmErabRelMmeRnlS1Cause34),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause35',Sum(pmErabRelMmeRnlS1Cause35),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause35',Sum(pmErabRelMmeRnlS1Cause35),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause36',Sum(pmErabRelMmeRnlS1Cause36),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause36',Sum(pmErabRelMmeRnlS1Cause36),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause37',Sum(pmErabRelMmeRnlS1Cause37),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause37',Sum(pmErabRelMmeRnlS1Cause37),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause38',Sum(pmErabRelMmeRnlS1Cause38),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeRnlS1Cause38',Sum(pmErabRelMmeRnlS1Cause38),MOID from DCTRS_4125 group by MOID , gritEventID;
 

 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeTranS1Cause0',Sum(pmErabRelMmeTranS1Cause0),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeTranS1Cause0',Sum(pmErabRelMmeTranS1Cause0),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeTranS1Cause1',Sum(pmErabRelMmeTranS1Cause1),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelMmeTranS1Cause1',Sum(pmErabRelMmeTranS1Cause1),MOID from DCTRS_4125 group by MOID , gritEventID;
 
  
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci1',Sum(pmErabRelSuccQci1),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci1',Sum(pmErabRelSuccQci1),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci2',Sum(pmErabRelSuccQci2),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci2',Sum(pmErabRelSuccQci2),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci3',Sum(pmErabRelSuccQci3),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci3',Sum(pmErabRelSuccQci3),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci4',Sum(pmErabRelSuccQci4),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci4',Sum(pmErabRelSuccQci4),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci5',Sum(pmErabRelSuccQci5),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci5',Sum(pmErabRelSuccQci5),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci6',Sum(pmErabRelSuccQci6),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci6',Sum(pmErabRelSuccQci6),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci7',Sum(pmErabRelSuccQci7),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci7',Sum(pmErabRelSuccQci7),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci8',Sum(pmErabRelSuccQci8),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci8',Sum(pmErabRelSuccQci8),MOID from DCTRS_4125 group by MOID , gritEventID;
 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci9',Sum(pmErabRelSuccQci9),MOID from DCTRS_4114 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmErabRelSuccQci9',Sum(pmErabRelSuccQci9),MOID from DCTRS_4125 group by MOID , gritEventID;

insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmAgMeasSuccCgi',Sum(pmAgMeasSuccCgi),MOID from DCTRS_4117 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmAgMeasSuccCgi',Sum(pmAgMeasSuccCgi),MOID from DCTRS_4134 group by MOID , gritEventID;
insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmAgMeasSuccCgi',Sum(pmAgMeasSuccCgi),MOID from DCTRS_4138 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmAgMeasSuccCgi',Sum(pmAgMeasSuccCgi),MOID from DCTRS_4139 group by MOID , gritEventID;

insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmDrxMeasSuccCgi',Sum(pmDrxMeasSuccCgi),MOID from DCTRS_4117 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmDrxMeasSuccCgi',Sum(pmDrxMeasSuccCgi),MOID from DCTRS_4134 group by MOID , gritEventID;
insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmDrxMeasSuccCgi',Sum(pmDrxMeasSuccCgi),MOID from DCTRS_4138 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmDrxMeasSuccCgi',Sum(pmDrxMeasSuccCgi),MOID from DCTRS_4139 group by MOID , gritEventID;

insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmAgMeasSuccCgiQci1',Sum(pmAgMeasSuccCgiQci1),MOID from DCTRS_4134 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmAgMeasSuccCgiQci1',Sum(pmAgMeasSuccCgiQci1),MOID from DCTRS_4138 group by MOID , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmAgMeasSuccCgiQci1',Sum(pmAgMeasSuccCgiQci1),MOID from DCTRS_4139 group by MOID , gritEventID;

insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmDrxMeasSuccCgiQci1',Sum(pmDrxMeasSuccCgiQci1),MOID from DCTRS_4134 group by MOID , gritEventID; 
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmDrxMeasSuccCgiQci1',Sum(pmDrxMeasSuccCgiQci1),MOID from DCTRS_4138 group by MOID , gritEventID;
 insert into DCTRS_MultiEventCounter (gritEVENTID,CounterName, CounterValue, MOID,) 
 Select gritEventID,'pmDrxMeasSuccCgiQci1',Sum(pmDrxMeasSuccCgiQci1),MOID from DCTRS_4139 group by MOID , gritEventID;