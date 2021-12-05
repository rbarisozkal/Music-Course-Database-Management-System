CREATE TABLE "Instructors" (
  "Inst_ID" varchar(10),
  "Inst_Name" varchar(30),
  "Ins_Salary" int,
  PRIMARY KEY ("Inst_ID")
);

CREATE TABLE "Classroom" (
  "Classroom_ID" varchar(10),
  "Capacity" integer not null check ("Capacity" between 0 and 20),
  "Deparment_Name" varchar(30),
  PRIMARY KEY ("Classroom_ID")
);


CREATE TABLE "Section" (
  "Section_ID" varchar(10),
  "Day" varchar(30),
  "Clock" time,
  "Instrument_Name" varchar(30),
  "Classroom_ID" varchar(10),
  PRIMARY KEY ("Section_ID", "Instrument_Name")
);
CREATE TABLE "Section_Classroom" (
  "Section_ID" varchar(10),			
  "Instrument_Name" varchar(30),
  "Classroom_ID" varchar(10),
  PRIMARY KEY ("Section_ID", "Instrument_Name", "Classroom_ID")
);

CREATE TABLE "Section_Instruments" (
  "Section_ID" varchar(10),
  "Instrument_Name" varchar(30),
  "Instruments_Name" varchar(30),
  PRIMARY KEY ("Section_ID", "Instrument_Name", "Instruments_Name")
);

CREATE TABLE "Takes" (
  "Student_ID" varchar(10),
  "Instrument_Name" varchar(30),
  "Section_ID" varchar(10),
  PRIMARY KEY ("Student_ID", "Instrument_Name", "Section_ID")
);

CREATE TABLE "Teaches" (
  "Ins_ID" varchar(10),
  "Instrument_Name" varchar(30),
  "Section_ID" varchar(10),
  PRIMARY KEY ("Ins_ID", "Instrument_Name", "Section_ID")
);

CREATE TABLE "Department" (
  "Dept_Name" varchar(30),
  "Budget" int,
  PRIMARY KEY ("Dept_Name")
);

CREATE TABLE "Student" (
  "Student_ID" varchar(10),
  "Stu_Name" varchar(30),
  PRIMARY KEY ("Student_ID")
);

CREATE TABLE "Instruments" (
  "Dept_Name" varchar(30),
  "Instrument_Name" varchar(30), 
  PRIMARY KEY ("Instrument_Name")
 
);

alter table "Section" add column "Classroom_ID" varchar(10);
alter table "Takes" add column "Inst_Name" varchar(30);

ALTER TABLE "Section" ADD CONSTRAINT section_fk FOREIGN KEY ("Classroom_ID") REFERENCES public."Classroom"("Classroom_ID");
ALTER TABLE "Section" ADD CONSTRAINT section_fk_2 FOREIGN KEY ("Section_ID") REFERENCES public."Section"("Section_ID");
ALTER TABLE "Section" ADD CONSTRAINT section_fk_1 FOREIGN KEY ("Instrument_Name") REFERENCES public."Instruments"("Instrument_Name");
ALTER TABLE "Instruments" ADD CONSTRAINT instruments_fk FOREIGN KEY ("Dept_Name") REFERENCES public."Department"("Dept_Name");
ALTER TABLE "Teaches" ADD CONSTRAINT teaches_fk FOREIGN KEY ("Section_ID","Instrument_Name") REFERENCES public."Section"("Section_ID","Instrument_Name");
ALTER TABLE "Teaches" add CONSTRAINT teaches_fk_3 FOREIGN KEY ("Ins_ID") REFERENCES public."Instructors"("Inst_ID");
ALTER TABLE "Takes" ADD CONSTRAINT takes_fk FOREIGN KEY ("Student_ID") REFERENCES public."Student"("Student_ID");
ALTER TABLE "Takes" ADD CONSTRAINT takes_fk_2 FOREIGN KEY ("Section_ID","Instrument_Name") REFERENCES public."Section"("Section_ID","Instrument_Name");
ALTER TABLE public."Section_Classroom" ADD CONSTRAINT section_classroom_fk FOREIGN KEY ("Classroom_ID") REFERENCES public."Classroom"("Classroom_ID");
ALTER TABLE public."Section_Classroom" ADD CONSTRAINT section_classroom_fk_1 FOREIGN KEY ("Section_ID","Instrument_Name") REFERENCES public."Section"("Section_ID","Instrument_Name");


ALTER TABLE public."Section_Instruments" ALTER COLUMN "Instrument_Name" TYPE varchar(30) USING "Instrument_Name"::varchar;
ALTER TABLE public."Section_Instruments" ADD CONSTRAINT section_instruments_fk FOREIGN KEY ("Section_ID","Instrument_Name") REFERENCES public."Section"("Section_ID","Instrument_Name");
ALTER TABLE public."Section_Instruments" ADD CONSTRAINT section_instruments_fk_1 FOREIGN KEY ("Instrument_Name") REFERENCES public."Instruments"("Instrument_Name");
ALTER TABLE public."Section_Classroom" ALTER COLUMN "Instrument_Name" TYPE varchar(30) USING "Instrument_Name"::varchar;

alter TABLE "Student" add column "Stu_Surname" varchar(30);
alter TABLE "Student" add column "Stu_Age" int;
alter TABLE "Student" add column "Adress" varchar(50);
alter TABLE "Student" add column "Experience" int;
alter TABLE "Student" add column "Enrollment_Day" date;
alter TABLE "Instruments" add column "Material" varchar(30);

