

 /** Step 1 create database and name it SMIS (Student Management Information System) **/
 
 create database SMIS

 /** Step 2 put datadase to use **/
  
 use SMIS

  /* Step 3 ingested all data using Task > flat file option */

  /** step 4 cleaning Enrollment Data **/
 -- Replace CSC to COM --
 -- Added "LEVEL" in between Level_Semester Record Data --
 -- Added Four More Colomns for CGPA Calculations -- 
 -- Update Data into the Added Column using Update Syntax -- 

 update ENROLLMENT_TABLE 
 set Student_ID = replace (Student_ID, 'CSC', 'COM')
 
 update ENROLLMENT_TABLE 
 set Level_Semester = concat(substring (Level_Semester, 1,3), ' ',  'LEVEL', upper (substring (Level_Semester, 4, 8) ))
  
 alter table ENROLLMENT_TABLE 
 add Credit_Unit int, Grade char (2), Grade_Point decimal(3,2), Student_Level varchar (20)
  
 update ENROLLMENT_TABLE 
 set ENROLLMENT_TABLE.Credit_Unit = COURSES_TABLE.Credit_Unit from COURSES_TABLE
 where ENROLLMENT_TABLE.Course_Code = COURSES_TABLE.Course_Code
 and ENROLLMENT_TABLE.Department = COURSES_TABLE.Department
 and ENROLLMENT_TABLE.Course_Title_Code =COURSES_TABLE.Course_Code_No

 update ENROLLMENT_TABLE
 set ENROLLMENT_TABLE.Credit_Unit = COURSES_TABLE.Credit_Unit from COURSES_TABLE
 where ENROLLMENT_TABLE.Credit_Unit is null
 And ENROLLMENT_TABLE.Department = COURSES_TABLE.Department
 and ENROLLMENT_TABLE.Course_Title_Code =COURSES_TABLE.Course_Code_No

 update  ENROLLMENT_TABLE
set Course_Code = 'BIO 909' 
where Course_Code = 'CHE 808'
and Department = 'CHEMISTRY'
 and Course_Title_Code = 8

update  ENROLLMENT_TABLE
set Course_Code = 'ECO 2121' 
where Course_Code = 'POL 808'
and Department = 'POLITICAL SCIENCE'
 and Course_Title_Code = 8

update  ENROLLMENT_TABLE
set Course_Code = 'MAT 2525' 
where Course_Code = 'ECO 1212'
and Department = 'ECONOMICS'
 and Course_Title_Code = 12

update  ENROLLMENT_TABLE
set Course_Code = 'HIS 2828' 
where Course_Code = 'ECO 1717'
and Department = 'ECONOMICS'
 and Course_Title_Code = 17

 update  ENROLLMENT_TABLE
set Course_Code = 'MAT 3131' 
where Course_Code = 'COM 2323'
and Department = 'COMPUTER SCIENCE'
 and Course_Title_Code = 23

 update  ENROLLMENT_TABLE
set Course_Code = 'BIO 2828' 
where Course_Code = 'COM 3333'
and Department = 'COMPUTER SCIENCE'
 and Course_Title_Code = 33

update  ENROLLMENT_TABLE
set Course_Code = 'MAT 4646' 
where Course_Code = 'ECO 3636'
and Department = 'ECONOMICS'
 and Course_Title_Code = 36

 update  ENROLLMENT_TABLE
 set Grade = case 
					when Score > 70 then 'A'
					when Score between 60 and 69 then 'B'
					when Score between 50 and 59 then 'C'
					when Score between 45 and 49 then 'D'
					when Score between 40 and 44 then 'B'
					else 'F'
					end

update  ENROLLMENT_TABLE
 set Grade_Point = case 
					when Score > 70 then '5.0'
					when Score between 60 and 69 then '4.0'
					when Score between 50 and 59 then '3.0'
					when Score between 45 and 49 then '2.0'
					when Score between 40 and 44 then '1.0'
					else '0.0'
					end
				 
update ENROLLMENT_TABLE
set Student_Level = substring (Level_Semester,1, 10)

 /** Step 4 Cleaning Courses_TABLE **/
 -- Set Course Title to Upper Case --
-- Added "LEVEL" in between Level_Semester Record Data --
 
