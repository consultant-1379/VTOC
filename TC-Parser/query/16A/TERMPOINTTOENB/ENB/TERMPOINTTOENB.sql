ALTER TABLE EVENT3_4118 
ADD EXTENB_ID  as int null;

ALTER TABLE EVENT3_4118 
ADD MCC AS VARCHAR(12) NULL;

ALTER TABLE EVENT3_4118 
ADD MNC AS VARCHAR(12)  NULL ;

ALTER TABLE EVENT3_4118
ADD ENB_ID AS int null;

UPDATE EVENT3_4118 SET ENB_ID = (GLOBALCELLID / 256);

UPDATE EVENT3_4118 SET EXTENB_ID=(((hextoint(substring(GENBID,9,2))) & 0xFF) *4096) + ( ((hextoint(substring(GENBID,11,2)))  & 0xFF)*16) + ( ((hextoint(substring(GENBID,13,2)))  & 0xF0)/16);
 
UPDATE EVENT3_4118 SET MCC= substring(GENBID, 4, 1) | substring(GENBID, 3, 1) | substring(GENBID, 6, 1);

UPDATE EVENT3_4118 SET MNC=CASE WHEN substring(GENBID, 5, 1) = 'f' THEN (substring(GENBID, 8, 1) + substring(GENBID, 7, 1)) ELSE (substring(GENBID, 5, 1) + substring(GENBID, 8, 1) + substring(GENBID, 7, 1)) END;