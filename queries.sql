--QUERIES--

--SPECIAL QUERY #1 
--List of teachers that are available on Wednesday and on Friday between 17:00:00-22:00:00 in each branch. We ordered list related to instrument name.
select s."Section_ID",i."Inst_Name",s."Instrument_Name" , s."Clock", s."Day" from "Section" s , "Teaches" t, "Instructors" i 
where t."Ins_ID" = i."Inst_ID" and t."Section_ID" = s."Section_ID" and t."Instrument_Name" = s."Instrument_Name" and 
(s."Day" = 'Wednesday' or s."Day"='Friday')
and s."Clock" between '17:00:00' and '22:00:00'order by s."Instrument_Name" asc;


--SPECIAL QUERY #2  
--Lists the information (class name, trainer, quota, room name, time etc.)  of the guitar classes which is held at Wednesdays in each branch
select t."Ins_ID" , i."Inst_Name" , s."Section_ID" ,s."Instrument_Name" ,s."Day", s."Clock", s."Classroom_ID", c2."Capacity" from "Section" s,"Instructors" i ,"Teaches" t, "Classroom" c2 
where s."Day" ='Wednesday' and s."Instrument_Name" ='Guitar' 
and t."Ins_ID" = i."Inst_ID" and t."Section_ID" =s."Section_ID" 
and i."Expertise" = 'Guitar' and c2."Classroom_ID" =s."Classroom_ID";

--SCALAR SUBQUERY THAT RETURNS ONLY ONE ROW
--It shows the salary and experience of the teacher with personal number "17898".
select "Ins_Salary" , "Inst_Name", "Experience" from "Instructors"  where "Inst_ID" = (select "Inst_ID" from "Instructors" where "Inst_ID" = '17898');


--NATURAL JOIN
--Returns matching values between student table and takes table. In detail it shows students that takes music courses
select i."Stu_Name" from "Student" i natural join "Takes" t ;

 --UPDATE
 --Update Operation that updates the existing instrument belonging to the bowed instruments department to the table named Instruments.
UPDATE public."Instruments"  
SET "Dept_Name"='Bow'
WHERE "Instrument_Name"='DoubleBass';


--3 TABLE JOIN
--Operation that shows all instructors in the school with their section number.
select i."Inst_Name",s."Section_ID" from "Instructors" i ,"Section" s, "Teaches" t 
where s."Section_ID" = t."Section_ID" and s."Instrument_Name" = t."Instrument_Name" and t."Ins_ID" = i."Inst_ID" ;

--2 TABLE JOIN
--Operation that shows the names of the departments in the school and private numbers of the classes connected to those departments
select d."Dept_Name",c."Classroom_ID"
from "Department" d, "Classroom" c
where d."Dept_Name" = c."Deparment_Name";

--OUTER JOIN 
--That combines Instruments and Department tables and shows them with their attributes.
select *
from "Department" d
full outer join "Instruments" i
on d."Dept_Name" = i."Dept_Name" ;


--SUM QUERY
--That shows the sum of the salaries of two instructors specially selected with their private numbers.
select sum("Ins_Salary") as "Sum of Chosen Instructors' salary" from "Instructors" i
where "Inst_ID" ='25100' or "Inst_ID"='11152' or "Inst_ID"='84521';

--INTERSECT QUERY
--By combining the Instrument_Name attribute on the Section and Teaches tables, it returns the common lines 
--and displays the names of the instruments taught at the school.
select s."Instrument_Name" from "Section" s intersect
select "Instrument_Name" from "Teaches" t ;


--MAX and SCALAR SUBQUERY
--That shows the instructor with the highest salary among the instructors who teach guitar, along with his/her name, address and private number.
select i."Inst_ID", i."Inst_Name",i."Adress",i."Expertise" from "Instructors" i
where i."Ins_Salary" = (select max(i2."Ins_Salary") from "Instructors" i2 where i2."Expertise"='Guitar');


--SCALAR SUBQUERY THAT RETURNS MULTIPLE ROWS
--that returns multiple rows. It shows how many classes each department in the school has.
select d."Dept_Name",
(select count(*)
from "Classroom" c 									
where d."Dept_Name" = c."Deparment_Name")
as "Number of Classes"
from "Department" d;


--COUNT AND BETWEEN/AND QUERY
--It shows classes held on monday and between 09.00 am and 18.00 pm
select count(*) as "Classes held on monday and between 9am and 18pm " from "Section" s 
where s."Day" ='Monday' and s."Clock" between '09:00:00' and '18:00:00' ;


--DISTINCT AND STRING QUERY
--Returns the instructors that teaches courses and that have letter of r in their name
select distinct i."Inst_Name" from "Section" s ,"Instructors" i 
where i."Expertise"=s."Instrument_Name"  and i."Inst_Name" like '%r'; 