alter TABLE "Instructors" add column "Experience" int;
alter TABLE "Instructors" add column "Expertise" varchar(30);
alter TABLE "Instructors" add column "Adress" varchar(50);



insert into "Department" values('With keys',1000000);
insert into "Department" values('Bow',500000);
insert into "Department" values('Stringeds',400000);
insert into "Department" values('Percussions',300000);
insert into "Department" values('Winded',300000);

insert into "Instruments"  values ('With keys', 'Piano');
insert into "Instruments"  values ('With keys', 'Org');
insert into "Instruments"  values ('With keys', 'Bandoneon');
insert into "Instruments"  values ('Bow', 'Cello');
insert into "Instruments"  values ('Bow', 'Violin');
insert into "Instruments"  values ('Bow', 'DoubleBass');
insert into "Instruments"  values ('Stringeds', 'Guitar');
insert into "Instruments"  values ('Stringeds', 'Ukulele');
insert into "Instruments"  values ('Stringeds', 'Arp');
insert into "Instruments"  values ('Percussions', 'Drum');
insert into "Instruments"  values ('Percussions', 'Tambourine');
insert into "Instruments"  values ('Percussions', 'Ksilofon');
insert into "Instruments"  values ('Winded', 'Flute');
insert into "Instruments"  values ('Winded', 'Obue');
insert into "Instruments"  values ('Winded', 'Clarinet');

insert into "Instructors"  values ('11215', 'John',3000,10,'Guitar','Lumberger');
insert into "Instructors"  values ('15000', 'Taylor',6000,12,'Guitar','Lumberger');
insert into "Instructors"  values ('13245', 'Summer',2500,12,'Guitar','Lumberger');
insert into "Instructors"  values ('12345', 'Katz',4000,11,'Guitar','Lumberger');
insert into "Instructors"  values ('18000', 'Barýþ',1500,11,'Guitar','Soria');
insert into "Instructors"  values ('17898', 'Ceyhun',1000,11,'Piano','Soria');
insert into "Instructors"  values ('11152', 'Renas',5000,15,'Piano','Soria');
insert into "Instructors"  values ('26116', 'Cyle',2750,15,'Piano','Soria');
insert into "Instructors"  values ('89010', 'Samuel',3400,15,'Arp','Sutna');
insert into "Instructors"  values ('84321', 'Julian',2010,16,'Org','Sutna');
insert into "Instructors"  values ('48211', 'Jennifer',3000,16,'Org','Sutna');
insert into "Instructors"  values ('48201', 'Julia',3000,20,'Clarinet','Sutna');
insert into "Instructors"  values ('84521', 'Caleb',4000,20,'Bandoneon','Wranth');
insert into "Instructors"  values ('25100', 'Uma',1500,23,'Bandoneon','Wranth');
insert into "Instructors"  values ('94512', 'Ladin',1700,23,'Cello','Wranth');
insert into "Instructors"  values ('36017', 'Abdulkareem',1900,19,'Cello','Orara');
insert into "Instructors"  values ('98451', 'Michael',2000,19,'Violin','Orara');
insert into "Instructors"  values ('18912', 'Sally',4500,17,'Violin','Orara');
insert into "Instructors"  values ('89745', 'Judith',1850,21,'DoubleBass','Orara');
insert into "Instructors"  values ('21681', 'Jane',4235,21,'DoubleBass','Franie');
insert into "Instructors"  values ('89451', 'Jacinda',3100,33,'Arp','Franie');
insert into "Instructors"  values ('15441', 'Denise',3300,24,'Piano','Franie');
insert into "Instructors"  values ('51521', 'Ýpek',3200,125,'Ukulele','Franie');
insert into "Instructors"  values ('45385', 'Trevor',2000,19,'Ukulele','Rathar');
insert into "Instructors"  values ('53753', 'Lily',1700,35,'Drum','Rathar');
insert into "Instructors"  values ('45387', 'Harvey',1800,23,'Drum','Rathar');
insert into "Instructors"  values ('53842', 'Celine',1550,19,'Tambourine','Rathar');
insert into "Instructors"  values ('78952', 'Tessa',2100,19,'Tambourine','Soria');
insert into "Instructors"  values ('87654', 'Patrick',4500,18,'Ksilofon','Soria');
insert into "Instructors"  values ('23127', 'Nyles',1800,12,'Ksilofon','Soria');
insert into "Instructors"  values ('78954', 'Kelly',3400,15,'Flute','Soria');
insert into "Instructors"  values ('12367', 'Brook',2800,23,'Flute','Menoly');
insert into "Instructors"  values ('75456', 'Samantha',3000,23,'Obue','Menoly');
insert into "Instructors"  values ('21592', 'Grace',2350,24,'Obue','Menoly');
insert into "Instructors"  values ('51593', 'Sophia',2950,115,'Clarinet','Menoly');
insert into "Instructors" values('22651','Yasar',3000,953,'Maracas','Menoly');


insert into "Classroom" values ('21000',18,'Stringeds');
insert into "Classroom" values ('21010',17,'Stringeds');
insert into "Classroom" values ('31000',10,'With keys');
insert into "Classroom" values ('31010',8,'With keys');
insert into "Classroom" values ('51010',6,'Percussions');
insert into "Classroom" values ('42000',15,'Winded');
insert into "Classroom" values ('1020',12,'Bow');

