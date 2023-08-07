--CREATE student table--

DROP TABLE student;

CREATE TABLE student(
                        stu_id VARCHAR2(10) NOT NULL,
                        stu_name VARCHAR2(50) NOT NULL,
                        stu_addr VARCHAR2(100),
                        academic_year NUMBER(4),
                        CONSTRAINT stu_pk PRIMARY KEY (stu_id)
);

--CREATE module table--

DROP TABLE module;

CREATE TABLE module(
                       module_id VARCHAR2(10) NOT NULL,
                       module_name VARCHAR2(100) NOT NULL,
                       CONSTRAINT module_pk PRIMARY KEY (module_id)
);

--CREATE lecturer table--

DROP TABLE lecturer;

CREATE TABLE lecturer(
                         lec_id VARCHAR2(10) NOT NULL,
                         lec_name VARCHAR2(50) NOT NULL,
                         module_id VARCHAR2(10),
                         lec_password VARCHAR2(10),
                         CONSTRAINT lec_pk PRIMARY KEY (lec_id),
                         CONSTRAINT module_fk FOREIGN KEY (module_id) REFERENCES module(module_id)
);

--CREATE mark table--

DROP TABLE mark;

CREATE TABLE mark(
                     stu_id VARCHAR2(10),
                     module_id VARCHAR2(10),
                     mark number,
                     CONSTRAINT stu_fk_mark foreign key (stu_id) REFERENCES student(stu_id),
                     CONSTRAINT module_fk_mark foreign key (module_id) REFERENCES module(module_id)
);

--CREATE sequence to auto increment the stu_id--

DROP SEQUENCE seq_stu;

create sequence seq_stu start with 1 increment by 1;

--CREATE trigger to automatically add 'S' to the stu_id--

create or replace trigger trg_before_insert
before insert on student
for each row
begin
select 'S' || to_char(seq_stu.nextval, 'FM000') into :new.stu_id from dual;
end;

--INSERT QUERY for lecturer table--
INSERT INTO lecturer(lec_id, lec_name, module_id, lec_password) VALUES ('A001', 'admin', NULL, 'admin');
INSERT INTO lecturer(lec_id, lec_name, module_id, lec_password) VALUES ('L001', 'mrszm', 'CT_6013', 'lecturer');
INSERT INTO lecturer(lec_id, lec_name, module_id, lec_password) VALUES ('L002', 'mrmmtm', 'CT_6033', 'lecturer');
INSERT INTO lecturer(lec_id, lec_name, module_id, lec_password) VALUES ('L003', 'mrtta', 'CT_6036', 'lecturer');
INSERT INTO lecturer(lec_id, lec_name, module_id, lec_password) VALUES ('L004', 'mscma', 'CT_6042', 'lecturer');

--INSERT QUERY FOR module table--
INSERT INTO module(module_id, module_name) VALUES ('CT_6013', 'Advanced Database Systems');
INSERT INTO module(module_id, module_name) VALUES ('CT_6033', 'Cyber Security Management');
INSERT INTO module(module_id, module_name) VALUES ('CT_6036', 'Managing Information Systems Change');
INSERT INTO module(module_id, module_name) VALUES ('CT_6042', 'Secure Coding');