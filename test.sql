set serveroutput on

create or replace function test_func(p_n1 emp.ename%type)
return dept.dname%type --����Ÿ��

is
v_dname dept.dname%type; --����Ÿ�԰� ���� �ڷ���, VARCHAR2(14 BYTE)
v_deptno emp.deptno%type; --NUMBER(2,0)

begin
select deptno into v_deptno from emp
where ename = p_n1;

select dname into v_dname from dept
where deptno = v_deptno;

return v_dname;
end;
/

--select test_func(p_n1 emp.ename%type) from dual;
--select test_func('SMITH') from dual;
--select * from emp;

declare
    v_dname dept.dname%type;
begin
    select test_func() into v_dname from dual;    
    dbms.output.put_line('v_dname : '|| v_dname);
end;
/

create or replace function topname_fnc
return emp.ename%type
is
    v_ename emp.ename%type;
begin
    select ename into v_ename from emp
    where sal =( select max(sal) from emp);
    
    return v_ename;
end;
/
declare
    v_ename emp.ename%type;
begin
select topname_fnc() into v_ename from dual;
dbms_output.put_line('v_ename: ' || v_ename);
end;
/
/*
- `create or replace function �Լ��� [(�Ű�������)]`
- `return �����Һ����� �����Һ������ڷ���`
- `is ���� ����;`
- `��`
- `begin`
- `���๮;`
- `��`
- `return ������ ������;`
- `end;`
- `/`
*/

create or replace function my_mul(n1 number, n2 number)
return number
is
v_result number;
begin
v_result := n1*n2; 
end;
/

declare
    v_result number;
begin
    select my_mul(5,3) into v_result from dual;
    dbms_output.put_line(v_result);
end;

/*
- create or replace procedure ���ν����� (p1 [in | out| inout] ������Ÿ�� := ��,��)]
- is [as]  // is �Ǵ� as ����: �� ���� ����.
- ����, ��� �� ����
- begin
- ���๮;
- ��
- [exception
- ����ó����;
- ]
- end [���ν�����];
- /
*/

set serveroutput on

