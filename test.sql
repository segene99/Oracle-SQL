
declare
    --한 줄 주서기 변수 선언
    va integer := 2**2*3**2; --int 36
    vb positive := 5; -- 0미포함 양수, null 가능
    vc signtype; -- -1, 0, 1, null 만 가능
    vd naturaln := 0; -- 0포함 양수, null 불가
    ce constant varchar2(20) := '상수 테스트';
begin
    /* 여러줄 주석: 실행부 dbms_output을 이용한 변수 값 출력*/
    --에러
    -- ce := '상수값 변경';
    dbms_output.put_line('va = '|| va ||', vb = '|| vb || ', vc = '|| vc || ', vd = '|| vd);
    dbms_output.put_line('va = '|| to_char(va));
    dbms_output.put_line('상수 ce = '|| ce);
end;
/

declare
    vempno number(4); --v : variable
    vename varchar2(10);
begin
    DECLARE
        vempno number(4); --v : variable
        vename varchar2(10);
    BEGIN
    vempno := 7788;
    vename := 'SMITH';
    dbms_output.put_line('사번 / 이름 / BOOLEAN');
    dbms_output.put_line('----------------------------------');
    dbms_output.put_line(vempno || ' / ' || vename);
    end;
end;
/

--set timing on
DECLARE
   --테이블의 컬럼의 데이터타입과 일치시켜 주는 것이 좋다. 에러 예방
   --스칼라 변수 선언
   VEMPNO NUMBER(4);
   VENAME VARCHAR2(10);
   VDEPTNO NUMBER(2);
   VDNAME VARCHAR2(14);
BEGIN
   --테이블 안의 데이터를 받아오는 경우 select절 안에 into를 이용한다.
   --select절 컬럼의 데이터타입, 개수, 순서와 
   --INTO절의 변수의 데이터타입, 개수, 순서가 일치해야 한다.
   SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME
   --변수 대소문자 구분 안 함.
   INTO vempno, vename , vdeptno , vdname
   FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO AND E.ENAME = 'SMITH';

   DBMS_OUTPUT.PUT_LINE('사번 / 이름 / 부서번호 / 부서명'); 
   DBMS_OUTPUT.PUT_LINE('------------------------------------');
   DBMS_OUTPUT.PUT_LINE(VEMPNO || ' / ' || VENAME || ' / ' || VDEPTNO || ' / ' || VDNAME );
END;
/ 




