insert into "Section" values('01','Monday','08:30:00','Guitar','21010');
insert into "Section" values('02','Monday','10:30:00','Guitar','31000');
insert into "Section" values('01','Monday','12:30:00','Piano','31010');
insert into "Section" values('02','Monday','15:30:00','Piano','31000');
insert into "Section" values('01','Monday','17:30:00','Org','31010');
insert into "Section" values('01','Monday','19:30:00','Bandoneon','1020');
insert into "Section" values('01','Monday','21:30:00','Cello','1020');
insert into "Section" values('01','Tuesday','08:30:00','Violin','1020');
insert into "Section" values('01','Tuesday','10:30:00','DoubleBass','21000');
insert into "Section" values('01','Tuesday','12:30:00','Arp','21000');
insert into "Section" values('01','Tuesday','15:30:00','Ukulele','21010');
insert into "Section" values('01','Tuesday','17:30:00','Drum','51010');
insert into "Section" values('01','Tuesday','19:30:00','Tambourine','51010');
insert into "Section" values('01','Tuesday','21:30:00','Ksilofon','51010');
insert into "Section" values('01','Wednesday','08:30:00','Flute','42000');
insert into "Section" values('01','Wednesday','10:30:00','Obue','42000');
insert into "Section" values('01','Wednesday','12:30:00','Clarinet','42000');
insert into "Section" values('05','Wednesday','15:30:00','Guitar','21000');
insert into "Section" values('03','Wednesday','17:30:00','Guitar','21010');
insert into "Section" values('03','Wednesday','19:30:00','Piano','31010');
insert into "Section" values('04','Wednesday','21:30:00','Piano','31000');
insert into "Section" values('02','Thursday','08:30:00','Org','31000');
insert into "Section" values('02','Thursday','15:30:00','Bandoneon','31010');
insert into "Section" values('02','Thursday','17:30:00','Cello','1020');
insert into "Section" values('02','Thursday','15:30:00','Violin','1020');
insert into "Section" values('02','Thursday','19:30:00','DoubleBass','1020');
insert into "Section" values('02','Thursday','18:30:00','Arp','21010');
insert into "Section" values('02','Thursday','21:30:00','Ukulele','21010');
insert into "Section" values('02','Friday','08:30:00','Drum','51010');
insert into "Section" values('02','Friday','10:30:00','Tambourine','51010');
insert into "Section" values('02','Friday','12:30:00','Ksilofon','51010');
insert into "Section" values('02','Friday','15:00:00','Flute','42000');
insert into "Section" values('02','Friday','17:30:00','Obue','42000');
insert into "Section" values('02','Friday','19:30:00','Clarinet','42000');
insert into "Section" values('04','Friday','21:30:00','Guitar','21000');



