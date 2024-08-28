Update EVENT_4105 set pmHoExeInAttQci =((case when ERABHOEXECINQCI != 32768 or ERABHOEXECINQCI!= null then 1 else 0 end) + 
(case when ERABHOEXECINQCI_1 != 32768 or ERABHOEXECINQCI_1!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_2 != 32768 or ERABHOEXECINQCI_2!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_3 != 32768 or ERABHOEXECINQCI_3!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_4 != 32768 or ERABHOEXECINQCI_4!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_5 != 32768 or ERABHOEXECINQCI_5!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_6 != 32768 or ERABHOEXECINQCI_6!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_7 != 32768 or ERABHOEXECINQCI_7!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_8 != 32768 or ERABHOEXECINQCI_8!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_9 != 32768 or ERABHOEXECINQCI_9!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_10 != 32768 or ERABHOEXECINQCI_10!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_11 != 32768 or ERABHOEXECINQCI_11!= null then 1 else 0 end) + 
(case when ERABHOEXECINQCI_12 != 32768 or ERABHOEXECINQCI_12!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_13 != 32768 or ERABHOEXECINQCI_13!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_14 != 32768 or ERABHOEXECINQCI_14!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_15 != 32768 or ERABHOEXECINQCI_15!= null then 1 else 0 end) ) 
from EVENT_4105 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID  where HOSOURCEORTARGETTYPE=0 or HOSOURCEORTARGETTYPE=1 ; 
Update EVENT_4105 set pmHoExeInSuccQci =((case when ERABHOEXECINQCI != 32768 or ERABHOEXECINQCI!= null then 1 else 0 end) + 
(case when ERABHOEXECINQCI_1 != 32768 or ERABHOEXECINQCI_1!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_2 != 32768 or ERABHOEXECINQCI_2!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_3 != 32768 or ERABHOEXECINQCI_3!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_4 != 32768 or ERABHOEXECINQCI_4!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_5 != 32768 or ERABHOEXECINQCI_5!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_6 != 32768 or ERABHOEXECINQCI_6!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_7 != 32768 or ERABHOEXECINQCI_7!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_8 != 32768 or ERABHOEXECINQCI_8!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_9 != 32768 or ERABHOEXECINQCI_9!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_10 != 32768 or ERABHOEXECINQCI_10!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_11 != 32768 or ERABHOEXECINQCI_11!= null then 1 else 0 end) + 
(case when ERABHOEXECINQCI_12 != 32768 or ERABHOEXECINQCI_12!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_13 != 32768 or ERABHOEXECINQCI_13!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_14 != 32768 or ERABHOEXECINQCI_14!= null then 1 else 0 end) +
(case when ERABHOEXECINQCI_15 != 32768 or ERABHOEXECINQCI_15!= null then 1 else 0 end) ) 
from EVENT_4105 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where PROCHOEXECINRESULT=0 and (HOSOURCEORTARGETTYPE=0 or HOSOURCEORTARGETTYPE=1) ; 