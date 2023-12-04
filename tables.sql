--- database was created in PostgreSQL's workbench pgAdmin4
--- in order to insert data use files from database foled in this repository by importing them

CREATE TABLE IF NOT EXISTS admissions
(
    student_id integer NOT NULL,
    entrance_time timestamp without time zone NOT NULL,
    exit_time timestamp without time zone
);



CREATE TABLE IF NOT EXISTS advisors
(
    id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    faculty_id integer NOT NULL,
    CONSTRAINT advisors_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS alumni
(
    id integer NOT NULL,
    student_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    degree character varying(100) COLLATE pg_catalog."default" NOT NULL,
    faculty_id integer NOT NULL,
    admissionyear date,
    graduatedyear date,
    employed boolean,
    internship_id integer,
    CONSTRAINT alumni_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS courses
(
    id integer NOT NULL,
    code text COLLATE pg_catalog."default" NOT NULL,
    course_title text COLLATE pg_catalog."default" NOT NULL,
    ects integer NOT NULL,
    faculty_id integer,
    term character varying(100) COLLATE pg_catalog."default",
    instructor_id integer,
    pre_course_id integer,
    CONSTRAINT "Courses_pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS degreeprogress
(
    degree_id integer NOT NULL,
    student_id integer NOT NULL,
    degree_title text COLLATE pg_catalog."default" NOT NULL,
    admission_year integer NOT NULL,
    expected_finish_year integer NOT NULL,
    current_course integer NOT NULL,
    CONSTRAINT "DegreeProgress_pkey" PRIMARY KEY (degree_id)
);

CREATE TABLE IF NOT EXISTS departments
(
    id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    course_id integer,
    faculty_id integer,
    CONSTRAINT departments_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS enrollments
(
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    enrollment_date date
);

CREATE TABLE IF NOT EXISTS faculty
(
    id integer NOT NULL,
    faculty_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT faculty_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS graduation
(
    student_id integer NOT NULL,
    degree character varying(100) COLLATE pg_catalog."default" NOT NULL,
    faculty_id integer NOT NULL,
    admissionyear integer,
    graduationdate integer
);

CREATE TABLE IF NOT EXISTS health_services
(
    id integer NOT NULL,
    student_id integer,
    type_service character varying(255) COLLATE pg_catalog."default",
    appointment_date date,
    appointment_duration integer,
    CONSTRAINT health_services_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS housing
(
    id integer NOT NULL,
    student_id integer,
    type_building character varying(150) COLLATE pg_catalog."default",
    rent_kzt integer,
    available_rooms integer,
    CONSTRAINT housing_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS instructors
(
    id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    course_id integer NOT NULL,
    experience character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT instructors_pkey PRIMARY KEY (id),
    CONSTRAINT instructors_name_key UNIQUE (name),
    CONSTRAINT instructors_course_id_fkey FOREIGN KEY (course_id)
        REFERENCES public.courses (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS internships
(
    id integer NOT NULL,
    student_id integer,
    company_name character varying(255) COLLATE pg_catalog."default",
    "position" character varying(255) COLLATE pg_catalog."default",
    experience character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT internships_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS library
(
    book_id integer NOT NULL,
    student_id integer,
    book_title character varying(255) COLLATE pg_catalog."default",
    author character varying(255) COLLATE pg_catalog."default",
    borrowed_date date,
    expiration_date date,
    CONSTRAINT library_pkey PRIMARY KEY (book_id)
);


CREATE TABLE IF NOT EXISTS meal_plans
(
    id integer NOT NULL,
    student_id integer,
    typeof_meal character varying(255) COLLATE pg_catalog."default",
    oneday_cost_kzt integer,
    week_cost_kzt integer,
    month_cost_kzt integer,
    CONSTRAINT meal_plans_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS staff
(
    department_id integer NOT NULL,
    staff_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    job_title character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT staff_pkey PRIMARY KEY (staff_id)
);

CREATE TABLE IF NOT EXISTS student_achievements
(
    student_id integer NOT NULL,
    award character varying(255) COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default",
    received_date date
);

CREATE TABLE IF NOT EXISTS student_events
(
    id integer NOT NULL,
    organization_id integer NOT NULL,
    event_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    event_type character varying COLLATE pg_catalog."default" NOT NULL,
    event_date date,
    allowed_students text COLLATE pg_catalog."default" NOT NULL
);

CREATE TABLE IF NOT EXISTS student_fees
(
    id integer NOT NULL,
    student_id integer,
    faculty_id integer,
    caption character varying(255) COLLATE pg_catalog."default",
    description text COLLATE pg_catalog."default",
    cost_kzt integer,
    status character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT student_fees_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS student_groups
(
    id integer NOT NULL,
    organization_name character varying(255) COLLATE pg_catalog."default",
    description text COLLATE pg_catalog."default",
    since_year integer,
    CONSTRAINT student_groups_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS studentcontacts
(
    student_id integer NOT NULL,
    phone text COLLATE pg_catalog."default",
    mail text COLLATE pg_catalog."default"
);

CREATE TABLE IF NOT EXISTS students
(
    id integer NOT NULL,
    first_name text COLLATE pg_catalog."default" NOT NULL,
    last_name text COLLATE pg_catalog."default" NOT NULL,
    age integer NOT NULL,
    faculty_id integer NOT NULL,
    advisor_id integer,
    joinedorganizations integer,
    group_type character varying(100) COLLATE pg_catalog."default",
    gender character varying(50) COLLATE pg_catalog."default",
    nationality character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "Stidents_pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS study_abroad
(
    id integer NOT NULL,
    student_id integer,
    academic_year integer,
    country character varying(100) COLLATE pg_catalog."default",
    faculty_id integer,
    CONSTRAINT study_abroad_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS transcripts
(
    student_id integer NOT NULL,
    gpa real NOT NULL,
    faculty_id integer NOT NULL,
    research_article character varying(255) COLLATE pg_catalog."default"
);
