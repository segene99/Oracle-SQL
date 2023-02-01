drop table dept01;
create table dept01 as select * from dept;

savepoint c1; --c1 세이브포인트
delete from dept01 where deptno=40; --40번 삭제
select * from dept01;
commit; -- 10,20,30

delete from dept01 where deptno=30; --10,20
select * from dept01; --10,20

delete from dept01 where deptno=20; --10
savepoint c2; --c2 세이브포인트
select * from dept01; --10

delete from dept01 where deptno=10; -- 데이터 없음
rollback to c2; -- c2 -> 10번인 데이터 있음
select * from dept01; -- 10

rollback to c1; --c1 -> 10,20번인 데이터 있음
select * from dept01; -- 10,20

rollback; -- commit후의 값 복원
select * from dept01; -- 10,20,30


