--사원번호(EMPNO), 사원명(ENAME), 급여(SAL) 
create table EMP01(
    EMPNO number(4), --정수 4자리 숫자
    ENAME varchar2(200), --200BYTE까지
    SAL number(7,2) --정수 포함 소숫점(2자리)까지 7자리 숫자
);

insert into emp01
values (0000, '첫번째', 2500);

rollback;

insert into emp01
values (0000, '첫번째', 2500);

desc emp01;

create table DEPT01 (
    DEPTNO number(2),
    DNAME varchar2(20),
    LOC varchar2(20) 
);

alter table emp01 add (JOB varchar2(200));

desc emp01;

alter table DEPT01 add (CREDATE date);

desc dept01;

alter table emp01 modify (job char);

rollback;

desc emp01;

alter table emp01 modify (job varchar2(200));

DESC emp01;

alter table emp01 modify(job varchar2(30));

insert into emp01 values (1, '두번째', 5000, null);
insert into emp01 values (2, '세번째', 1500, 'salesman');
insert into emp01 values (3, '네번째', 1800, null);
insert into emp01 values (4, '다섯째', 3600, null);

alter table emp01 modify (job varchar2(8));
alter table emp01 modify (job varchar2(6));
alter table emp01 modify (job number(10));

update emp01 set job = '';

commit;

alter table emp01 modify(empno number(2));

desc emp01;

alter table emp01 modify(empno number(1));

desc emp01;

alter table dept01 modify(loc varchar2(5000));

alter table dept01 drop (loc);
rollback;

desc dept01;

select * from dept01;

alter table dept01 add (job varchar2(30));

alter table dept01 drop (credate);

desc dept01;

alter table dept01 add (loc varchar2(20));

rename dept01 to dept02;

create table test01;

drop table dept02;

create table emp01 as select * from emp;

drop table emp01;

delete emp01;

rollback;

truncate table emp01;

rollback;

drop table emp01;

create table emp01 as select * from emp where 1=0;

drop table emp01;

create table emp01 as select * from emp where 0=0;

create table emp02 as
select empno, ename, job from emp;

create table emp03 as
select empno, ename, job from emp where 1=0;

drop table emp01;
drop table emp02;
drop table emp03;

create table emp01(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    deptno number(4)
);

insert into emp01 values(null, '', 'SALESMAN', 30);
insert into emp01 values(null, 'TOM','SALESMAN', 30);
commit;
select * from emp01 where ename='';

drop table emp01;

create table emp02(
    empno number(4) not null,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(4)
);

INSERT INTO emp02 values(null, null, 'SALESMAN', 10);
insert into emp02 values(1401, 'TOM', 'SALESMAN', 10);

create table emp03(
    empid varchar2(20) unique not null,
    empno number(4) unique,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(4)
);

insert into emp03 values('death', 6778, 'JAMES', 'SALESMAN', 7777);
insert into emp03 values('MATRIX', 6778, 'SMITH', 'MANAGER', 7778);
insert into emp03 values('death', 7778, 'JAMES', 'SALESMAN', 7777);

commit;

insert into emp03 values(null,null,'JONES', 'SALESMAN',10);
insert into emp03 values('emp05',null,'JONES','SALESMAN',10);
insert into emp03 values('emp05',null,'JONES','SALESMAN',10);

select constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'EMP02';
commit;

create table emp04 (
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(4)
);

insert into emp04 (empno, ename, job, deptno)
values(7499, 'ALLEN', 'SALESMAN',30);

desc emp04;

insert into emp04 values (7499, 'JONES','MANAGER',20);
insert into emp04 values (NULL, 'JONES','MANAGER',20);
insert into emp04 values (7500, 'JONES','MANAGER',20);

select *
from user_constraints
where table_name = 'EMP02';

--empno number(4) constraint emp_empno_pk primary key

create table dept01 (
    deptno number(2) constraint dept01_deptno_pk primary key,
    dname varchar2(15),
    loc varchar2(15)
);

select * from user_constraints;

create table dept02 (
    deptno number(2),
    dname varchar2(15),
    loc varchar2(15),
    constraint dept02_dno_dnam_pk primary key(deptno, dname)
);

insert into dept02 values (15, '영업','서울'); --pk : 15'영업'
insert into dept02 values(15, '회계', '경기');--pk : 15'회계'
insert into dept02 values(15, '회계', '경기');
insert into dept02 values(null, '회계', '경기');

create table dept03 as select * from dept02 where 1=0;

alter table dept03 add constraint dept03_deptno_pk primary key(deptno);

alter table dept03 modify (dname not null);
alter table dept03 drop constraint DEPT03_DEPTNO_PK;
alter table dept03 add constraint DEPT03_DEPTNO_PK primary key(deptno);

insert into dept03 values(15, '영업', '서울');
commit;

alter table dept03 drop constraint DEPT03_DEPTNO_PK;

create table emp05 (
    empno number(4) primary key,
    ename varchar2(10) not null,
    gender varchar2(1 char) check (gender in('남','여'))
);

INSERT INTO EMP05
VALUES(7566, 'JONES','M');

INSERT INTO EMP05 VALUES(7566, 'JONES','남');

INSERT INTO EMP05 VALUES(7566, 'JONES','남남');
INSERT INTO EMP05 VALUES(7577, 'LEMON','여여');


create table emp07 (
    empno number(4) primary key,
    ename varchar2(10) not null,
    gender varchar2(1) check (gender in ('M','F')),
    sal number(7,2) check(sal >=1000 and sal<=10000)
);

insert into emp07 values(1234, 'TOMS', 'M', 1500);

/*
형식: 
column명 데이터타입 references 부모테이블명(부모테이블의 pk의 column명 또는 uk의 column명)
*/

create table emp06 (
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(9),
    dept number(4) references dept01(deptno)
);

select * from user_constraints where table_name = 'EMP06';

drop table emp06;

create table emp06 (
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(9),
    dno number(4) references dept01(deptno)
);

insert into emp06 values (7566, 'JONES','MANAGER',50);
insert into emp06 values (7988, 'JERRY','CEO',90);
insert into emp06 values (7988, 'JERRY','CEO',NULL);

drop table dept01;
drop table dept01 cascade constraints;

drop table emp06;

create table emp08 (
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(4),
    dname varchar2(10),
    constraint emp08_deptno_fk foreign key(deptno, dname)
    references dept02(deptno, dname)
);

insert into emp08 values(15, '영업', '오리',234,'새새');
