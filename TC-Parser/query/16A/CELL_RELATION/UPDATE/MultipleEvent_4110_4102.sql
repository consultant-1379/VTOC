UPDATE EVENT_4110 SET apmHoPrepAttLteInterFAtoM = 
(select COALESCE (sum(apmHoPrepAttLteInterFAto),0) as a from EVENT_4110)
+
(select COALESCE (sum(apmHoPrepAttLteInterFAto),0) as a from EVENT_4102
);
UPDATE EVENT_4110 SET apmHoPrepSuccLteInterFAtoM = 
(select COALESCE (sum(apmHoPrepSuccLteInterFAto),0) as a from EVENT_4110)
+
(select COALESCE (sum(apmHoPrepSuccLteInterFAto),0) as a from EVENT_4102
);