/*
I downloaded a dataset from Kaggle and imported it into SQL
 using the Table Import Wizard. After importing the data, 
 I started exploring and analyzing it using SQL queries.
 */
select * from student;

-- ---------------------------------------------------------------
-- total students
-- ---------------------------------------------------------------
select count(*) from student;

-- -------------------------------------------------------------
-- gender wise student count
-- ---------------------------------------------------------------
select gender ,count(student_id) as total_students from student
 group by gender order by total_students desc;  
 
  -- ------------------------------------------------------------
 -- avg gpa, higest gpa , lowest gpa from students
-- --------------------------------------------------------------------
select avg(previous_gpa) as avg_gpa,min(previous_gpa) as lowest_gpa
,max(previous_gpa) as higest_gpa from student;  

-- ----------------------------------------------------------------------
-- age group wise students
-- -----------------------------------------------------------------------
select count(student_id), case  when age <= 10 then "5-10 years"
		                    	when age <=15 then "10-15 years"
                                when age<=20 then "15-20 years"
                                else "20+ years"
                                end as std_age 
							    from student group by std_age;
						
-- --------------------------------------------------------------------
-- education level wise students
-- --------------------------------------------------------------------
select education_level ,count(student_id) as students from 
student group by education_level;

-- ----------------------------------------------------------------------
-- school type wise students
-- ---------------------------------------------------------------------
select school_type ,count(student_id)as students from 
student group by school_type;

-- ---------------------------------------------------------------------
-- education app usage wise students 
-- ---------------------------------------------------------------------

select educational_app_usage ,count(student_id) as students from 
student group by educational_app_usage;

-- ---------------------------------------------------------------------
-- rank wise students
-- ---------------------------------------------------------------------
select student_id ,age ,gender ,school_type,education_level,previous_gpa,
previous_exam_score,dense_rank() over(order by previous_exam_score desc) as ranking from student;

-- -------------------------------------------------------------------------------
-- who got higgest score in exams
-- ----------------------------------------------------------------------------------------

select student_id ,age ,gender,education_level ,previous_exam_score ,previous_gpa
from student where previous_exam_score =(select max(previous_exam_score) from student);

-- ------------------------------------------------------------------------------------------------
-- who got lowest score in exams
-- ------------------------------------------------------------------------------------------------

select student_id ,age ,gender,education_level ,previous_exam_score ,previous_gpa
from student where previous_exam_score =(select min(previous_exam_score) from student);

-- -----------------------------------------------------------------------------------------------------
-- who got avg score in exams
-- ----------------------------------------------------------------------------------------------------

select student_id ,age ,gender,education_level ,previous_exam_score ,previous_gpa
from student where previous_exam_score =(select avg(previous_exam_score) from student);

-- --------------------------------------------------------------------------------------------------------
-- urban v/s rural
-- ---------------------------------------------------------------------------------------------

select urban_rural ,count(student_id) as students from student group by urban_rural;

-- ------------------------------------------------------------------------------------------------
-- all max rank,marks,gpa of students
-- ---------------------------------------------------------------------------------------------
select  max(previous_exam_score) as max_examscore,max(previous_gpa) as max_gpa,max(attendance_percentage)
as max_attendence ,max(assignment_completion_rate) as max_assinment_completion_rate from student;


-- -------------------------------------------------------------------------------------------------
-- all min rank,marks,gpa of students
-- ---------------------------------------------------------------------------------------------------- 

select  min(previous_exam_score) as min_examscore,min(previous_gpa) as min_gpa,min(attendance_percentage)
as min_attendence ,min(assignment_completion_rate) as min_assinment_completion_rate from student;


-- ----------------------------------------------------------------------------------------------
-- all AVG rank,marks,gpa of students
-- ------------------------------------------------------------------------------------------------------
select  avg(previous_exam_score) as avg_examscore,avg(previous_gpa) as avg_gpa,max(attendance_percentage)
as avg_attendence ,avg(assignment_completion_rate) as avg_assinment_completion_rate from student;
