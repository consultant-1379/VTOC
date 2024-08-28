UPDATE EVENT_4105 SET pmHoExeInAttQciM = 
(select COALESCE (sum(pmHoExeInAttQci),0) as a from EVENT_4105)
+
(select COALESCE (sum(pmHoExeInAttQci),0) as a from EVENT_4113); 
UPDATE EVENT_4105 SET pmHoExeInSuccQciM = 
(select COALESCE (sum(pmHoExeInSuccQci),0) as a from EVENT_4105)
+
(select COALESCE (sum(pmHoExeInSuccQci),0) as a from EVENT_4113); 