insert into "Student" values ('21515','Michael', 'Christopher',15, 'Soria', 1, '2016-01-13');
insert into "Student" values ('61651','Christopher','Jean',14, 'Noria',2, '2018-01-14');
insert into "Student" values ('65121','Jessica','Malic',18,'Fater',6,'2015-01-9');
insert into "Student" values ('78245','Damon','Salvatore',21,'Mystic Falls', 4, '2016-04-15');
insert into "Student" values ('45340','Ashley', 'Gilbert', 23, 'Mystic Falls',5,'2019-03-29');
insert into "Student" values ('43731','Jennifer', 'Lopez', 16, 'Mantona',10,'2017-06-22');
insert into "Student" values ('43721','Joshua','Conner',15,'Lumberger', 6, '2016-04-13');
insert into "Student" values ('78372','Amanda','Tonner',14,'Lumberger', 6, '2016-04-13');
insert into "Student" values ('78361','Daniel','Tonner',13,'Tuan', 6, '2016-04-13');
insert into "Student" values ('78612','David','Adams',13,'Tuan', 6, '2016-04-13');
insert into "Student" values ('45375','James','Adams',13,'Franie', 6, '2016-04-13');
insert into "Student" values ('78213','Robert','Adams',13,'Franie', 6, '2016-04-13');
insert into "Student" values ('73275','John','Allen',13,'Franie', 6, '2015-04-13');
insert into "Student" values ('45342','Joseph','Allen',14,'Franie', 6, '2015-04-13');
insert into "Student" values ('78342','Andrew','Allen',14,'Orara', 6, '2015-04-13');
insert into "Student" values ('78641','Ryan','Anderson',14,'Orara', 6, '2015-04-13');
insert into "Student" values ('45372','Brandon','Anderson',14,'Orara', 5, '2015-04-13');
insert into "Student" values ('45312','Jason','Armstrong',14,'Orara', 5, '2015-04-13');
insert into "Student" values ('53120','Justin','Atkinson',14,'Orara', 5, '2015-04-13');
insert into "Student" values ('45317','Sarah','Bailey',16,'Nenal', 5, '2015-04-13');
insert into "Student" values ('45126','William','Baker',16,'Nenal', 5, '2015-04-13');
insert into "Student" values ('42125','Jonathan','Ball',16,'Nenal', 5, '2015-04-13');
insert into "Student" values ('78321','Stephanie','Barker',16,'Nenal', 5, '2015-04-13');
insert into "Student" values ('68745','Brian','Barnes',16,'Qiyona', 5, '2015-04-13');
insert into "Student" values ('97543','Nicole','Bell',16,'Qiyona', 5, '2015-04-13');
insert into "Student" values ('77862','Nicholas','Bennett',16,'Qiyona', 5, '2015-04-13');
insert into "Student" values ('89754','Anthony','Booth',12,'Qiyona', 4, '2015-04-13');
insert into "Student" values ('23157','Heather','Bradley',12,'Zed', 4, '2018-04-13');
insert into "Student" values ('78942','Eric','Brooks',12,'Zed', 4, '2018-04-13');
insert into "Student" values ('42375','Elizabeth','Brown',12,'Zed', 4, '2018-04-13');
insert into "Student" values ('12359','Adam','Burton',12,'Zed', 4, '2018-04-13');
insert into "Student" values ('78945','Megan','Butler',18,'Faren', 3, '2018-04-13');
insert into "Student" values ('23532','Melissa','Campbell',18,'Faren', 3, '2018-04-13');
insert into "Student" values ('79776','Kevin','Carter',18,'Faren', 3, '2018-04-13');
insert into "Student" values ('78621','Steven','Chapman',18,'Faren', 3, '2018-04-13');
insert into "Student" values ('78542','Thomas','Clarke',18,'Faren', 3, '20169-04-13');
insert into "Student" values ('78524','Timothy','Cole',18,'Faren', 3, '2019-04-13');
insert into "Student" values ('78645','Christina','Collins',18,'Numer', 3, '2019-04-13');
insert into "Student" values ('43483','Kyle','Cook',17,'Numer', 2, '2019-04-13');
insert into "Student" values ('45337','Rachel','Cooper',17,'Numer', 2, '2019-04-13');
insert into "Student" values ('12387','Laura','Corbyn',17,'Numer', 2, '2019-04-13');
insert into "Student" values ('87612','Lauren','Cox',17,'Numer', 2, '2019-04-13');
insert into "Student" values ('78344','Amber','Davidson',17,'Numer', 2, '2019-04-13');
insert into "Student" values ('12372','Brittany','Davies',20,'Syvina', 10, '2019-04-13');
insert into "Student" values ('87621','Danielle','Dawson',20,'Syvina', 1, '2020-04-13');
insert into "Student" values ('87642','Richard','CoDixonnner',20,'Syvina', 1, '2020-04-13');
insert into "Student" values ('78332','Kimberly','Edwards',18,'Syvina', 1, '2020-04-13');
insert into "Student" values ('45672','Jeffrey','Elliott',14,'Syvina', 1, '2020-04-13');
insert into "Student" values ('78643','Amy','Evans',9,'Revianth', 1, '2020-04-13');
insert into "Student" values ('78613','Crystal','Fisher',8,'Revianth', 1, '2020-04-13');
insert into "Student" values ('34512','Michelle','Fletcher',8,'Revianth', 1, '2020-04-13');
insert into "Student" values ('24621','Tiffany','Ford',8,'Revianth', 1, '2020-04-13');
insert into "Student" values ('21375','Jeremy','Foster',8,'Selona', 2, '2020-04-13');
insert into "Student" values ('12381','Benjamin','Fox',9,'Selona', 2, '2020-04-13');
insert into "Student" values ('78943','Mark','Gibson',9,'Selona', 2, '2020-04-13');
insert into "Student" values ('23213','Emily','Graham',9,'Selona', 2, '2020-04-13');
insert into "Student" values ('22334','Aaron','Grant',13,'Iota', 5, '2021-04-13');
insert into "Student" values ('11235','Charles','Gray',13,'Iota', 5, '2021-04-13');
insert into "Student" values ('33604','Rebecca','Grant',13,'Iota', 5, '2021-04-13');
insert into "Student" values ('70032','Jacob','Green',14,'Wranth', 5, '2021-04-13');
insert into "Student" values ('26468','Stephen','Griffiths',14,'Wranth', 5, '2021-04-13');
insert into "Student" values ('21112','Patrick','Hall',14,'Wranth', 7, '2021-04-13');
insert into "Student" values ('32213','Sean','Hamilton',13,'Wranth', 7, '2021-04-13');
insert into "Student" values ('44423','Erin','Harris',12,'Wranth', 7, '2021-04-13');
insert into "Student" values ('21103','Zachary','Harrison',12,'Wranth', 7, '2021-04-13');
insert into "Student" values ('66500','Jamie','Harvey',10,'Erath', 7, '2015-04-13');
insert into "Student" values ('55101','Kelly','Henderson',10,'Erath', 7, '2015-04-13');
insert into "Student" values ('23314','Samantha','Hill',12,'Erath', 8, '2015-04-13');
insert into "Student" values ('33512','Nathan','Holmes',14,'Erath', 8, '2015-04-13');
insert into "Student" values ('10000','Sara','Howard',15,'Ura', 8, '2013-04-13');
insert into "Student" values ('10320','Dustin','Hughes',12,'Ura', 8, '2013-04-13');
insert into "Student" values ('12232','Paul','Hunt',11,'Ura', 4, '2013-04-13');
insert into "Student" values ('10030','Angela','Hunter',11,'Ura', 4, '2013-04-13');
insert into "Student" values ('55151','Tyler','Jackson',11,'Menoly', 3, '2013-04-13');
insert into "Student" values ('32210','Scott','James',11,'Menoly', 3, '2013-04-13');
insert into "Student" values ('44003','Katherine','Jenkins',9,'Menoly', 3, '2020-04-13');
insert into "Student" values ('20103','Andrea','Johnson',18,'Menoly', 2, '2013-04-13');
insert into "Student" values ('60500','Gregory','Johnston',18,'Menoly', 2, '2013-04-13');
insert into "Student" values ('18015','Erica','Jones',18,'Tomaya', 2, '2013-04-13');
insert into "Student" values ('67041','Mary','Kelly',19,'Tomaya', 1, '2013-04-13');
insert into "Student" values ('69151','Travis','Kennedy',10,'Tomaya', 2, '2013-04-13');
insert into "Student" values ('10001','Lisa','King',11,'Tomaya', 5, '2021-04-13');
insert into "Student" values ('10501','Kenneth','Knight',12,'Tomaya', 4, '2016-04-13');
insert into "Student" values ('10901','Bryan','Lawrence',12,'Senera', 2, '2017-04-13');
insert into "Student" values ('10081','Lindsey','Lee',12,'Senera', 3, '2017-04-13');
insert into "Student" values ('11020','Kristen','Lewis',15,'Senera', 3, '2017-04-13');
insert into "Student" values ('18981','Jose','Lloyd',15,'Senera', 3, '2017-04-13');
insert into "Student" values ('99981','Alexander','Marshall',14,'Youth', 7, '2014-03-03');
insert into "Student" values ('10981','Jesse','Martin',14,'Youth', 7, '2014-03-03');
insert into "Student" values ('19681','Katie','Mason',17,'Youth', 7, '2020-09-06');
insert into "Student" values ('18081','Lindsay','Matthews',17,'Youth', 7, '2020-09-06');
insert into "Student" values ('14281','Shannon','McDonald',17,'Midtown', 8, '2020-09-06');
insert into "Student" values ('14181','Vanessa','Miller',17,'Midtown', 8, '2020-09-06');
insert into "Student" values ('10071','Courtney','Mitchell',18,'Midtown', 8, '2020-07-09');
insert into "Student" values ('18810','Christine','Moore',18,'Midtown', 9, '2020-07-09');
insert into "Student" values ('10203','Alicia','Morgan',16,'Midtown', 9, '2020-07-09');
insert into "Student" values ('14444','Cody','Morris',16,'Wero', 9, '2020-03-04');
insert into "Student" values ('10003','Allison','Morrison',15,'Wero', 9, '2020-03-04');
insert into "Student" values ('10004','Bradley','Murphy',12,'Wero', 6, '2020-03-04');
insert into "Student" values ('88841','Samuel','Murray',12,'Wero', 6, '2019-08-28');
insert into "Student" values ('19304','Shawn','Owen',11,'Wero', 5, '2019-08-28');
insert into "Student" values ('81512','April','Palmer',18,'Sutna', 4, '2019-08-28');
insert into "Student" values ('89421','Derek','Parker',18,'Sutna', 2, '2019-08-11');
insert into "Student" values ('88848','Kathryn','Payne',20,'Sutna', 1, '2019-08-11');
insert into "Student" values ('89821','Kristin','Pearce',18,'Sutna', 2, '2019-08-11');
insert into "Student" values ('89420','Chad','Pearson',20,'Sellin', 3, '2018-03-22');
insert into "Student" values ('89441','Jenna','Perry',20,'Sellin', 2, '2018-03-22');
insert into "Student" values ('89331','Tara','Phillips',11,'Sellin', 4, '2018-03-22');
insert into "Student" values ('99451','Maria','Powell',12,'Sellin', 5, '2018-02-02');
insert into "Student" values ('80841','Krystal','Price',15,'Rathar', 5, '2018-01-31');
insert into "Student" values ('80331','Jared','Reid',12,'Rathar', 4, '2018-01-21');
insert into "Student" values ('80031','Anna','Reynolds',19,'Rathar', 10, '2017-11-21');
insert into "Student" values ('77778','Edward','Richards',19,'Rathar', 12, '2016-11-25');
insert into "Student" values ('99999','Julie','Richardson',19,'Rathar', 12, '2016-04-13');
insert into "Student" values ('89584','Peter','Roberts',19,'Muthe', 7, '2016-11-04');
insert into "Student" values ('22030','Holly','Robertson',19,'Muthe', 6, '2016-10-18');
insert into "Student" values ('20215','Marcus','Robinson',19,'Muthe', 6, '2016-03-20');
insert into "Student" values ('10505','Kristina','Rogers',9,'Muthe', 3, '2015-12-15');
insert into "Student" values ('30001','Natalie','Rose',9,'Lumberger', 5, '2015-06-27');
insert into "Student" values ('90301','Jordan','Ross',9,'Cora', 4, '2015-02-25');
insert into "Student" values ('51214','Victoria','Russell',10,'Cora', 4, '2014-12-07');
insert into "Student" values ('11120','Jacqueline','Saunders',10,'Cora', 3, '2014-09-07');
insert into "Student" values ('20303','Corey','Scott',10,'Cora', 2, '2014-02-02');
insert into "Student" values ('11028','Keith','Shaw',10,'Cora', 1, '2016-04-13');
insert into "Student" values ('18120','Monica','Simpson',10,'Ternan', 1, '2014-02-11');
insert into "Student" values ('19120','Juan','Smith',10,'Ternan', 2, '2016-04-13');
insert into "Student" values ('16120','Donald','Spencer',10,'Ternan', 5, '2016-04-13');
insert into "Student" values ('17120','Cassandra','Stevens',11,'Burat', 7, '2014-09-02');
insert into "Student" values ('17800','Meghan','Stewart',11,'Burat', 5, '2016-04-13');
insert into "Student" values ('88900','Joel','Taylor',11,'Burat', 4, '2015-01-14');
insert into "Student" values ('30900','Shane','Thomas',11,'Kessra', 7, '2016-04-13');
insert into "Student" values ('36001','Phillip','Thompson',11,'Kessra', 3, '2018-05-29');
insert into "Student" values ('55152','Patricia','Thomson',11,'Kessra', 2, '2019-04-13');



