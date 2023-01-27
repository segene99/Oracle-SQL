

create table departmentemp as select * from departments, emp;

select * from emp e, departments d
where e.deptno = d.department_id;

drop table departmentemp purge;

select ename, dname
from emp
inner join dept
on emp.deptno = dept.deptno;

select ename, dname
from emp, dept
where emp.deptno = dept.deptno;

select ename, dname
from emp e
inner join dept d
on e.deptno = d.deptno
where ename = 'SMITH';

select ename, dname
from emp e, dept d
where e.deptno = d.deptno and ename = 'SMITH';

create table test1(
    id number(2)
    constraint test1_id_pk primary key,
    name varchar2(10),
    age number(2)
);

create table test2 (
    id number(2)
    constraint test2_id_fk
    references test1(id),
    job varchar2(20)
);

drop table test1;

INSERT INTO test1 VALUES(1, '장희빈', 10);
INSERT INTO test1 VALUES(2, '이효리', 25);
INSERT INTO test1 VALUES(3, '이나영', 40);
INSERT INTO test1 VALUES(4, '이혜리', 35);
INSERT INTO test1 VALUES(5, '주진모', 15);

INSERT INTO test2 VALUES(1, '백수');
INSERT INTO test2 VALUES(3, '백조');
INSERT INTO test2 VALUES(5, '날라리');
INSERT INTO test2 VALUES(3, '강사');
INSERT INTO test2 VALUES(6, '건달'); --부모테이블에 키값(6)이 없어서 안됨

commit;

select * 
from test1 t1
join test2 t2
on t1.id = t2.id;

select t1.id, name, age, job
from test1 t1
join test2 t2
on t1.id = t2.id;

select emp.ename, dept.dname
from emp join dept
using(deptno) --on t1.id = t2.id;
where ename = 'SMITH';

select * 
from emp inner join dept
using(deptno)
where dept.deptno>=10;


select * from test1 t1
left outer join test2 t2
on t1.id = t2.id;

select *
from test1 t1, test2 t2
where t1.id = t2.id(+);

alter table test2
drop constraint TEST2_ID_FK;

insert into test2 values (9, '개발');
commit;

select *
from test1 t1
right outer join test2 t2
using (id);

select * 
from test1 t1, test2 t2
where t1.id(+) = t2.id;

select * 
from test1 t1
left outer join test2 t2
on t1.id = t2.id;

select emp.*, dept.dname from emp, dept
where emp.deptno = dept.deptno;

select emp.*, d.dname from emp, (select * from dept where deptno <=20) d
where emp.deptno = d.deptno;


select emp.*, dept.dname
from emp, dept
right outer join dept
where emp.* = dept.*;

--left join

--full outer join
select * from test1 t1
full outer join test2 t2
using (id);

select ename, dname
from emp join dept
using (deptno)
where deptno = 10;



select ename, dname
from emp, dept
where emp.deptno = dept.deptno and dept.deptno = 10;

select ename, d.dname 
from emp, (select *from dept where deptno=10) d 
where emp.deptno = d.deptno;

select ename, (select dname from dept where dept.deptno = emp.deptno) dname
from emp
where deptno = 10;

select * from dept b
where b.deptno
in (select distinct deptno from emp where sal>=3000);

select * from dept b
where exists (select * from emp e where e.deptno = b.deptno);

select * from emp e
where exists(select * from dept b where b.deptno = e.deptno);


select * from dept b
where b.deptno
not in (select distinct deptno from emp where sal>=3000);

select * from dept b
where not exists (select * from emp e where e.deptno = b.deptno);

select * from emp e
where not exists(select * from dept b where b.deptno = e.deptno);

select e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e, dept d;

select e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e
cross join dept d;

SELECT E.JOB_ID, E.EMPLOYEE_ID, J.START_DATE
FROM JOB_HISTORY J, EMPLOYEES E
WHERE E.JOB_ID = J.JOB_ID
ORDER BY E.JOB_ID;

select count(*) from employees
where job_id in( );

--INT자료형 (= NUMBER(38)과 동일) : 음수,0,양수만 표현
CREATE TABLE board (
  no INT PRIMARY KEY,
  subject VARCHAR2(30),
  content VARCHAR2(50),
  w_date DATE
);

ALTER TABLE board MODIFY ( subject NOT NULL);

truncate table board;
drop sequence seq_no;
create sequence seq_no nocache;
-- board의 no 컬럼에 사용할 시퀀스 생성

INSERT INTO board VALUES(seq_no.NEXTVAL, 'java1', 'java', sysdate);
select seq_no.currval from dual;

INSERT INTO board VALUES(seq_no.NEXTVAL, 'java2', '자바', sysdate);
INSERT INTO board VALUES(seq_no.NEXTVAL, 'java3', 수업, sysdate); --error 시 번호표 안올라감
INSERT INTO board VALUES(seq_no.NEXTVAL, 'java3', '수업', sysdate);
SELECT * FROM board;

INSERT INTO board VALUES(seq_no.NEXTVAL, 'java3', '수업', sysdate);
SELECT * FROM BOARD;

DELETE FROM board WHERE NO=4;
SELECT *FROM board;

INSERT INTO board VALUES(seq_no.NEXTVAL, 'java2', '영어', sysdate);
SELECT *FROM board;

select * from user_sequences;

truncate table board;
drop sequence seq_no;
create sequence seq_no nocache;
select seq_no.currval from dual;

--시퀀스를 max부터 -1 감소하게 하려면
create sequence seq_no
start with 5 --이 부분은 생략 가능.
increment by -1
minvalue 0
maxvalue 5 --이 부분은 생략불가, start값이 max보다 크면 안됨
nocache; --이 부분은 생략 가능. 디폴트가 nocache

INSERT INTO board VALUES(seq_no.NEXTVAL, 'java1', 'java', sysdate);
INSERT INTO board VALUES(seq_no.NEXTVAL, 'java2', '자바', sysdate); --쿼리 에러는 번호표 안뽑힘
INSERT INTO board VALUES(seq_no.NEXTVAL, 'java3', '수업', sysdate);
INSERT INTO board VALUES(seq_no.NEXTVAL, '', '영어', sysdate); --제약조건 에러는 번호표 뽑힘
INSERT INTO board VALUES(seq_no.NEXTVAL, 'java2', '국어', sysdate);
--INSERT INTO board VALUES(seq_no.NEXTVAL, 'java2', '고어', sysdate);
--INSERT INTO board VALUES(seq_no.NEXTVAL, 'java2', '수학', sysdate);
--INSERT INTO board VALUES(seq_no.NEXTVAL, 'java2', '한문', sysdate);
SELECT *FROM board;

select * from user_constraints where table_name = 'BOARD';

view

commit;


create table emp07
as
select seq_no.nextval, empno, ename, deptno, sal, job from emp; 

alter table emp07 drop column nextval;
truncate table emp07;

insert into emp07 values(seq_no.nextval, 'MARIA', 90, 6000, 'BABO');

select seq_no.currval from dual;

update emp07 set empno=seq_no.nextval, deptno = seq_no.nextval where empno=1; 
-- update는 dml 데이터가 없으면 수정이 안되어 번호표가 안뽑힘




















