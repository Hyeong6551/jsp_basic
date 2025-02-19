<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert values (CREATE)</title>
</head>
<body>
<form action="empCreateResult.jsp">
<p>EMPNO : </p><input type="text" name="empno"/>
<p>ENAME : </p><input type="text" name="ename"/>
<p>JOB : </p><input type="text" name="job"/>
<p>MGR : </p><input type="text" name="mgr"/>
<p>HIREDATE : </p><input type="date" name="hiredate"/>
<p>SAL : </p><input type="text" name="sal"/>
<p>COMM : </p><input type="text" name="comm"/>
<p>DEPTNO : </p><input type="text" name="deptno"/><br><br>
<input type="submit" value="생성"/>
</form>
</body>
</html>