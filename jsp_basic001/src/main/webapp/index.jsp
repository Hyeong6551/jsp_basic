<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String url = "jdbc:mysql://localhost:3306/spring5fs";
	Connection conn = null;	PreparedStatement pstmt = null;	ResultSet rs;
	
	String sql = "select * from emp;";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		out.println("드라이버 로딩<br>");
		conn = DriverManager.getConnection(url, "root","1234");
		
		if( conn != null){
			out.println("mysql 성공<br>");
		}
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			int empno = rs.getInt("empno");
			String ename = rs.getString("ename");
			int sal = rs.getInt("sal");
			out.println("<p>| 번호 : "+empno+" | 이름 : "+ename+" | 급여 : "+sal+" |<br></p>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>