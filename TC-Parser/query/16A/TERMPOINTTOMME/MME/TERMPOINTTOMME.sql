ALTER TABLE EVENT3_4116 ADD CELL_ID AS int null;
ALTER TABLE EVENT3_4116 ADD MME_CODE as int null;
ALTER TABLE EVENT3_4116 ADD MME_GROUP_ID as int null;
ALTER TABLE EVENT3_4116 ADD MCC AS VARCHAR(12) NULL ;
ALTER TABLE EVENT3_4116 ADD MNC AS VARCHAR(12)  NULL ;
ALTER TABLE EVENT3_4116 ADD ENB_ID AS int null;

UPDATE EVENT3_4116 SET ENB_ID = (GLOBALCELLID / 256);
UPDATE EVENT3_4116 SET MME_CODE=hextoint(substring(GUMMEI,13,2));
UPDATE EVENT3_4116 SET MME_GROUP_ID= (((hextoint(substring(GUMMEI,9,2))) & 0xFF) *256) + ( ((hextoint(substring(GUMMEI,11,2)))  & 0xFF));
UPDATE EVENT3_4116 SET MCC =  substring(GUMMEI, 4, 1) | substring(GUMMEI, 3, 1) | substring(GUMMEI, 6, 1);
UPDATE EVENT3_4116 SET MNC = (CASE WHEN substring(GUMMEI, 5, 1) = 'f' THEN (substring(GUMMEI, 8, 1) + substring(GUMMEI, 7, 1)) ELSE (substring(GUMMEI, 5, 1) + substring(GUMMEI, 8, 1) + substring(GUMMEI, 7, 1)) END);