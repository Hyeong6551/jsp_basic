<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listDept</title>
</head>
<body>
	<a href="inputDept.jsp">dept 입력</a>
	<table border='1'>
		<tr>
			<td>deptno</td>
			<td>dname</td>
			<td>loc</td>
			<td>Delete</td>
			<td>수정</td>
		</tr>
		<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/spring5fs";
			String sql = "select * from dept";

			conn = DriverManager.getConnection(url, "root", "1234");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt("deptno")%></td>
			<td><%=rs.getString("dname")%></td>
			<td><%=rs.getString("loc")%></td>
			<td><a href="deleteDept.jsp?deptno=<%=rs.getInt("deptno")%>">삭제</a></td>
			<td><a href="updateDept.jsp?deptno=<%=rs.getInt("deptno")%>">수정</a></td>
		</tr>
		<%
		}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try { if (rs != null) { rs.close(); } } catch (Exception e) { e.printStackTrace(); }
				try { if (pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
				try { if (conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); }
			}
		%>
	</table>
</body>
</html>