insert into "Takes" values ('99999', 'Clarinet','02','Julian');
insert into "Takes" values ('99981', 'Clarinet','01','Sophia');
insert into "Takes" values ('99451', 'Clarinet','01','Sophia');
insert into "Takes" values ('97543', 'Obue','02','Grace');
insert into "Takes" values ('90301', 'Obue','02','Grace');
insert into "Takes" values ('89821', 'Obue','01','Samantha');
insert into "Takes" values ('89754', 'Obue','01','Samantha');
insert into "Takes" values ('89584', 'Obue','01','Samantha');
insert into "Takes" values ('89441', 'Obue','01','Samantha');
insert into "Takes" values ('89421', 'Obue','01','Samantha');
insert into "Takes" values ('89420', 'Flute','01','Kelly');
insert into "Takes" values ('89331', 'Flute','01','Kelly');
insert into "Takes" values ('88900', 'Flute','01','Kelly');
insert into "Takes" values ('88848', 'Flute','01','Kelly');
insert into "Takes" values ('88841', 'Flute','01','Kelly');
insert into "Takes" values ('87642', 'Flute','01','Kelly');
insert into "Takes" values ('87621', 'Flute','02','Brook');
insert into "Takes" values ('87612', 'Flute','02','Brook');
insert into "Takes" values ('81512', 'Flute','02','Brook');
insert into "Takes" values ('80841', 'Flute','02','Brook');
insert into "Takes" values ('80331', 'Ksilofon','02','Nyles');
insert into "Takes" values ('80031', 'Ksilofon','02','Nyles');
insert into "Takes" values ('79776', 'Ksilofon','02','Nyles');
insert into "Takes" values ('78945', 'Ksilofon','01','Patrick');
insert into "Takes" values ('78943', 'Ksilofon','01','Patrick');
insert into "Takes" values ('78942', 'Tambourine','01','Celine');
insert into "Takes" values ('78645', 'Tambourine','01','Celine');
insert into "Takes" values ('78643', 'Tambourine','01','Celine');
insert into "Takes" values ('78641', 'Tambourine','02','Tessa');
insert into "Takes" values ('78621', 'Tambourine','02','Tessa');
insert into "Takes" values ('78613', 'Drum','01','Lily');
insert into "Takes" values ('78612', 'Drum','01','Lily');
insert into "Takes" values ('78542', 'Drum','02','Harvey');
insert into "Takes" values ('78524', 'Drum','02','Harvey');
insert into "Takes" values ('78372', 'Ukulele','01','Ýpek');
insert into "Takes" values ('78361', 'Ukulele','01','Ýpek');
insert into "Takes" values ('78344', 'Ukulele','01','Ýpek');
insert into "Takes" values ('78342', 'Ukulele','02','Trevor');
insert into "Takes" values ('78332', 'Ukulele','02','Trevor');
insert into "Takes" values ('78321', 'Arp','01','Jacinda');
insert into "Takes" values ('78245', 'Arp','01','Jacinda');
insert into "Takes" values ('78213', 'Arp','02','Samuel');
insert into "Takes" values ('77862', 'Arp','02','Samuel');
insert into "Takes" values ('77778', 'DoubleBass','01','Judith');
insert into "Takes" values ('73275', 'DoubleBass','01','Judith');
insert into "Takes" values ('70032', 'DoubleBass','02','Jane');
insert into "Takes" values ('69151', 'DoubleBass','02','Jane');
insert into "Takes" values ('68745', 'Violin','01','Michael');
insert into "Takes" values ('67041', 'Violin','01','Michael');
insert into "Takes" values ('66500', 'Violin','01','Michael');
insert into "Takes" values ('65121', 'Violin','01','Michael');
insert into "Takes" values ('61651', 'Violin','01','Michael');
insert into "Takes" values ('60500', 'Violin','01','Michael');
insert into "Takes" values ('55152', 'Violin','02','Sally');
insert into "Takes" values ('55151', 'Violin','02','Sally');
insert into "Takes" values ('55101', 'Violin','02','Sally');
insert into "Takes" values ('53120', 'Violin','02','Sally');
insert into "Takes" values ('51214', 'Violin','02','Sally');
insert into "Takes" values ('45672', 'Cello','01','Ladin');
insert into "Takes" values ('45375', 'Cello','01','Ladin');
insert into "Takes" values ('45372', 'Cello','02','Abdulkareem');
insert into "Takes" values ('45342', 'Bandoneon','01','Caleb');
insert into "Takes" values ('45340', 'Bandoneon','01','Caleb');
insert into "Takes" values ('45337', 'Bandoneon','02','Uma');
insert into "Takes" values ('45317', 'Bandoneon','02','Uma');
insert into "Takes" values ('45312', 'Org','01','Jennifer');
insert into "Takes" values ('45126', 'Org','01','Jennifer');
insert into "Takes" values ('44423', 'Org','02','Julia');
insert into "Takes" values ('44003', 'Org','02','Julia');
insert into "Takes" values ('43731', 'Org','02','Julia');
insert into "Takes" values ('43721', 'Piano','01','Ceyhun');
insert into "Takes" values ('43483', 'Piano','01','Ceyhun');
insert into "Takes" values ('42375', 'Piano','01','Ceyhun');
insert into "Takes" values ('42125', 'Piano','02','Renas');
insert into "Takes" values ('36001', 'Piano','02','Renas');
insert into "Takes" values ('34512', 'Piano','02','Renas');
insert into "Takes" values ('33604', 'Piano','02','Renas');
insert into "Takes" values ('33512', 'Piano','03','Cyle');
insert into "Takes" values ('32213', 'Piano','03','Cyle');
insert into "Takes" values ('32210', 'Piano','04','Samuel');
insert into "Takes" values ('30900', 'Piano','04','Samuel');
insert into "Takes" values ('30001', 'Piano','04','Samuel');
insert into "Takes" values ('26468', 'Guitar','01','John');
insert into "Takes" values ('24621', 'Guitar','01','John');
insert into "Takes" values ('23532', 'Guitar','01','John');
insert into "Takes" values ('23314', 'Guitar','01','John');
insert into "Takes" values ('23213', 'Guitar','01','John');
insert into "Takes" values ('23157', 'Guitar','01','John');
insert into "Takes" values ('22334', 'Guitar','01','John');
insert into "Takes" values ('22030', 'Guitar','01','John');
insert into "Takes" values ('21515', 'Guitar','01','John');
insert into "Takes" values ('21375', 'Guitar','01','John');
insert into "Takes" values ('21112', 'Guitar','02','Taylor');
insert into "Takes" values ('21103', 'Guitar','02','Taylor');
insert into "Takes" values ('20303', 'Guitar','02','Taylor');
insert into "Takes" values ('20215', 'Guitar','02','Taylor');
insert into "Takes" values ('20103', 'Guitar','02','Taylor');
insert into "Takes" values ('19681', 'Guitar','02','Taylor');
insert into "Takes" values ('19304', 'Guitar','02','Taylor');
insert into "Takes" values ('19120', 'Guitar','02','Taylor');
insert into "Takes" values ('18981', 'Guitar','02','Taylor');
insert into "Takes" values ('18810', 'Guitar','02','Taylor');
insert into "Takes" values ('18120', 'Guitar','02','Taylor');
insert into "Takes" values ('18081', 'Guitar','02','Taylor');
insert into "Takes" values ('18015', 'Guitar','02','Taylor');
insert into "Takes" values ('17800', 'Guitar','03','Summer');
insert into "Takes" values ('17120', 'Guitar','03','Summer');
insert into "Takes" values ('16120', 'Guitar','03','Summer');
insert into "Takes" values ('14444', 'Guitar','03','Summer');
insert into "Takes" values ('14281', 'Guitar','03','Summer');
insert into "Takes" values ('14181', 'Guitar','03','Summer');
insert into "Takes" values ('12387', 'Guitar','03','Summer');
insert into "Takes" values ('12381', 'Guitar','03','Summer');
insert into "Takes" values ('12372', 'Guitar','03','Summer');
insert into "Takes" values ('12359', 'Guitar','03','Summer');
insert into "Takes" values ('12232', 'Guitar','03','Summer');
insert into "Takes" values ('11235', 'Guitar','04','Katz');
insert into "Takes" values ('11120', 'Guitar','04','Katz');
insert into "Takes" values ('11028', 'Guitar','04','Katz');
insert into "Takes" values ('11020', 'Guitar','04','Katz');
insert into "Takes" values ('10981', 'Guitar','04','Katz');
insert into "Takes" values ('10901', 'Guitar','04','Katz');
insert into "Takes" values ('10505', 'Guitar','04','Katz');
insert into "Takes" values ('10501', 'Guitar','05','Barýþ');
insert into "Takes" values ('10320', 'Guitar','05','Barýþ');
insert into "Takes" values ('10203', 'Guitar','05','Barýþ');
insert into "Takes" values ('10081', 'Guitar','05','Barýþ');
insert into "Takes" values ('10071', 'Guitar','05','Barýþ');
insert into "Takes" values ('10030', 'Guitar','05','Barýþ');
insert into "Takes" values ('10004', 'Guitar','05','Barýþ');
insert into "Takes" values ('10003', 'Guitar','05','Barýþ');
insert into "Takes" values ('10001', 'Guitar','05','Barýþ');
insert into "Takes" values ('10000', 'Guitar','05','Barýþ');