update  COURSES_TABLE
set Course_Title = upper (Course_Title);   
 
 update   COURSES_TABLE
 set  Level_Semester = concat (substring (level_semester, 1,3), ' LEVEL', upper (substring (level_semester, 4,6)));

 /** Step 5 Cleaning Student_Profile  **/
--Added Another Column to Combine Student First Name and Last Name --
-- Added Another Column to Extract Student Age from Date of Birth --
-- Added Another Column to Record Student CGPA --
-- Added Another Column to Record Student Remark--
-- Set Gender, Department to Upper Case Letter --
-- Drop Column FirstName, LastName, S_N and Birth_date --

alter table STUDENT_PROFILE
add Full_Name char (50), Age int, CGPA decimal (2,2), Remark char (50);

update STUDENT_PROFILE
set Full_Name = upper (concat (FirstName,' ', LastName));

update STUDENT_PROFILE
 set Age = '2024'- year(Birth_date);

update STUDENT_PROFILE 
 set STUDENT_PROFILE.CGPA = (
 select
round((sum (ENROLLMENT_TABLE.Grade_Point * ENROLLMENT_TABLE.Credit_Unit )   / sum (ENROLLMENT_TABLE.Credit_Unit)), 2) as CGPA
 from ENROLLMENT_TABLE
 where STUDENT_PROFILE.StudentID = ENROLLMENT_TABLE.Student_ID
 group by ENROLLMENT_TABLE.Student_ID
 )

 update STUDENT_PROFILE 
 set Remark = case
					when CGPA>=4.50 then 'FIRST CLASS'
					when CGPA >= 3.50 then 'SECOND CLASS UPPER'
					when CGPA>=2.50 then 'SECOND CLASS LOWER'
					when CGPA>= 1.50 then 'THIRD CLASS'
					else 'FAIL'
					end;
   
alter table STUDENT_PROFILE
drop column FirstName, LastName, S_N, Birth_date

/** Step 6 Cleaning LECTURERS_PROFILE Table Data **/ 
-- Added Another Column to Combine First Name and Last Name --
-- Added Another Column to to Extract Working Experience from Hired Date --
-- Dropped Column FisrtName, LastName and Hired Date -- 
   
alter table LECTURER_PROFILE 
add Full_Name varchar (100), Experience   varchar (20)
   
update LECTURER_PROFILE
set Full_Name = upper (concat  (LastName, ' ', FirstName) );

update LECTURER_PROFILE
set Experience = concat (('2024' - year(HireDate)), ' YEARS');

update LECTURER_PROFILE
set Department = upper (Department);
	
update LECTURER_PROFILE
set Desgnation = upper (Desgnation);
 
alter table LECTURER_PROFILE 
drop column  FirstName, LastName
 

 /**SQL ANALYSIS**/
 
 /** DISTINCT COUNT OF STUDENT **/

select count (distinct StudentID) AS Student_Distinct_Count from STUDENT_PROFILE  

/** TOTAL ENROLMENT ACROSS THE YEAR **/
select count (Course_Code) as Total_Enrollment from  ENROLLMENT_TABLE  

/**TOTAL COUNT OF  COURSES **/
select count (Course_Code) AS  Total_Courses from COURSES_TABLE  

/** DISTINCT COUNT OF  COURSES **/
select count (distinct Course_Code) AS  No_of_Courses from COURSES_TABLE  

 /** DISTINCT COUNT OF TEACHERS **/
select count (distinct  LecturerID) AS Lecturer_Distinct_Count from  LECTURER_PROFILE  

 /** NO OF DEPARTMENT STUDENT **/
select distinct (Department) as department from STUDENT_PROFILE

 /** NO OF DEPARTMENT STUDENT PER DEPARTMENT **/
select distinct Department,
count (distinct StudentID) as No_Of_Student_in_Department FROM STUDENT_PROFILE
 group by Department;

 /** NO OF DEPARTMENT LECTURERS PER DEPARTMENT **/
 select distinct Department,
count (distinct LecturerID) as No_Of_Lecture_in_Department FROM  LECTURER_PROFILE 
 group by Department;

 /** TOTAL SCORE BY DEPARTMENT **/
 select distinct Department, sum (score) as Total_score from ENROLLMENT_TABLE
 group by Department
 order by Total_Score desc;

 /** TOP TEN TOTAL SCORE BY LECTURERS **/
 select Lecturer_ID, sum (score) as Total_score from ENROLLMENT_TABLE
 group by Lecturer_ID  
 order by Total_Score desc

 /** TEN LECTURERS WITH THE LOWEST SCORE **/
