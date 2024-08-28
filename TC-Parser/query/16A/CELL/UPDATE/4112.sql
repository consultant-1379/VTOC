Update EVENT_4112 set pmHoExecOutX2AttInterEnb=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where ( HOSOURCEORTARGETTYPE=1 OR  HOSOURCEORTARGETTYPE=0) AND HOTYPE=2;
Update EVENT_4112 set pmHoExecOutX2SuccInterEnb=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where ( HOSOURCEORTARGETTYPE=1 OR  HOSOURCEORTARGETTYPE=0) AND PROCHOEXECOUTRESULT = 0 AND HOTYPE=2;	
Update EVENT_4112 set pmHoExeAttBlindInterFreq = 1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where HOTARGETSELECTIONTYPE = 0 and HOSOURCEORTARGETTYPE = 1 ;
Update EVENT_4112 set pmHoExeAttBlindIntraFreq = 1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where HOTARGETSELECTIONTYPE = 0 and HOSOURCEORTARGETTYPE = 0 ;
Update EVENT_4112 set pmHoExeAttMeasBasedInterFreq = 1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where  HOTARGETSELECTIONTYPE = 1 and HOSOURCEORTARGETTYPE = 1 ;
Update EVENT_4112 set pmHoExeAttMeasBasedIntraFreq = 1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where HOTARGETSELECTIONTYPE = 1 and HOSOURCEORTARGETTYPE = 0;
Update EVENT_4112 set pmHoExecOutFailCause1 = 1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where PROCHOEXECOUTRESULT !=0 AND PROCHOEXECOUTRESULT=1;
Update EVENT_4112 set pmHoExecOutFailCause2 = 1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where PROCHOEXECOUTRESULT !=0 AND PROCHOEXECOUTRESULT=2;
Update EVENT_4112 set pmHoExecOutFailCause3 = 1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where PROCHOEXECOUTRESULT !=0 AND PROCHOEXECOUTRESULT=3;
Update EVENT_4112 set pmHoExecOutFailCause4 = 1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where PROCHOEXECOUTRESULT !=0 AND PROCHOEXECOUTRESULT=4;
Update EVENT_4112 set pmHoExecOutFailCause5 = 1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where PROCHOEXECOUTRESULT !=0 AND PROCHOEXECOUTRESULT=5;
Update EVENT_4112 set pmHoExecOutFailCause6 = 1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where PROCHOEXECOUTRESULT !=0 AND PROCHOEXECOUTRESULT=6;
Update EVENT_4112 set pmHoExeSuccBlindInterFreq= 1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where  HOSOURCEORTARGETTYPE=1 AND HOTARGETSELECTIONTYPE=0 AND PROCHOEXECOUTRESULT=0 ;
Update EVENT_4112 set pmHoExeSuccBlindIntraFreq = 1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where HOTARGETSELECTIONTYPE = 0 and HOSOURCEORTARGETTYPE = 0 and PROCHOEXECOUTRESULT = 0 ;
Update EVENT_4112 set pmHoExeSuccMeasBasedInterFreq = 1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where HOTARGETSELECTIONTYPE = 1 and HOSOURCEORTARGETTYPE = 1 and PROCHOEXECOUTRESULT = 0;
Update EVENT_4112 set pmHoExeSuccMeasBasedIntraFreq = 1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where HOTARGETSELECTIONTYPE = 1 and HOSOURCEORTARGETTYPE = 0 and PROCHOEXECOUTRESULT = 0;
Update EVENT_4112 set pmHoExecAttDrxConfig0=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=0;
Update EVENT_4112 set pmHoExecAttDrxConfig1=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=1;
Update EVENT_4112 set pmHoExecAttDrxConfig2=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=2;
Update EVENT_4112 set pmHoExecAttDrxConfig3=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=3;
Update EVENT_4112 set pmHoExecAttDrxConfig4=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=4;
Update EVENT_4112 set pmHoExecAttDrxConfig5=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=5;
Update EVENT_4112 set pmHoExecAttDrxConfig6=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=6;
Update EVENT_4112 set pmHoExecAttDrxConfig7=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=7;
Update EVENT_4112 set pmHoExecAttDrxConfig8=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=8;
Update EVENT_4112 set pmHoExecAttDrxConfig9=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=9;
Update EVENT_4112 set pmHoExecAttDrxConfig10=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=10;
Update EVENT_4112 set pmHoExecAttDrxConfig11=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=11;
Update EVENT_4112 set pmHoExecAttDrxConfig12=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=12;
Update EVENT_4112 set pmHoExecAttDrxConfig13=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=13;
Update EVENT_4112 set pmHoExecAttDrxConfig14=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=14;
Update EVENT_4112 set pmHoExecAttDrxConfig15=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=15;
Update EVENT_4112 set pmHoExecAttDrxConfig16=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=16;
Update EVENT_4112 set pmHoExecAttDrxConfig17=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=17;
Update EVENT_4112 set pmHoExecAttDrxConfig18=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=18;
Update EVENT_4112 set pmHoExecAttDrxConfig19=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=19;
Update EVENT_4112 set pmHoExecAttDrxConfig20=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=20;
Update EVENT_4112 set pmHoExecAttDrxConfig21=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=21;
Update EVENT_4112 set pmHoExecAttDrxConfig22=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=22;
Update EVENT_4112 set pmHoExecAttDrxConfig23=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=23;
Update EVENT_4112 set pmHoExecAttDrxConfig24=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=24;
Update EVENT_4112 set pmHoExecAttDrxConfig25=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=25;
Update EVENT_4112 set pmHoExecAttDrxConfig26=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=26;
Update EVENT_4112 set pmHoExecAttDrxConfig27=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=27;
Update EVENT_4112 set pmHoExecAttDrxConfig28=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=28;
Update EVENT_4112 set pmHoExecAttDrxConfig29=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=29;
Update EVENT_4112 set pmHoExecAttDrxConfig30=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=30;
Update EVENT_4112 set pmHoExecAttDrxConfig31=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=31;
Update EVENT_4112 set pmHoExecAttDrxConfig32=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=32;
Update EVENT_4112 set pmHoExecAttDrxConfig33=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=33;
Update EVENT_4112 set pmHoExecAttDrxConfig34=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=34;
Update EVENT_4112 set pmHoExecAttDrxConfig35=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=35;
Update EVENT_4112 set pmHoExecAttDrxConfig36=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=36;
Update EVENT_4112 set pmHoExecAttDrxConfig37=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=37;
Update EVENT_4112 set pmHoExecAttDrxConfig38=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=38;
Update EVENT_4112 set pmHoExecAttDrxConfig39=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=39;
Update EVENT_4112 set pmHoExecAttDrxConfig40=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=40;
Update EVENT_4112 set pmHoExecAttDrxConfig41=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=41;
Update EVENT_4112 set pmHoExecAttDrxConfig42=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=42;
Update EVENT_4112 set pmHoExecAttDrxConfig43=1 from EVENT_4112 A inner join topo_eucell B on A.CELL_ID = B.CELL_ID and A.ENB_ID = B.ENB_ID where DRXCONFIGINDEX=43;