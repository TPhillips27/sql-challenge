CREATE TABLE "Departments" (
    "dept_no" VARCHAR(255) NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

Select * from "Departments";

CREATE TABLE "Titles" (
    "title_id" VARCHAR(255)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

Select * from "Titles";

CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "title_id" VARCHAR(255)   NOT NULL,
    "brith_date" DATE  NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(255)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

Select * from "Employees";

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

Select * from "Salaries";

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

Select * from "dept_emp";

CREATE TABLE "Dept_Manager" (
    "dept_no" VARCHAR(255) NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "emp_no"
     )
);

Select * from "Dept_Manager";

--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" AS e
JOIN "Salaries" AS s
ON e.emp_no = s.emp_no
ORDER BY emp_no

--List first name, last name, and hire date for employees who were hired in 1986.

Select
e.first_name,
e.last_name,
e.hire_date
from "Employees" as e
WHERE DATE_PART('year',hire_date) = 1986


--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT dm.dept_no, 
dm.dept_name,
dm.emp_no,
e.last_name, 
e.first_name,
FROM "Dept_Manager" as dm
JOIN "Departments" as d
on dept_manager.dept_no = departments.dept_no
JOIN "Employees" as e
on dept_manager.emp_no = employees.emp_no
ORDER BY emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
Select 
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
from "Employees" as e
join "Departments" as d
on d.emp_no = e.emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM "Employees"
WHERE first_name = 'Hercules' AND last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

Select 
e.emp_no,
e.last_name,
e.first_name,
de.emp_no
from "Employees" as e
join "dept_emp" as de
on e.emp_no = de.emp_no
join "Departments" as d
on d.dept_no = de.dept_no
where d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

Select 
e.emp_no,
e.last_name,
e.first_name,
de.emp_no
from "Employees" as e
join "dept_emp" as de
on e.emp_no = de.emp_no
join "Departments" as d
on d.dept_no = de.dept_no
where d.dept_name = 'Sales';

--In descending order, list the frequency count of employee last names, i.e.,
--how many employees share each last name.



