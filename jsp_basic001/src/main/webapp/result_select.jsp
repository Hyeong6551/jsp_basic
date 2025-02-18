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
	String sql = "select * from dept;";
	
	String url = "jdbc:mysql://localhost:3306/spring5fs";
	Connection conn = null;	PreparedStatement pstmt = null; ResultSet rs;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		out.println("드라이버 로딩<br>");
		conn = DriverManager.getConnection(url, "root","1234");
		
		if( conn != null){
			out.println("mysql 성공<br>");
		}
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		out.println("<table border='1'>");
		out.println("<tr><td>DEPTNO</td><td>DNAME</td><td>LOC</td></tr>");
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString("deptno")+"</td>");
			out.println("<td>"+rs.getString("dname")+"</td>");
			out.println("<td>"+rs.getString("loc")+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try { if(pstmt != null){ pstmt.close();} } catch(Exception e){ e.printStackTrace(); };
		try { if(conn != null){ conn.close();} } catch(Exception e){ e.printStackTrace(); };
	}
%>
</body>
</html>