insert into "Teaches" values('11215','Guitar','01');
insert into "Teaches" values('15000','Guitar','02');
insert into "Teaches" values('13245','Guitar','03');
insert into "Teaches" values('12345','Guitar','04');
insert into "Teaches" values('18000','Guitar','05');
insert into "Teaches" values('17898','Piano','01');
insert into "Teaches" values('11152','Piano','02');
insert into "Teaches" values('26116','Piano','03');
insert into "Teaches" values('89010','Piano','04');
insert into "Teaches" values('48211','Org','01');
insert into "Teaches" values('48201','Org','02');
insert into "Teaches" values('84521','Bandoneon','01');
insert into "Teaches" values('25100','Bandoneon','02');
insert into "Teaches" values('94512','Cello','01');
insert into "Teaches" values('36017','Cello','02');
insert into "Teaches" values('98451','Violin','01');
insert into "Teaches" values('18912','Violin','02');
insert into "Teaches" values('89745','DoubleBass','01');
insert into "Teaches" values('21681','DoubleBass','02');
insert into "Teaches" values('89451','Arp','01');
insert into "Teaches" values('15441','Arp','02');
insert into "Teaches" values('51521','Ukulele','01');
insert into "Teaches" values('45385','Ukulele','02');
insert into "Teaches" values('53753','Drum','01');
insert into "Teaches" values('45387','Drum','02');
insert into "Teaches" values('53842','Tambourine','01');
insert into "Teaches" values('78952','Tambourine','02');
insert into "Teaches" values('87654','Ksilofon','01');
insert into "Teaches" values('23127','Ksilofon','02');
insert into "Teaches" values('78954','Flute','01');
insert into "Teaches" values('12367','Flute','02');
insert into "Teaches" values('75456','Obue','01');
insert into "Teaches" values('21592','Obue','02');
insert into "Teaches" values('51593','Clarinet','01');
insert into "Teaches" values('84321','Clarinet','02');


