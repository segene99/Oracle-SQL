
declare
    --�� �� �ּ��� ���� ����
    va integer := 2**2*3**2; --int 36
    vb positive := 5; -- 0������ ���, null ����
    vc signtype; -- -1, 0, 1, null �� ����
    vd naturaln := 0; -- 0���� ���, null �Ұ�
    ce constant varchar2(20) := '��� �׽�Ʈ';
begin
    /* ������ �ּ�: ����� dbms_output�� �̿��� ���� �� ���*/
    --����
    -- ce := '����� ����';
    dbms_output.put_line('va = '|| va ||', vb = '|| vb || ', vc = '|| vc || ', vd = '|| vd);
    dbms_output.put_line('va = '|| to_char(va));
    dbms_output.put_line('��� ce = '|| ce);
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
    dbms_output.put_line('��� / �̸� / BOOLEAN');
    dbms_output.put_line('----------------------------------');
    dbms_output.put_line(vempno || ' / ' || vename);
    end;
end;
/

--set timing on
DECLARE
   --���̺��� �÷��� ������Ÿ�԰� ��ġ���� �ִ� ���� ����. ���� ����
   --��Į�� ���� ����
   VEMPNO NUMBER(4);
   VENAME VARCHAR2(10);
   VDEPTNO NUMBER(2);
   VDNAME VARCHAR2(14);
BEGIN
   --���̺� ���� �����͸� �޾ƿ��� ��� select�� �ȿ� into�� �̿��Ѵ�.
   --select�� �÷��� ������Ÿ��, ����, ������ 
   --INTO���� ������ ������Ÿ��, ����, ������ ��ġ�ؾ� �Ѵ�.
   SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME
   --���� ��ҹ��� ���� �� ��.
   INTO vempno, vename , vdeptno , vdname
   FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO AND E.ENAME = 'SMITH';

   DBMS_OUTPUT.PUT_LINE('��� / �̸� / �μ���ȣ / �μ���'); 
   DBMS_OUTPUT.PUT_LINE('------------------------------------');
   DBMS_OUTPUT.PUT_LINE(VEMPNO || ' / ' || VENAME || ' / ' || VDEPTNO || ' / ' || VDNAME );
END;
/ 




































