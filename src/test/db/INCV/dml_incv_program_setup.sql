--This file will have setup for Program, Reward and Activity Group.
--Activity setup must not be added here. Create a seperate file for each activity and map then to the activity group id available here.

set autocommit off
    whenever SQLERROR EXIT ROLLBACK

-------------------------------------
--Program id 1245 start Satish--
-------------------------------------

Insert into INCV.PROGRAM (PROGRAMID,PROGRAMNM,PROGRAMEFFECTIVEDT,PROGRAMENDDT,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,DISPLAYDT) values (1245,'Aetna Consumer - Silver Plan',to_timestamp('01-JAN-18 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('31-DEC-18 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('17-JUL-17 09.20.37.643537000 AM','DD-MON-RR HH.MI.SSXFF AM'),'INCV',to_timestamp('31-DEC-17 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'INCV',to_timestamp('01-JAN-18 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'));

Insert into INCV.SUPPLIERPROGRAMASSOC (AHMSUPPLIERID,PROGRAMID,EFFECTIVEDT,ENDDT,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,SPOUSETREATEDASEMPIND,ISSPOUSEPARTNERAPPLICABLE) values (1971,1245,to_timestamp('01-JAN-18 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('31-DEC-18 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('19-SEP-17 04.41.19.897774000 PM','DD-MON-RR HH.MI.SSXFF AM'),'incv',to_timestamp('31-DEC-18 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'incv',null,'Y');

Insert into INCV.REWARD (REWARDID,REWARDNM,PROGRAMID,SORTORDERNBR,NOOFACTIVITIESTOCOMPLETE,REWARDEFFECTIVEDT,REWARDENDDT,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY) values (1265,'Gift Card',1245,1,null,to_timestamp('18-JAN-18 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('31-DEC-18 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('17-JUL-15 09.20.37.643978000 AM','DD-MON-RR HH.MI.SSXFF AM'),'INCV',to_timestamp('17-JUL-15 09.20.37.643978000 AM','DD-MON-RR HH.MI.SSXFF AM'),'INCV');

Insert into INCV.INCENTIVEGOALTYPE (INCENTIVEGOALTYPESKEY,GOALCATEGORYIDENTIFIER,GOALCATEGORYMNEMONIC,GOALTYPEMNEMONIC,VOIDFLG,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY) values (1,1265,'INCGOALCAT_RWD','INCGOALTYPE_DOL','IN',to_timestamp('18-JAN-18 08.40.47.227619000 AM','DD-MON-RR HH.MI.SSXFF AM'),'INCV',to_timestamp('31-DEC-18 08.40.47.227619000 AM','DD-MON-RR HH.MI.SSXFF AM'),'INCV');

INSERT INTO INCV.ACTIVITYGROUP (ACTIVITYGROUPID,ACTIVITYGROUPDESC,STARTDT,ENDDT,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY)
VALUES (1,'BMI Group',to_date('18-JAN-18','DD-MON-YY'),to_date('31-DEC-18','DD-MON-YY'),systimestamp,'TESTQ12018',systimestamp,'TESTQ12018');

insert into INCV.REWARDACTIVITYGROUPXREF (REWARDID,ACTIVITYGROUPID,ASSOCIATIONEFFECTIVEDT,ASSOCIATIONENDDT,SORTORDERNBR,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY)
values (1265,1,to_timestamp('01-JAN-17 12.00.00.000000000 AM','DD-MON-YY HH.MI.SS.FF AM'),to_timestamp('31-DEC-18 12.00.00.000000000 AM','DD-MON-YY HH.MI.SS.FF AM'),1,systimestamp,'TESTQ12018',systimestamp,'TESTQ12018');

insert into INCV.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY, INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC  )
values (1265,'INCGOALCAT_RWD','PARTTYPE_E',50,100,systimestamp,'TESTQ12018',systimestamp,'TESTQ12018',3,'INCGOALTYPE_DOL');

insert into INCV.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY, INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC  )
values (1245,'INCGOALCAT_PGM','PARTTYPE_E',50,100,systimestamp,'TESTQ12018',systimestamp,'TESTQ12018',4,'INCGOALTYPE_DOL');

insert into INCV.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY, INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC  )
values (1,'INCGOALCAT_GRP','PARTTYPE_E',50,100,systimestamp,'TESTQ12018',systimestamp,'TESTQ12018',2,'INCGOALTYPE_DOL');
-------------------------------------
--Program id 1245 end Satish--
-------------------------------------

-------------------------------------
--Program id 1745 start Max--
-------------------------------------
set autocommit off
    whenever SQLERROR EXIT ROLLBACK


-------------------------------------
--Program id 1745 end Max--
-------------------------------------
/*Program 1745 Start*/

set autocommit off
    whenever SQLERROR EXIT ROLLBACK

--Inserting a new program for the 'Ketchikan Gateway Borough and School District' supplier
Insert into incv.PROGRAM (PROGRAMID,PROGRAMNM,PROGRAMEFFECTIVEDT,PROGRAMENDDT,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,DISPLAYDT)
values (1745,'Ketchikan Max Test',to_timestamp('01-JAN-19 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),to_timestamp('31-DEC-25 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP);

--Attaching an ID of 1745 to the 'Ketchikan Gateway Borough and School District' program
Insert into INCV.SUPPLIERPROGRAMASSOC (AHMSUPPLIERID,PROGRAMID,EFFECTIVEDT,ENDDT,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,SPOUSETREATEDASEMPIND,ISSPOUSEPARTNERAPPLICABLE)
values (15700,1745,to_timestamp('01-JAN-19 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),to_timestamp('31-DEC-25 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),CURRENT_TIMESTAMP,'incv',CURRENT_TIMESTAMP,'incv','N','Y');

--Creating a reward with an ID of 1734 to the 'Ketchikan Gateway Borough and School District' program
Insert into incv.REWARD (REWARDID,REWARDNM,PROGRAMID,SORTORDERNBR,NOOFACTIVITIESTOCOMPLETE,REWARDEFFECTIVEDT,REWARDENDDT,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY)
values (1734,'Dollar',1745,1,5,to_timestamp('01-JAN-19 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),to_timestamp('31-DEC-25 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV');

--Creating a incentive goal type with ID of 20482 for the reward with an ID of 1734
Insert into incv.INCENTIVEGOALTYPE (INCENTIVEGOALTYPESKEY,GOALCATEGORYIDENTIFIER,GOALCATEGORYMNEMONIC,GOALTYPEMNEMONIC,VOIDFLG,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY)
values (20482,1734,'INCGOALCAT_RWD','INCGOALTYPE_DOL','IN',CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV');


--Labeling the survey activity group with an ID of 1849
Insert into incv.activitygroup (ACTIVITYGROUPID,ACTIVITYGROUPDESC,STARTDT,ENDDT,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,NOTREQUIREDCOUNT)
values (1849,'Survey Activity Group Ketchikan Gateway Borough and School District',to_timestamp('01-JAN-19 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),to_timestamp('31-DEC-25 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',0);
--Labeling the member event activity group with an ID of 1859
Insert into incv.activitygroup (ACTIVITYGROUPID,ACTIVITYGROUPDESC,STARTDT,ENDDT,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,NOTREQUIREDCOUNT)
values (1859,'Member Event Activity Group Ketchikan Gateway Borough and School District',to_timestamp('01-JAN-19 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),to_timestamp('31-DEC-25 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',0);
--Labeling the physical activity group with an ID of 1861
Insert into incv.activitygroup (ACTIVITYGROUPID,ACTIVITYGROUPDESC,STARTDT,ENDDT,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,NOTREQUIREDCOUNT)
values (1861,'Physical Activity Group Ketchikan Gateway Borough and School District',to_timestamp('01-JAN-19 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),to_timestamp('31-DEC-25 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',0);
--Labeling the digital activity group with an ID of 1863
Insert into incv.activitygroup (ACTIVITYGROUPID,ACTIVITYGROUPDESC,STARTDT,ENDDT,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,NOTREQUIREDCOUNT)
values (1863,'Digital Activity Group Ketchikan Gateway Borough and School District',to_timestamp('01-JAN-19 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),to_timestamp('31-DEC-25 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',0);

--Attaching the activity group with an ID of 1849 to the reward with an ID of 1734
Insert into incv.REWARDACTIVITYGROUPXREF (REWARDID,ACTIVITYGROUPID,ASSOCIATIONEFFECTIVEDT,ASSOCIATIONENDDT,SORTORDERNBR,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY)
values (1734,1849,to_timestamp('01-JAN-19 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),to_timestamp('31-DEC-25 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),4,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV');
--Attaching the activity group with an ID of 1859 to the reward with an ID of 1734
Insert into incv.REWARDACTIVITYGROUPXREF (REWARDID,ACTIVITYGROUPID,ASSOCIATIONEFFECTIVEDT,ASSOCIATIONENDDT,SORTORDERNBR,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY)
values (1734,1859,to_timestamp('01-JAN-19 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),to_timestamp('31-DEC-25 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),3,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV');
--Attaching the activity group with an ID of 1861 to the reward with an ID of 1734
Insert into incv.REWARDACTIVITYGROUPXREF (REWARDID,ACTIVITYGROUPID,ASSOCIATIONEFFECTIVEDT,ASSOCIATIONENDDT,SORTORDERNBR,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY)
values (1734,1861,to_timestamp('01-JAN-19 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),to_timestamp('31-DEC-25 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),1,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV');
--Attaching the activity group with an ID of 1863 to the reward with an ID of 1734
Insert into incv.REWARDACTIVITYGROUPXREF (REWARDID,ACTIVITYGROUPID,ASSOCIATIONEFFECTIVEDT,ASSOCIATIONENDDT,SORTORDERNBR,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY)
values (1734,1863,to_timestamp('01-JAN-19 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),to_timestamp('31-DEC-25 12.00.00.000000000 AM','DD-MON-YY HH.MI.SSXFF AM'),2,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV');


--Attaching the program with the ID of 1745 and the reward with the ID of 1734 and the activity groups with the IDs of 1849, 1859, 1861, and 1863 to participant types of 'E', 'S', and 'P'
Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1745,'INCGOALCAT_PGM','PARTTYPE_E',0,750,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',20517,'INCGOALTYPE_DOL');
Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1745,'INCGOALCAT_PGM','PARTTYPE_S',0,500,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',20518,'INCGOALTYPE_DOL');
Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1745,'INCGOALCAT_PGM','PARTTYPE_P',0,250,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',20519,'INCGOALTYPE_DOL');
Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1734,'INCGOALCAT_RWD','PARTTYPE_E',0,750,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',20520,'INCGOALTYPE_DOL');
Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1734,'INCGOALCAT_RWD','PARTTYPE_S',0,500,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',20521,'INCGOALTYPE_DOL');
Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1734,'INCGOALCAT_RWD','PARTTYPE_P',0,250,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',20522,'INCGOALTYPE_DOL');

Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1849,'INCGOALCAT_GRP','PARTTYPE_E',0,150,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',1689,'INCGOALTYPE_DOL');
Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1849,'INCGOALCAT_GRP','PARTTYPE_S',0,100,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',1690,'INCGOALTYPE_DOL');
Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1849,'INCGOALCAT_GRP','PARTTYPE_P',0,50,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',1691,'INCGOALTYPE_DOL');

Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1859,'INCGOALCAT_GRP','PARTTYPE_E',0,150,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',1686,'INCGOALTYPE_DOL');
Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1859,'INCGOALCAT_GRP','PARTTYPE_S',0,100,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',1687,'INCGOALTYPE_DOL');
Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1859,'INCGOALCAT_GRP','PARTTYPE_P',0,50,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',1688,'INCGOALTYPE_DOL');
Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1861,'INCGOALCAT_GRP','PARTTYPE_E',0,450,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',1680,'INCGOALTYPE_DOL');
Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1861,'INCGOALCAT_GRP','PARTTYPE_S',0,300,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',1681,'INCGOALTYPE_DOL');
Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1861,'INCGOALCAT_GRP','PARTTYPE_P',0,150,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',1682,'INCGOALTYPE_DOL');
Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1863,'INCGOALCAT_GRP','PARTTYPE_E',0,150,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',1683,'INCGOALTYPE_DOL');
Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1863,'INCGOALCAT_GRP','PARTTYPE_S',0,100,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',1684,'INCGOALTYPE_DOL');
Insert into incv.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1863,'INCGOALCAT_GRP','PARTTYPE_P',0,50,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',1685,'INCGOALTYPE_DOL');

commit;
/*Program 1745 End*/
-------------------------------------
--Program id 1800 starts Ertekin--
-------------------------------------

--Creating a new PROGRAM by using the 'MetLife 2038' (emulated programid is 1731)
Insert into incv.program (PROGRAMID,PROGRAMNM,PROGRAMEFFECTIVEDT,PROGRAMENDDT,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,DISPLAYDT)
values (1800,'MetLife 2038 Test Program for 2019-PI-S2',to_timestamp('01-JAN-19 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('31-DEC-25 11.59.00.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP);

-- Assign the program to an existing SUPPLIER
Insert into incv.SUPPLIERPROGRAMASSOC (AHMSUPPLIERID,PROGRAMID,EFFECTIVEDT,ENDDT,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,SPOUSETREATEDASEMPIND,ISSPOUSEPARTNERAPPLICABLE)
values (14010,1800,to_timestamp('01-JAN-19 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('31-DEC-25 11.59.00.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV','Y','N');

-- Creating a REWARD for the program of 1800 with the rewardid of 1811 (emulated rewardid is 1775)
Insert into incv.reward (REWARDID,REWARDNM,PROGRAMID,SORTORDERNBR,NOOFACTIVITIESTOCOMPLETE,REWARDEFFECTIVEDT,REWARDENDDT,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY)
values (1811,'MetLife 2038 Test Program for HYW, Biometric_Complteion and Prev_Screening',1800,5,3,to_timestamp('01-JAN-19 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('31-DEC-25 11.59.00.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV');

-- Creating activity group for the reward (emulated 1949)
Insert into INCV.ACTIVITYGROUP (ACTIVITYGROUPID,ACTIVITYGROUPDESC,STARTDT,ENDDT,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,NOTREQUIREDCOUNT)
values (2011,'MetLife 2038 Test Program for HYW, Biometric_Complteion and Prev_Screening',to_timestamp('01-JAN-19 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('31-DEC-25 11.59.00.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',0);

-- Associating the HYW activity group of 2011 with the rewardid of 1811
Insert into INCV.REWARDACTIVITYGROUPXREF (REWARDID,ACTIVITYGROUPID,ASSOCIATIONEFFECTIVEDT,ASSOCIATIONENDDT,SORTORDERNBR,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY)
values (1811,2011,to_timestamp('01-JAN-19 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('31-DEC-25 11.59.00.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),5,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV');

-- Creating INCENTIVEGOALTYPE for the new reward (emulated rewardid is 20285)
Insert into incv.INCENTIVEGOALTYPE (INCENTIVEGOALTYPESKEY,GOALCATEGORYIDENTIFIER,GOALCATEGORYMNEMONIC,GOALTYPEMNEMONIC,VOIDFLG,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY)
values (2011,1811,'INCGOALCAT_RWD','INCGOALTYPE_DOL','IN',CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV');

-- --Attaching the reward with the ID of 1811 to participant types of 'E', 'S', C+, and 'P'
Insert into INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1811,'INCGOALCAT_RWD','PARTTYPE_E',0,250,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',21051,'INCGOALTYPE_DOL');
Insert into INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1811,'INCGOALCAT_RWD','PARTTYPE_P',0,200,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',21052,'INCGOALTYPE_DOL');
Insert into INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1811,'INCGOALCAT_RWD','PARTTYPE_S',0,200,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',21053,'INCGOALTYPE_DOL');
Insert into INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1811,'INCGOALCAT_RWD','PARTTYPE_C+',0,200,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',21054,'INCGOALTYPE_DOL');
Insert into INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1811,'INCGOALCAT_RWD','PARTTYPE_D',0,200,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',21055,'INCGOALTYPE_DOL');


-- --Attaching the ACTIVITYGROUP with the IDs of 2011 to participant types of 'E', 'S', C+, 'D' and 'P'
Insert into INCV.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (2011,'INCGOALCAT_GRP','PARTTYPE_E',0,250,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',21059,'INCGOALTYPE_DOL');
Insert into INCV.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (2011,'INCGOALCAT_GRP','PARTTYPE_S',0,200,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',21060,'INCGOALTYPE_DOL');
Insert into INCV.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (2011,'INCGOALCAT_GRP','PARTTYPE_P',0,200,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',21061,'INCGOALTYPE_DOL');
Insert into INCV.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (2011,'INCGOALCAT_GRP','PARTTYPE_C+',0,200,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',21062,'INCGOALTYPE_DOL');
Insert into INCV.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (2011,'INCGOALCAT_GRP','PARTTYPE_D',0,200,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',21068,'INCGOALTYPE_DOL');


-- --Attaching the ACTIVITYGROUP with the IDs of 2011 to participant types of 'E', 'S', C+, 'D' and 'P'
Insert into INCV.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1800,'INCGOALCAT_PGM','PARTTYPE_E',0,250,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',21063,'INCGOALTYPE_DOL');
Insert into INCV.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1800,'INCGOALCAT_PGM','PARTTYPE_S',0,200,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',21064,'INCGOALTYPE_DOL');
Insert into INCV.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1800,'INCGOALCAT_PGM','PARTTYPE_P',0,200,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',21065,'INCGOALTYPE_DOL');
Insert into INCV.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1800,'INCGOALCAT_PGM','PARTTYPE_C+',0,200,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',21066,'INCGOALTYPE_DOL');
Insert into INCV.INCENTIVEGOALVALUE (INCENTIVEGOALCATEGORYID,INCENTIVEGOALCATEGORYMNEMONIC,PARTICIPANTTYPEMNEMONIC,INCENTIVEGOALMINVAL,INCENTIVEGOALMAXVAL,INSERTEDDT,INSERTEDBY,UPDATEDDT,UPDATEDBY,INCENTIVEGOALVALUESKEY,GOALTYPEMNEMONIC)
values (1800,'INCGOALCAT_PGM','PARTTYPE_D',0,200,CURRENT_TIMESTAMP,'INCV',CURRENT_TIMESTAMP,'INCV',21067,'INCGOALTYPE_DOL');

-------------------------------------
--Program id 1800 ends Ertekin--
-------------------------------------




commit;
