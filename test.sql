select * FROM emp;
--select �÷�������
--from ���̺��
--where ������
--group by �׷���
--having �׷쿡 ���� ������
--order by ��������, �������� ������

select * FROM emp where empno = 7654;

select empno, ename, hiredate from emp where job = 'SALESMAN' order by empno, ename desc;

select * from emp where empno not in (7900, 7902);

select * from emp where ename = 'WARD' or ename = 'SMITH';
select * from emp where ename in ('WARD', 'SMITH');

select empno, ename, sal, job from emp where mgr = 7698;

select ename, job, deptno, hiredate from emp where hiredate >= '81/12/01';

select * from emp where job not in ('SALESMAN','ANALYST');

select * from emp where sal >= 2400 and job = 'CLERK';
