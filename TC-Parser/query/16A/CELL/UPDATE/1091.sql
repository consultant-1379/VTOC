Update EVENT_1091 set pmDlS1Cdma2000TunnelingHOSucc=1  from EVENT_1091 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where RATTYPE=6 and CDMA2000HOSTATUS=0;
Update EVENT_1091 set pmDlS1Cdma2000TunnelingHOFail=1  from EVENT_1091 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where RATTYPE=6 and CDMA2000HOSTATUS=1;
Update EVENT_1091 set pmDlS1Cdma2000TunnelingNonHO=1 from EVENT_1091 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where RATTYPE=6 and CDMA2000HOSTATUS=2;


