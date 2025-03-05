create or replace PROCEDURE Emp_Info3
(p_empno in emp.empno%type, p_sal out emp.sal%type)
IS
    v_empno emp.empno%type;
    v_ename emp.ename%type;
BEGIN
    DBMS_OUTPUT.ENABLE;
    SELECT  empno, ename, sal
    INTO    v_empno, v_ename, p_sal
    FROM    emp
    WHERE   empno=p_empno;
    DBMS_OUTPUT.PUT_LINE('사원번호 : '|| v_empno);
    DBMS_OUTPUT.PUT_LINE('사원이름 : '|| v_ename);
    DBMS_OUTPUT.PUT_LINE('사원급여 : '|| p_sal);
END;