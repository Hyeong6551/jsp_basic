<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp table</title>
</head>
<body>
<table border="1">
<tr><td>EMPNO</td><td>ENAME</td><td>JOB</td><td>MGR</td><td>HIREDATE</td><td>SAL</td><td>COMM</td><td>DEPTNO</td><td>DELETE</td></tr>
<%
	Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/spring5fs";
		String sql = "select * from emp";
		
		conn = DriverManager.getConnection(url, "root", "1234");
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
%>
<tr>
	<td><a href="empUpdate.jsp?empno=<%=rs.getInt("empno")%>"><%=rs.getInt("empno")%></a></td><td><%=rs.getString("ename") %></td><td><%=rs.getString("job") %></td>
	<td><%=rs.getInt("mgr") %></td><td><%=rs.getString("hiredate") %></td><td><%=rs.getInt("sal") %></td>
	<td><%=rs.getInt("comm") %></td><td><%=rs.getInt("deptno") %></td><td><a href="empDelete.jsp?empno=<%=rs.getInt("empno")%>">삭제</a></td>
</tr>
<%
		}
	} catch (Exception e){
		e.printStackTrace();
	} finally {
		try { if (rs != null) { rs.close(); } } catch (Exception e) { e.printStackTrace(); }
		try { if (pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
		try { if (conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); }
	}
%>
</table>
<a href="empCreate.jsp"><button>Create</button></a>
</body>
</html>