-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/bvnOxq
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- CARLOS MORENO
-- ERD

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" string   NOT NULL,
    "last_name" string   NOT NULL,
    "gender" string   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "departments" (
    "dep_no" string   NOT NULL,
    "dep_name" string   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dep_no"
     )
);

CREATE TABLE "dep_emp" (
    "emp_no" int   NOT NULL,
    "dep_no" string   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dep_no" string   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" int   NOT NULL,
    "title" string   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

ALTER TABLE "dep_emp" ADD CONSTRAINT "fk_dep_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dep_emp" ADD CONSTRAINT "fk_dep_emp_dep_no" FOREIGN KEY("dep_no")
REFERENCES "departments" ("dep_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dep_no" FOREIGN KEY("dep_no")
REFERENCES "departments" ("dep_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

