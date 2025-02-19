<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	String mgr = request.getParameter("mgr");
	String hiredate = request.getParameter("hiredate");
	String sal= request.getParameter("sal");
	String comm = request.getParameter("comm");
	String deptno = request.getParameter("deptno");
	
	Connection conn = null; PreparedStatement pstmt = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/spring5fs";
		String sql = "update emp set ename=?, job=?, mgr=?, hiredate=?, sal=?, comm=?, deptno=? where empno=?";
		
		conn = DriverManager.getConnection(url, "root", "1234");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ename);
		pstmt.setString(2, job);
		pstmt.setString(3, mgr);
		pstmt.setString(4, hiredate.toString());
		pstmt.setString(5, sal);
		pstmt.setString(6, comm);
		pstmt.setString(7, deptno);
		pstmt.setString(8, empno);
		pstmt.executeUpdate();
	} catch (Exception e){
		e.printStackTrace();
	} finally{
		try { if (pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
		try { if (conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); }
		response.sendRedirect("empList.jsp");
	}
%>
