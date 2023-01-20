select * from emp;

select empno, ename from emp
where ename like '_A%';

--null 값 가져오기
select * from emp
where comm is null;

--집계함수
select * from EMP order by deptno;

--count
select count(*) from emp where deptno = 30; --null값도 반영
select count(comm) from emp; --null값 미반영
-- avg
select deptno, job, avg(sal) 
from emp 
group by deptno,job -- = deptno||job
order by deptno;

select deptno, sum(sal)/count(*) from emp group by deptno order by deptno;



--group by
select deptno, sum(sal) from emp group by deptno;

select deptno, MAX(SAL), min(sal) from emp group by deptno;

select sal, count(*) from emp group by sal;

select sum(comm) / count(*) from emp; --12

select sum(comm) / count(comm) from emp; --4

select avg(comm) from emp;

select comm from emp order by comm;

select comm, count(*) from emp group by comm; --null = 8 
select comm, count(comm) from emp group by comm; --null =0

--부서별로 연봉이 2000 이상인 경우 부서별 연봉의 평균을 산출하세요.
select deptno, avg(sal)
from emp 
where sal >= 2000 
group by deptno
order by deptno;

--사원테이블에서 관리자가 존재하는 사람들 중에서 관리자별, 직책별로 나누어 연봉의 합계를 구하세요

select mgr, job, sum(sal)
from emp
where mgr is not null -- = '7%'
group by mgr, job
order by mgr;

--사원테이블에서 연봉이 2500이상인 사원에 대하여 부서별 인원수를 검색하세요
select deptno, count(deptno)
from emp
where sal >= 2500
group by deptno
order by deptno;

select * from emp;

--부서별로 평균연봉이 2000 이상인 경우 부서별 연봉의 평균을 산출하세요.
select deptno, avg(sal)
from emp 
having avg(sal) >= 2000 
group by deptno
order by deptno;

--
select deptno, avg(sal), sum(sal)
from emp
having count(deptno) >= 5
group by deptno
order by deptno;

select * from emp;

select deptno, avg(sal)
from emp
where sal >= 1000
group by deptno
having avg(sal) >= 2000
order by deptno;

select job, deptno, sum(sal), count(*)
from emp
where deptno = 30
group by job, deptno;


select * from dual;

select floor(34.5678) from dual;

select round(345.678, 2) from dual; --345.68
select round(345.678, 1) from dual;--345.7
select round(345.678) from dual; --346
select round(345.678, -1) from dual; --350
select round(345.678, -2) from dual; --300

select mod(5, 3) from dual;

select empno, ename, job from emp where mod(empno, 2) = 0;

--sysdate
select sysdate from dual;

select sysdate from dual;
select sysdate-1 어제, sysdate 오늘, sysdate+1 내일 from dual;

select ename, sysdate, hiredate, round((sysdate - hiredate)/365) from emp where deptno = 10;

select hiredate, round(hiredate, 'MONTH') from emp where deptno = 10;

select round (to_date('2023-01-16','yyyy-MM-DD'),'MONTH') from dual;

select hiredate, round(hiredate, 'YEAR') from emp where deptno = 10;

select upper('DataBase'), lower('DataBase') from dual;

select initcap('DATABASE PROGRAM') initcap FROM DUAL;

select ename||', '||job wc from emp;

select concat(concat('Data', 'Base'),'Base') from dual;

/* 
문자: 
길이: length
용량: byte => lengthb
*/

/*
'가나다가' => 4자 --3bytes, 하위버젼은 2bytes
영어 , 숫자, 특수문자 => 1byte
length(글자의 개수), lengthb(메모리에 차지하는 바이트 수);
*/

select length('data'), lengthb('data'),
length('오라클'), lengthb('오라클')
from dual;

select *
from emp
where length(ename) <= 4;

select substr('DataBase',-4,3) from dual;

select ename, substr(hiredate, 1,6) from emp
where deptno = 20;

