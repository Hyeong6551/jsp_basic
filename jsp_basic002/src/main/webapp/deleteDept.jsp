<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String deptno = request.getParameter("deptno");
	
	Connection conn = null; PreparedStatement pstmt = null;
	
	try {
		String sql = "delete from dept where deptno=?";
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/spring5fs";
	
		conn = DriverManager.getConnection(url, "root","1234");
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, deptno);
		pstmt.executeUpdate();
	} catch (Exception e){
		e.printStackTrace();
	} finally {
		try{ if (pstmt != null) { pstmt.close(); } } catch(Exception e){ e.printStackTrace(); }
		try{ if (conn != null) { conn.close(); } } catch(Exception e){ e.printStackTrace(); }
		response.sendRedirect("listDept.jsp");
	}
%>