insert into "Section_Instruments" values ('02','Guitar','Guitar');
insert into "Section_Instruments" values ('01' ,'Piano','Piano');
insert into "Section_Instruments" values ('02','Piano','Piano');
insert into "Section_Instruments" values ('01','Org','Org');
insert into "Section_Instruments" values ('01','Bandoneon','Bandoneon');
insert into "Section_Instruments" values ('01','Cello','Cello');
insert into "Section_Instruments" values ('01','Violin','Violin');
insert into "Section_Instruments" values ('01','DoubleBass','DoubleBass');
insert into "Section_Instruments" values ('01','Arp','Arp');
insert into "Section_Instruments" values ('01','Ukulele','Ukulele');
insert into "Section_Instruments" values ('01','Drum','Drum');
insert into "Section_Instruments" values ('01','Tambourine','Tambourine');
insert into "Section_Instruments" values ('01','Ksilofon','Ksilofon');
insert into "Section_Instruments" values ('01','Flute','Flute');
insert into "Section_Instruments" values ('01','Obue','Obue');
insert into "Section_Instruments" values ('01','Clarinet','Clarinet');
insert into "Section_Instruments" values ('05','Guitar','Guitar');
insert into "Section_Instruments" values ('03','Guitar','Guitar');
insert into "Section_Instruments" values ('03','Piano','Piano');
insert into "Section_Instruments" values ('04','Piano','Piano');
insert into "Section_Instruments" values ('02','Org','Org');
insert into "Section_Instruments" values ('02','Bandoneon','Bandoneon');
insert into "Section_Instruments" values ('02','Cello','Cello');
insert into "Section_Instruments" values ('02','Violin','Violin');
insert into "Section_Instruments" values ('02','DoubleBass','DoubleBass');
insert into "Section_Instruments" values ('02','Arp','Arp');
insert into "Section_Instruments" values ('02','Ukulele','Ukulele');
insert into "Section_Instruments" values ('02','Drum','Drum');
insert into "Section_Instruments" values ('02','Tambourine','Tambourine');
insert into "Section_Instruments" values ('02','Ksilofon','Ksilofon');
insert into "Section_Instruments" values ('02','Flute','Flute');
insert into "Section_Instruments" values ('02','Obue','Obue');
insert into "Section_Instruments" values ('02','Clarinet','Clarinet');
insert into "Section_Instruments" values ('04','Guitar','Guitar');