select * from emp;
,
select substr(hiredate,-2,2), count(hiredate)
from emp 
group by substr(hiredate,-2,2);

select substr(hiredate, -2,2), count(substr(hiredate,-2,2))
from emp
group by substr(hiredate,-2,2);


select substrb('데이터베이스', 3, 4),
substrb('데이터베이스', 3, 4),
substrb('데이터베이스', 1, 6),
substrb('데이터베이스', 2, 11)
from dual;

select lpad('DataBase', 10, '0') from dual; 
select rpad('DataBase', 10, '0') from dual;

select ltrim('aaaaDataBase Programingaaaa', 'a'),
rtrim('aaaaDataBase Programingaaaa', 'a'),
trim('a' from 'aaaaDataBase Programingaaa')
from dual;

select * from emp;

select ename, trim('S' from ename), trim('H' from ename)
from emp
where ename = 'SMITH';

--------------------------------1/19일 끝-------------------------------------
--to_char
select sysdate,
to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss AM DAY')
from dual;

select ename,
to_char(hiredate, 'yyyy"년" mm"월" dd"일" DAY')
from emp;

--local language setting
select 
to_char(sysdate, 'AM', 'NLS_DATE_LANGUAGE=JAPANESE') as JAPANESE,
to_char(sysdate, 'AM', 'NLS_DATE_LANGUAGE=korean') as KOREAN
from dual;

--fm
select to_char(123456,'fm000,000,000,000'), to_char(123456, '000,000,000,000'), to_char(123456, '000') from dual;

select ename, sal,
to_char(sal,'L999,999')
from emp
where deptno = 10;

select ename, sal,
to_char(sal,'$999,999')
from emp
where deptno = 10;

--trunc
select trunc((sysdate - to_date('2011-01-01', 'yyyy-mm-dd'))/365) from dual;
select ename, to_char(hiredate, 'yyyymmdd') from emp where hiredate = to_date(19810220, 'yyyymmdd');

--to date, to char
select sysdate, systimestamp from dual;
select to_date(sysdate, 'yyyy-mm-dd hh24:mi:ss'), systimestamp from dual; --날짜자료형
select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'), systimestamp from dual; --문자자료형
select to_date(sysdate, 'yyyy-mm-dd hh24:mi:ss'), systimestamp, to_char(systimestamp, 'yyyy-mm-dd hh24:mi:ss.ff3') from dual;

--sunday, sun 등은 오라클의 언어설정으로 적용안됨.

select next_day(sysdate, '토요일'), next_day(sysdate, '금'), next_day(sysdate, 7), next_day(sysdate-8, '토요일') from dual;

select last_day(sysdate), months_between(sysdate, to_date('2011-01-01', 'yyyy/mm/dd')), trunc(months_between(sysdate, to_date('2011-01-01', 'yyyy/mm/dd')) /12) from dual;

select to_char(to_number('10,000','999,999')
+ to_number('20,000','999,999'), '00,000')
as sum from dual;

select ename, sal, comm, job, nvl(comm, 0) from emp;
select avg(nvl(comm, 0)) from emp;
select avg(comm) from emp;

/*select ename, sal, comm, job, nvl(comm, 0), avg(nvl(comm,0)), avg(comm)
from emp
group by ename, sal, comm, job, nvl(comm, 0), avg(nvl(comm,0)), avg(comm);
*/

select ename, sal, comm from emp;
select ename, sal, comm, sal*12+comm from emp;
select ename, sal, comm, nvl(comm, 0), sal*12+nvl(comm,0),  nvl(to_char(MGR, 'fm9999'),'CEO') from emp;

select ename, comm, mgr, sal, nvl2(comm, mgr, sal) from emp;

select comm, empno from emp where comm=0;
select comm, empno from emp where nvl(comm,0) = 0;
select comm, empno from emp where comm != 0; --다른거

