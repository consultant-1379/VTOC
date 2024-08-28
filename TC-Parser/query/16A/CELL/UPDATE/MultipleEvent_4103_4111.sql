ALTER TABLE EVENT3_4103 ADD pmHoPrepRejInLicMobInterFreqM as Integer NOT NULL DEFAULT(0); 

UPDATE EVENT3_4103 SET pmHoPrepRejInLicMobInterFreqM = 

(select COALESCE (sum(pmHoPrepRejInLicMobInterFreq),0) as a from EVENT3_4103)
+
(select COALESCE (sum(pmHoPrepRejInLicMobInterFreq),0) as a from EVENT3_4111);




ALTER TABLE EVENT3_4103 ADD pmHoPrepRejInLicMobInterModeM as Integer NOT NULL DEFAULT(0); 

UPDATE EVENT3_4103 SET pmHoPrepRejInLicMobInterModeM = 

(select COALESCE (sum(pmHoPrepRejInLicMobInterMode),0) as a from EVENT3_4103)
+
(select COALESCE (sum(pmHoPrepRejInLicMobInterMode),0) as a from EVENT3_4111);
 