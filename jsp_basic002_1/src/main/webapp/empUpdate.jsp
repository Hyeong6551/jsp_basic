<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Connection conn = null; 
PreparedStatement pstmt = null; 
ResultSet rs = null;
int empno = 0;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/spring5fs";
	String sql = "select * from emp where empno="+request.getParameter("empno");
	
	conn = DriverManager.getConnection(url, "root", "1234");
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		empno = rs.getInt("empno");
	} 
} catch (Exception e){
	e.printStackTrace();
} finally {
	try { if (rs != null) { rs.close(); } } catch (Exception e) { e.printStackTrace(); }
	try { if (pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
	try { if (conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); }
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Values (UPDATE)</title>
</head>
<body>
<form action="empUpdateResult.jsp">
<input type="hidden" name="empno" value="<%=empno%>"/>
<p>ENAME : </p><input type="text" name="ename"/>
<p>JOB : </p><input type="text" name="job"/>
<p>MGR : </p><input type="text" name="mgr"/>
<p>HIREDATE : </p><input type="date" name="hiredate"/>
<p>SAL : </p><input type="text" name="sal"/>
<p>COMM : </p><input type="text" name="comm"/>
<p>DEPTNO : </p><input type="text" name="deptno"/><br><br>
<input type="submit" value="수정"/>
</form>
</body>
</html>