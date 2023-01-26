--�����ȣ(EMPNO), �����(ENAME), �޿�(SAL) 
create table EMP01(
    EMPNO number(4), --���� 4�ڸ� ����
    ENAME varchar2(200), --200BYTE����
    SAL number(7,2) --���� ���� �Ҽ���(2�ڸ�)���� 7�ڸ� ����
);

insert into emp01
values (0000, 'ù��°', 2500);

rollback;

insert into emp01
values (0000, 'ù��°', 2500);

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

insert into emp01 values (1, '�ι�°', 5000, null);
insert into emp01 values (2, '����°', 1500, 'salesman');
insert into emp01 values (3, '�׹�°', 1800, null);
insert into emp01 values (4, '�ټ�°', 3600, null);

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

insert into dept02 values (15, '����','����'); --pk : 15'����'
insert into dept02 values(15, 'ȸ��', '���');--pk : 15'ȸ��'
insert into dept02 values(15, 'ȸ��', '���');
insert into dept02 values(null, 'ȸ��', '���');

create table dept03 as select * from dept02 where 1=0;

alter table dept03 add constraint dept03_deptno_pk primary key(deptno);

alter table dept03 modify (dname not null);
alter table dept03 drop constraint DEPT03_DEPTNO_PK;
alter table dept03 add constraint DEPT03_DEPTNO_PK primary key(deptno);

insert into dept03 values(15, '����', '����');
commit;

alter table dept03 drop constraint DEPT03_DEPTNO_PK;

create table emp05 (
    empno number(4) primary key,
    ename varchar2(10) not null,
    gender varchar2(1 char) check (gender in('��','��'))
);

INSERT INTO EMP05
VALUES(7566, 'JONES','M');

INSERT INTO EMP05 VALUES(7566, 'JONES','��');

INSERT INTO EMP05 VALUES(7566, 'JONES','����');
INSERT INTO EMP05 VALUES(7577, 'LEMON','����');


create table emp07 (
    empno number(4) primary key,
    ename varchar2(10) not null,
    gender varchar2(1) check (gender in ('M','F')),
    sal number(7,2) check(sal >=1000 and sal<=10000)
);

insert into emp07 values(1234, 'TOMS', 'M', 1500);

/*
����: 
column�� ������Ÿ�� references �θ����̺��(�θ����̺��� pk�� column�� �Ǵ� uk�� column��)
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

insert into emp08 values(15, '����', '����',234,'����');

----------------------------2023.01.26 END---------------------------------------

select dname from dept
where deptno = (select deptno from emp where ename = 'JONES');

--smith�� ���� �μ����� �ٹ��ϴ� ����� ������ ���
--��³��� : ���, �̸�, ��å, �Ի�����, ���������ڸ� ���
select deptno, ename, job, hiredate, mgr from emp
where deptno = (select deptno from emp where ename = 'SMITH') and not ename='SMITH';

--���� �������� �׷��Լ��� ���
--��� �޿����� �� ���� �޿��� �޴� ����� �˻�
--������ ������ ����
select ename, sal from emp
where sal > (select avg(sal) from emp) order by sal desc;

select * from emp order by sal;

select empno, ename from emp
where sal = (select max(sal) from emp where deptno = 10);

select deptno, dname from dept
where not deptno = (select deptno from emp where ename = 'KING');

--king�� �μ��� �ƴ� ������� �μ���ȣ�� �μ����� ���


/* 
��������: 
where deptno in(select deptno != (select deptno from emp where ename ='KING'));
��������:
select deptno, dname from dept
*/
--��
select deptno, dname from dept
where deptno in(
select distinct deptno from emp
where deptno != (select deptno from emp where ename = 'KING')
);

--not in ������
--blake�� �ٸ� �μ����� �ٹ��ϴ� ������� �̸��� ������� ���

select ename, hiredate from emp
where deptno not in (select deptno from emp where ename ='BLAKE');

--�޿��� 3000�̻� �޴� ����� ������ �μ����� ���ϴ� ������� ������ �޿�, �μ���ȣ�� ���

--��������
-- where deptno in (select deptno from emp where sal >= 3000)
--��������
--select ename, sal, deptno from emp
--��
--select ename, sal, deptno from emp where deptno in (select deptno from emp where sal >= 3000);

--select ename, sal, deptno from emp

--�μ����� ������ �ּ� �޿��� ������ ������ �޿��� ���� ������� �̸�, �޿� �μ���ȣ�� ���
select ename, sal, deptno from emp 
where sal in (select min(sal) from emp group by deptno) order by deptno, sal;

select ename, sal, deptno from emp
where sal in (select sal from emp where sal between 2000 and 10000) order by deptno;

SELECT * from emp where sal < all(1000,2000,3000) order by sal; 
select * from emp where sal > all(1000,2000,3000) order by sal;

--�μ���ȣ�� 30���� ������� �޿� �� ���� ū ��(2850) ���� ���� �޿��� �޴� ����� �̸�, �޿��� ���
select ename, sal from emp where sal > all(select sal from emp where deptno = 30) order by sal;
--�μ���ȣ�� 30���� ������� �޿� �� ���� ���� �� ���� ���� �޿��� �޴� ����� �̸�, �޿��� ���
select ename, sal from emp where sal < all(select sal from emp where deptno = 30) order by sal;

