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
	String deptno = request.getParameter("deptno"); 
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	String sql = "insert into dept values(?,?,?);";
	
	String url = "jdbc:mysql://localhost:3306/spring5fs";
	Connection conn = null;	PreparedStatement pstmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		out.println("드라이버 로딩<br>");
		conn = DriverManager.getConnection(url, "root","1234");
		
		if( conn != null){
			out.println("mysql 성공<br>");
		}
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, deptno);
		pstmt.setString(2, dname);
		pstmt.setString(3, loc);
		out.println("추가 완료");
		pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try { if(pstmt != null){ pstmt.close();} } catch(Exception e){ e.printStackTrace(); };
		try { if(conn != null){ conn.close();} } catch(Exception e){ e.printStackTrace(); };
	}
%>
<form action="result_select">
	<input type="submit" value="결과 보러가기" />
</form>
</body>
</html>