--STRING QUERY 
--Brings the instrument's name from section table If the day of the lesson starts with 'Mon'
select "Instrument_Name" from "Section" s where s."Day" like 'Mon%';


--LENGTH 
-- Shows Instructor name and instructor's name's length If the Instructor's specialty is piano
select i2."Inst_Name",length(i2."Inst_Name") from "Instructors" i2 where i2."Expertise" ='Piano';


--FROM SUBQUERY 
--Returns instruments , budget and departments which its budget is higher than 300000 and material column is null
select i."Dept_Name",i."Instrument_Name",d."Budget" from 
(select d."Dept_Name" from "Department" d where "Budget">300000) as "Departments","Instruments" i,"Department" d
where i."Material" is null and i."Dept_Name" =d."Dept_Name" ;


--ORDER BY QUERY
--Brings the names of Instructors if Instructor gives Obue or Clarinet lesson
select distinct i."Inst_Name" from "Takes" t, "Instructors" i where (t."Instrument_Name" = 'Obue' or t."Instrument_Name" ='Clarinet') and
t."Inst_Name" =i."Inst_Name" order by "Inst_Name" ;


--SOME AND AVG QUERY
--Shows Instructor name and instructor's id if instructor salary grater then average salary of instructors
select i."Inst_Name" ,i."Inst_ID" from "Instructors" i
where "Ins_Salary" > some (select avg("Ins_Salary") from "Instructors" i2);


--GROUP BY HAVING QUERY
--Returns student name, student surname and their age but only students that includes letter of a in their name
-- and b in their surname and we ordered them by their age in descending order
select s."Stu_Name" ,s."Stu_Surname",s."Stu_Age"  from "Student" s where s."Stu_Name" in 
(select s2."Stu_Name" 
from "Takes" t2,"Student" s2 
group by s2."Stu_Age", s2."Stu_Name",s2."Stu_Surname" ,s2."Stu_Age"                                  
having  s2."Stu_Name" like '%a%' and s2."Stu_Surname" like '%b%') order by s."Stu_Age" desc;


--UNION AND EXCEPT QUERY
--Returns student ids, student names, surnames and instrument names that takes Guitar courses on wednesday, 
--DoubleBass courses on tuesday and we extracted students that
--takes Guitar courses on wednesday at between 12:30:00 and 16:00:00 o'clock 
(select s."Student_ID", s."Stu_Name",s."Stu_Surname",t."Instrument_Name" from "Student" s ,"Section" s2 ,"Takes" t 
where t."Instrument_Name" =s2."Instrument_Name" and t."Section_ID" =s2."Section_ID" and s2."Day" ='Wednesday' 
and s2."Instrument_Name" ='Guitar' and s."Student_ID" =t."Student_ID") 
union 
(select s."Student_ID", s."Stu_Name",s."Stu_Surname", t."Instrument_Name" from "Student" s ,"Section" s2 ,"Takes" t 		
where t."Instrument_Name" =s2."Instrument_Name" and t."Section_ID" =s2."Section_ID" and s2."Day"='Tuesday'
and s2."Instrument_Name" = 'DoubleBass' and s."Student_ID" =t."Student_ID")
except 
(select s."Student_ID", s."Stu_Name",s."Stu_Surname", t."Instrument_Name" from "Student" s ,"Section" s2 ,"Takes" t
where t."Instrument_Name" =s2."Instrument_Name" and t."Section_ID" =s2."Section_ID" and s2."Day"='Wednesday'
and s2."Instrument_Name" ='Guitar' and s."Student_ID" =t."Student_ID" and s2."Clock" between '12:30:00' and '16:00:00');


--IS NOT NULL QUERY 
--Returns the name, department and material of the instrument whose material is not empty and whose instrument name is piano
select distinct i."Instrument_Name" ,i."Dept_Name", i."Material" from "Instruments" i , "Teaches" t,"Instructors" i2 
where i."Material" is not null and t."Instrument_Name" ='Piano' and i2."Inst_ID" =t."Ins_ID" ;


--EXISTS
--Among the instruments that exist in the department table and mentioned in the Instruments table,
-- those that do have a department are returned.
select "Dept_Name"
from "Instruments" i 
where exists (
select "Dept_Name"
from "Department" d
WHERE i."Dept_Name" = d."Dept_Name");
		
-- NOT EXISTS
--Among the instruments that exist in the department table and 
--mentioned in the Instruments table, those that do not have a department are returned.
select "Dept_Name"
from "Instruments" i 
where not exists (
select "Dept_Name"
from "Department" d
WHERE i."Dept_Name" = d."Dept_Name");

--ALL QUERY
--Returns students with less experience than the least experienced Instructor
select "Stu_Name","Stu_Surname",s."Experience"
from "Student" s
where s."Experience" < all (
select  min(i."Experience")
from "Instructors" i)
order by s."Experience";






