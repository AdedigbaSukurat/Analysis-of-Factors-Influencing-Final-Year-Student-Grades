# Analysis-of-Factors-Influencing-Final-Year-Student-Grade
## Table of Contents
- [Project Overview](#project-overview)
- [Aim and Objectives](#aim-and-objectives)
  - [Aim](#aim)
  - [Objectives](#objectives)
- [Problem Statement](#problem-statement)
- [Process](#process)
  - [Data Collection](#data-collection)
  - [Data Preparation](#data-preparation)
  - [Dashboard Development](#dashboard-development)
  - [Insight Generation](#insight-generation)
  - [Recommendation](#recommendation)
- [Tools Used](#tools-used)
- [Key Insights](#key-insights)
  - [Overview Dashboard](#overview-dashboard)
  - [Courses View Dashboard](#courses-view)
  - [Lecturers View Dashboard](#lecturers-view)
  - [Student View Dashboard](#student-view)
- [Challenges](#challenges)
- [Recommendation](#recommendation)
## Project Overview
This project explores key factors that influence final-year students’ CGPA using a simulated dataset comprising 1,000 students, 493 courses, and 100 lecturers across 10 departments. The analysis was conducted using Power BI, SQL, Power Query, and Excel.
By analyzing data across departments, lecturers, courses, and student demographics, the project delivers actionable insights aimed at enhancing academic outcomes and institutional performance. The dashboards created provide stakeholders with a comprehensive view of performance trends, challenges, and opportunities for improvement in tertiary institutions.
## Aim and Objectives
#### Aim:
To identify and analyze the key factors influencing final-year students’ CGPA in order to improve academic performance and provide strategic recommendations.
#### Objectives:
- To evaluate departmental performance in relation to CGPA.
- To assess course workload, credit units, and failure rates.
- To measure the impact of lecturers’ experience and designation on student performance.
- To identify top-performing students and the characteristics contributing to their success.
- To recommend strategies for academic improvement and student support.
## Problem Statement
Many institutions face challenges in understanding the specific factors that contribute to variations in students’ academic performance. Without data-driven insights, interventions may be ineffective or misdirected. This project addresses the problem by analyzing structured student, lecturer, and course data to uncover patterns influencing final-year CGPA, with the goal of boosting institutional academic performance.
## Process
 - #### Data Collection:  
This dataset was provided as part of a real-world academic project. It contains authentic records sourced directly from an institution’s database and compiled by the project coordinator for analysis purposes.
The data includes:
	•	1,000 students
	•	100 lecturers
	•	493 courses
	•	Distributed across 10 academic departments
- #### Data Preparation:
The data was cleaned, structured, and integrated from multiple related tables using common keys (such as student ID, course code, and department ID). This process ensured consistency and enabled the creation of a reliable data model for analysis in Power BI. The cleaned dataset was then loaded into Power BI for further transformation, visualization, and insight generation.
- #### Dashboard Development:
Designed and developed interactive dashboards to visualize departmental performance, course statistics, lecturer workloads, and student data. 
- #### Insight Generation:
Extracted patterns related to failure rates, course types, lecturer experience, and student demographics.
- #### Recommendation
Formulated actionable suggestions to improve academic performance institution-wide.
## Tools Used 
- Power BI Desktop: Used to develop interactive dashboards and perform data modeling for clear and insightful visualizations.
- Microsoft Excel:  Employed for preliminary data review, formatting, and preparation before import into Power BI.
- Power Query: Used within Power BI to perform advanced data transformation, including merging, filtering, and reshaping data.
- SQL: Utilized for advanced data cleaning and extraction of data from one table to another, ensuring that the dataset was well-structured and ready for analysis in Power BI.
##  Key Insights
#### Overview Dashboard
- Mean CGPA across all departments is 3.42, indicating moderately strong performance.
- Enrollment data shows a total of 50,000 students, 493 courses, and 100 lecturers spread across 10 departments.
- Departmental CGPA Performance:
- Top departments include Psychology (3.47) and History (3.44–3.45).
- Departments like Mathematics (3.39) and Computer Science (3.40) performed below the average.
- CGPA remains fairly stable across semesters, with minor fluctuations, indicating consistency in academic standards.
#### Courses View 
- Courses are mostly in 3-unit and 4-unit formats; 3-unit courses recorded better student performance.
- Top Ten Failed Courses include:
- HIS 2828, MAT 4646, BIO 909, COM 2424, and ECO 2121 – each failed by 11–13 students.
- Failure Distribution:
- Departments like Economics, Mathematics, and Biology had the highest course failure rates.
- Course Score and CGPA:
- All credit unit categories (1–4 units) showed similar average CGPA (~3.4), suggesting performance consistency across workloads.
#### Lecturers View
- All 10 departments have 10 lecturers each (totaling 100), spread across designations (Professor, Doctor, Lecturer 1, Lecturer 2).
- Lecturers with 4 years of experience had the highest total student scores, followed by 1-year and 3-year experience categories.
- The top five lecturers with the highest student grades include lecturers from Biology, History, Mathematics, and Economics.
- Equal number of lecturers (20 each) for all ranks: Professors, Doctors, Lecturer 1, Lecturer 2, and Lecturers.
#### Student View
- Gender Distribution:
	•	514 female students and 486 male students.
- Performance Rate: 63.16%
	•	Failure Rate: 92% (indicating most students failed at least one course).
- Student Outcomes:
	•	Only 83 students passed all their courses.
	•	Most students fall in the Second Class Lower and Upper categories.
- Best CGPA recorded: 4.10 (Second Class Upper).
	•	Top Students by Department:
	•	Highest-performing students are spread across departments, e.g., JOHN JOHNSON (Economics) – CGPA: 4.10, JASON STOUT (Psychology) – CGPA: 4.04.
- CGPA by Age:
Students aged 24 had the highest average CGPA, indicating a possible peak in academic maturity and performance at that age.
## Challenges
- High failure rates: Over 900 students failed one or more courses.
- Uniform course registration across departments with little room for elective flexibility.
- Limited lecturer experience in some departments may affect teaching quality.
- Low CGPA clustering around the 3.0–3.5 range, indicating average performance.
## Recommendations
- Academic Support: Peer mentoring, tutoring, and academic workshops for struggling departments.
- Lecturer Development: Recognize high-performing lecturers and support junior staff through mentorship and training.
- Student Counseling: Implement personalized learning and career guidance sessions.
- Wellness Programs: Support students with mental health and motivation workshops.
- Data-Driven Monitoring: Continuously assess departmental and lecturer performance using dashboards.
