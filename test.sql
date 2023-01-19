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