select * from emp where job <> 'CLERK';
select * from emp where job ^= 'CLERK';
select * from emp where job != 'CLERK';

select INSTR('DataBase', 'B') from dual;
select INSTR('DataBase', 'b') from dual;

select INSTR('DataBase', 'a',-1,1),INSTR('DataBase', 'a',3,2) from dual;

--power(n,m) : N의 M제곱승, sqrt(n) : N의 루트값
select power(5,2), round (sqrt(2),4) from dual;

select ename , deptno,
    decode(deptno, 10, 'ACCOUNTING', 20, 'RESEARCH', 'ETC'
    )as dname 
    from emp;

select ename, job, sal, 
    decode(job, 
    'ANALYST', SAL*1.05,
    'SALESMAN', SAL*1.1,
    'MANAGER', SAL*1.15, 
    'CLERK',SAL*1.2,
    SAL*2.0
    )as 급여인상
from emp;

select ename, deptno,
    case 
        when deptno = 10 then 'ACCOUNTING'
        when deptno =20 then 'RESEARCH'
            else 'OPERATIONS'
    end as dname
from emp;

select ename, job, sal, 
    case job when 'ANALYST' then (SAL*1.05)
             when 'SALESMAN' then (SAL*1.1)
             when 'MANAGER' then (SAL*1.15)
             when 'CLERK' then (SAL*1.2)
    end 급여인상
from emp;


create table dept01 as select * from dept;
select * from dept where 1=0; --구조만 가져오기

create table dept02 as select * from dept where 1=0;

insert into dept01(deptno, dname, loc) -- 똑같은 값이 있으면 행추가가 된다 
values(10, 'ETC');

insert into dept02(deptno, dname, loc)
values(10, 'ACCOUNTING', 'NEW YORK');

select * from dept01;
select * from dept02;


insert into dept01(deptno, dname)
values(10, 'ETC');

commit;

insert into dept01(deptno, dname)
values(40, 'ETC');

select * from dept01;
select * from dept02;jhn  b  

commit;

insert into dept02 --(deptno, dname, loc)
values (60, 'ETC', 'ETC');

select * from dept02;

commit;

rollback;
rollback;
rollback;

update emp05 set deptno = 30;

create table emp05 as select * from emp;

update emp05 set sal = sal * 1.1 where comm is not null; 
select * from emp05;

commit;
rollback;

update emp05
set hiredate = sysdate
where hiredate >= '1982-01-01';

update emp05
set hiredate = sysdate
where substr(hiredate,1,2) >= '82';

rollback;

update emp05
set comm = 500
where deptno = 10;

commit;


update emp05
set deptno = 20, job = upper('manager')
where ename = upper('james');

commit;

delete emp05
where deptno = 30;

rollback;

delete from emp05
where deptno = 30;

rollback;

delete from emp05
where substr(hiredate, 1,2) >= 82;

rollback;

rollback;

rollback;

--1
select sal*12 as "연봉"
from emp05;
--2
select ename, job, deptno from emp05 where job = 'SALESMAN';
--3
select * from emp05 where hiredate = '2001/12/03';

update emp05
set hiredate = '2001/12/03'
where ename = 'SMITH';

commit;
--4
select ename, job, hiredate, deptno from emp05 where deptno =20;
--5
select ename, sal
from emp05
where sal between 3000 and 5000; --where sal >= 3000 and sal <= 5000;
--6
select  empno, mgr, ename, deptno
from emp05
where sal >=1500 and mgr in (7698, 7902);
--14
select * from emp05 where nvl(comm,0)=0;
--15
update emp05
set sal = sal + 200
where substr(hiredate,1,2) = '80';
--16
update emp05
set sal = sal*1.1
where sal >= 3000;
rollback;
--17
delete from emp05 where hiredate >= '2001/01/01';
rollback;
--18
select deptno, avg(sal) as 연봉평균, sum(comm) as 커미션합계
from emp05
group by deptno;


