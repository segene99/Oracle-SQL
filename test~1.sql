savepoint c1; 
delete from dept01 where deptno=40; 
select * from dept01;

savepoint c2; 
delete from dept01 where deptno=30; 
select * from dept01;

savepoint c3; 
delete from dept01 where deptno=20; 
select * from dept01;

savepoint c4; 
delete from dept01 where deptno=10; 
select * from dept01;

rollback to c2;
select * from dept01;

rollback to c3;
select * from dept01;