insert into "Section_Classroom" values ('02','Guitar','31000');
insert into "Section_Classroom" values ('01','Piano','31010');
insert into "Section_Classroom" values ('02','Piano','31000');
insert into "Section_Classroom" values ('01','Org','31010');
insert into "Section_Classroom" values ('01','Bandoneon','1020');
insert into "Section_Classroom" values ('01','Cello','1020');
insert into "Section_Classroom" values ('01','Violin','1020');
insert into "Section_Classroom" values ('01','DoubleBass','21000');
insert into "Section_Classroom" values ('01','Arp','21000');
insert into "Section_Classroom" values ('01','Ukulele','21010');
insert into "Section_Classroom" values ('01','Drum','51010');
insert into "Section_Classroom" values ('01','Tambourine','51010');
insert into "Section_Classroom" values ('01','Ksilofon','51010');
insert into "Section_Classroom" values ('01','Flute','42000');
insert into "Section_Classroom" values ('01','Obue','42000');
insert into "Section_Classroom" values ('01','Clarinet','42000');
insert into "Section_Classroom" values ('05','Guitar','21000');
insert into "Section_Classroom" values ('03','Guitar','21010');
insert into "Section_Classroom" values ('03','Piano','31010');
insert into "Section_Classroom" values ('04','Piano','31000');
insert into "Section_Classroom" values ('02','Org','31000');
insert into "Section_Classroom" values ('02','Bandoneon','31010');
insert into "Section_Classroom" values ('02','Cello','1020');
insert into "Section_Classroom" values ('02','Violin','1020');
insert into "Section_Classroom" values ('02','DoubleBass','1020');
insert into "Section_Classroom" values ('02','Arp','21010');
insert into "Section_Classroom" values ('02','Ukulele','21010');
insert into "Section_Classroom" values ('02','Drum','51010');
insert into "Section_Classroom" values ('02','Tambourine','51010');
insert into "Section_Classroom" values ('02','Ksilofon','51010');
insert into "Section_Classroom" values ('02','Flute','42000');
insert into "Section_Classroom" values ('02','Obue','42000');
insert into "Section_Classroom" values ('02','Clarinet','42000');
insert into "Section_Classroom" values ('04','Guitar','21000');

create view "Well Qualified Teachers"  as 
select i."Inst_ID" , i."Inst_Name" , i."Experience" from "Instructors" i where i."Ins_Salary" > 4000 and i."Experience" > 10; 






