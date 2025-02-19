<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	Connection conn = null; PreparedStatement pstmt = null;
	String empno = request.getParameter("empno");
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/spring5fs";
		String sql = "delete from emp where empno=?";
		
		conn = DriverManager.getConnection(url, "root", "1234");
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, empno);
		pstmt.executeUpdate();
	} catch (Exception e){
		e.printStackTrace();
	} finally{
		try { if (pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
		try { if (conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); }
		response.sendRedirect("empList.jsp");
	}
%>