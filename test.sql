drop table dept01;
create table dept01 as select * from dept;

savepoint c1; --c1 ���̺�����Ʈ
delete from dept01 where deptno=40; --40�� ����
select * from dept01;
commit; -- 10,20,30

delete from dept01 where deptno=30; --10,20
select * from dept01; --10,20

delete from dept01 where deptno=20; --10
savepoint c2; --c2 ���̺�����Ʈ
select * from dept01; --10

delete from dept01 where deptno=10; -- ������ ����
rollback to c2; -- c2 -> 10���� ������ ����
select * from dept01; -- 10

rollback to c1; --c1 -> 10,20���� ������ ����
select * from dept01; -- 10,20

rollback; -- commit���� �� ����
select * from dept01; -- 10,20,30