select Lecturer_ID, sum (score) as Total_score from ENROLLMENT_TABLE
 group by Lecturer_ID  
 order by Total_Score asc

 -- CGPA Calculation --
  SELECT cast (sum (Grade_point * credit_unit) / sum (Credit_Unit) as decimal (3,2))  as CGPA
 from ENROLLMENT_TABLE
 
 -- Student Score by Lecturers --- 
 select Lecturer_ID, max (Total_score)  as Total_score 
 from  (
 select sum (score)  as Total_score, sum (Grade_point * credit_unit) / sum (Credit_Unit) as CGPA
 from ENROLLMENT_TABLE
 group by Lecturer_ID
 ) subquery
 order by Total_Score desc;
 
 /** SCORE STANDARD DEVIATION **/
 select   round (stdev (Score),2)  as standard_deviation from ENROLLMENT_TABLE

 -- top Ten Lecturers With the Highest Student Grade --
 select distinct top (10) Lecturer_ID, Grade, count(Grade) as grade_level from ENROLLMENT_TABLE
 where Grade = 'A'
 group by  Lecturer_ID, Grade
 order by grade_level desc

 -- Average Score by Score Code --
 select Course_Code, avg (Score) as  average_score from ENROLLMENT_TABLE
 group by Course_Code
 order by average_score desc

 -- Total Course by Semester --
 select Level_Semester, count(Course_Code) as total_courses from ENROLLMENT_TABLE
 group by Level_Semester 
 order by  Level_Semester  

 -- Total Course by Student Level --
 select Student_Level , count(Course_Code) as total_courses from ENROLLMENT_TABLE
 group by Student_Level
 order by Student_Level  asc
  

  -- Courses per Student --- 
  select distinct Student_ID, count (Course_Code) courses_per_Student from ENROLLMENT_TABLE
  group by Student_ID
  order by courses_per_Student desc


  create view Best_Student_per_department as
  select * from STUDENT_PROFILE
  where CGPA =( 
  select 
  max (CGPA) 
  from STUDENT_PROFILE
  )

  create view lectures_with_highset_student_grade as
  select  distinct top (5) Lecturer_ID, count (Grade) as Grade 
  from  ENROLLMENT_TABLE
  where Grade = 'A'
  group by Lecturer_ID
  order by  Grade desc

  create view No_of_Department_Courses as 
  select distinct Department, count (Course_Code) as Courses_Per_Department
  from COURSES_TABLE 
  group by Department
  
  create view top_ten_Course_failed_by_student as
   select distinct top (10) Course_Code, count (Grade) as no_of_student
   from  ENROLLMENT_TABLE
   where Grade = 'F'
   group by Course_Code
   order by  no_of_student desc
   drop view 

   select count (Grade) as Total_Failure from ENROLLMENT_TABLE
   where Grade = 'F'

   select count(distinct Course_Code) as No_Of_Courses_failed from ENROLLMENT_TABLE
   where Grade = 'F'
   
   select distinct top Course_Code, count (distinct Student_ID) as No_of_student_Failed from ENROLLMENT_TABLE
   where Grade = 'F'
   group by Course_Code
   order by  No_of_student_Failed  desc

   create view courses_Categories as 
   select distinct Credit_unit, count (Course_code) as No_course from COURSES_TABLE
   group by Credit_Unit
    
    select  count ( distinct Course_Code) as no_OF_Failure from ENROLLMENT_TABLE
	where Grade = 'F'
	 
	 
	 create view Best_Student_Per_Departments as
	 /** Identifying Best Student Per Department **/
	 select distinct SP.StudentID, SP.Full_Name, SP.Department, SP.CGPA from STUDENT_PROFILE SP
	 join (
	 select distinct Department, max (CGPA) as Highest_CGPA_per_department from STUDENT_PROFILE
	 group by Department
	 ) Max_Student
	 on  SP.Department = Max_Student.Department and  SP.CGPA = Max_Student.Highest_CGPA_per_department
	 order by SP.CGPA desc ;
	 
	 

	 select * from ENROLLMENT_TABLE 

	 Select * from COURSES_TABLE

	  select * from LECTURER_PROFILE

	 select *  from STUDENT_PROFILE

	 select * from Grade_Conversion
