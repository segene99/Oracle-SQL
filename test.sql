set serveroutput on

create or replace function test_func(p_n1 emp.ename%type)
return dept.dname%type --리턴타입

is
v_dname dept.dname%type; --리턴타입과 같은 자료형, VARCHAR2(14 BYTE)
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
- `create or replace function 함수명 [(매개변수들)]`
- `return 리턴할변수명 리턴할변수의자료형`
- `is 변수 선언문;`
- `…`
- `begin`
- `실행문;`
- `…`
- `return 리턴할 변수명;`
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
- create or replace procedure 프로시저명 (p1 [in | out| inout] 데이터타입 := 값,…)]
- is [as]  // is 또는 as 가능: 별 차이 없다.
- 변수, 상수 등 선언
- begin
- 실행문;
- …
- [exception
- 예외처리문;
- ]
- end [프로시저명];
- /
*/

set serveroutput on