--�μ����� �ְ� ��ձ޿��� �Ѵ� ������
select * from emp where sal > all(select avg(sal) from emp group by deptno) and deptno = 10 order by sal;

SELECT * from emp where sal < any(1000,2000,3000) order by sal;
select * from emp where sal > any(1000,2000,3000) order by sal;

--�μ���ȣ�� 30���� ������� �޿� �� --����
--�ּұ޿����� ���� �޿��� �޴� --����
--����� �̸�, �޿��� ��� --��������

select ename, sal from emp
where sal > any(select sal from emp where deptno = 30) order by sal;

--�μ���ȣ�� 30���� ������� �޿� �� ���� ū ������ ���� �޿��� �޴� ����� �̸�, �޿��� ���
select ename, sal from emp where sal < any(select sal from emp where deptno=30);


--������ �޴� �ְ�޿����� �� ���� �����鼭 ������ �ƴ� ����� ���, �̸�, ��å, �޿��� ����ϼ���
select empno, ename, job, sal from emp
where sal < any(select sal from emp where job = 'CLERK') and job <> 'CLERK';

create table emp04 as select * from emp where 1=0;
drop table emp04;
drop table emp05;

insert all into emp04 values (empno, ename, job, mgr, hiredate, sal, comm, deptno) select * from emp;

drop table emp06;
drop table emp07;
drop table emp08;

desc emp04;
select * from emp04;

rollback;

insert into emp04 select * from emp;

rollback;

insert all
into emp04
(empno, ename, deptno)
values (empno, ename, deptno)
select empno, ename, deptno from emp;

insert
into emp04
(empno, ename, deptno)
select empno, ename, deptno from emp;

insert all
into emp04
into emp05
values (empno, ename, job, mgr, hiredate, sal, comm, deptno)
select * from emp;

alter table emp04 drop (mgr, hiredate, sal, comm, deptno);

alter table emp05 drop (hiredate, sal, comm, deptno);

insert all
into emp04 values (empno, ename, job)
into emp05 values (empno, ename, job, mgr) -- values()���� column�� emp05�� ������ �ִ� �÷����� �����ؾ��Ѵ�
select
empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp;

drop table emp04;

create table emp04 as select * from emp where 1=0;

alter table emp05 add(comm number(4,0));

truncate table emp05;

drop table emp04 purge;

create table emp01
as 
select * from emp where 1=0;

drop table emp01 purge;
drop table emp02 purge;

create table emp01
as 
select * from emp where 1=0;

create table emp02
as 
select * from emp where 1=0;

insert all
into emp01 (empno, ename, job, mgr)
into emp02 (empno, ename, job, mgr)
values (empno, ename, job, mgr)
select empno, ename, job, mgr from emp;

rollback;

alter table emp01 drop (mgr, hiredate, sal, comm, deptno);
alter table emp02 drop (hiredate, sal, comm, deptno); 

truncate table emp02;

insert all
into emp01 values (empno, ename, job)
into emp02 values (empno, ename, job, mgr)
select empno, ename, job, mgr from emp;

drop table dept03 purge;

create table dept01 as select * from dept;

update dept01 
set loc = (select loc from dept01 where deptno=40)
where deptno=10;

select * from dept01;

update dept01 
set (dname, loc) 
= (select dname, loc from dept01 where deptno = 30) -- set()�� select �� column���� ��ġ�����ʾƵ� �ȴ�
where deptno = 40;

rollback;



create table emp01
as
select * from emp;

update emp01
set (empno, ename) = (select 1111, 'ù°' from dual);

rollback;

select * from emp01;

alter table emp01 add (DNAME VARCHAR2(14));

update emp01 set dname = (select dname from dept where dept.deptno = emp01.deptno);

--
DELETE FROM emp01 where deptno = (select deptno from dept where dname ='SALES');

alter table emp01 drop (dname);

--�μ���ȣ�� �������� ���� ���� ���� ��� ���̺�� �μ� ���̺� ����
select ename, dname
from emp, dept
where emp.deptno = dept.deptno;

select * from emp order by deptno;

select ename, dname, emp.deptno 
from emp, dept 
where emp.deptno = dept.deptno;

select e.ename, d.dname, e.deptno as edno, d.deptno as ddno
from emp e, dept d
where e.deptno = d.deptno
order by ddno;

select d.dname as ddnm, e.deptno as edno, d.deptno as ddno
from emp e, dept d
where e.deptno = d.deptno
--group by ddnm, edno, ddno
group by d.dname, e.deptno, d.deptno
having(d.deptno = 10)
order by ddno;

select e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno
and e.ename ='SMITH';

select e.ename, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and comm is not null;

select e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.ename like '%A%';

--self join: ���� ���̺� ������ join
select 
e.ename "����̸�", e.empno "�����ȣ", d.ename "�������̸�", d.empno "�����ڹ�ȣ"
from emp e, emp d
where e.mgr = d.empno;

--Ư�� ����� ����ϴ� �Ŵ��� ����� �̸��� ���
--work(��� ���̺�)�� manager(�Ŵ���table)�� ��Ī �ο�
select work.ename || '�� �Ŵ����� ' || MANAGER.ename
from emp work, emp MANAGER
where work.mgr = MANAGER.empno;

select ename, mgr, (select distinct ename from emp e1 where e.mgr = e1.empno) mname from emp e;
