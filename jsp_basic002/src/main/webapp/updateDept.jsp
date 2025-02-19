<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int deptno = 0;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/spring5fs";
		String sql = "select * from dept where deptno="+request.getParameter("deptno");
		conn = DriverManager.getConnection(url, "root", "1234");
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			deptno = rs.getInt("deptno");
		}
	} catch (Exception e){
		e.printStackTrace();
	} finally {
		try { if (rs != null) { rs.close(); } } catch (Exception e) { e.printStackTrace(); }
		try { if (pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
		try { if (conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); }
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="updateResult.jsp">
	<input type="hidden" name="deptno" value="<%=deptno %>"/>
	부서이름 : <input type="text" name="dname"/><br>
	지역 : <input type="text" name="loc"/><br>
	<input type="submit" value="수정"/>
</form>
</body>
</html>