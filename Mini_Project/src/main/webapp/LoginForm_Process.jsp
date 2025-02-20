<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");
	String user_password = request.getParameter("user_password");
	
	Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/spring5fs";
		conn = DriverManager.getConnection(url, "root","1234");
		
		String sql = "SELECT * FROM users where user_id=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user_id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_password", user_password);
			response.sendRedirect("Index.jsp");
		} else {
			response.sendRedirect("LoginForm.jsp");
		}
	}catch (Exception e){
		e.printStackTrace();
	}finally{
		
	}
%>
