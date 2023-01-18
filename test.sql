select * FROM emp;
--select 컬럼명선택절
--from 테이블명
--where 조건절
--group by 그룹절
--having 그룹에 대한 조건절
--order by 오름차순, 내림차순 설정절

select * FROM emp where empno = 7654;

select empno, ename, hiredate from emp where job = 'SALESMAN' order by empno, ename desc;

select * from emp where empno not in (7900, 7902);

select * from emp where ename = 'WARD' or ename = 'SMITH';
select * from emp where ename in ('WARD', 'SMITH');

select empno, ename, sal, job from emp where mgr = 7698;

select ename, job, deptno, hiredate from emp where hiredate >= '81/12/01';

select * from emp where job not in ('SALESMAN','ANALYST');

select * from emp where sal >= 2400 and job = 'CLERK';
