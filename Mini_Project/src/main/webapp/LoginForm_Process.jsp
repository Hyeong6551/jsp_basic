<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
	
	String user_id = request.getParameter("user_id");
	String user_password = request.getParameter("user_password");
	
	// 아이디 비밀번호 체크
	String id_check=""; 
	String password_check="";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/spring5fs";
		conn = DriverManager.getConnection(url, "root","1234");
		
		String sql = "SELECT * FROM users where user_id=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user_id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			id_check = rs.getString("user_id");
			password_check = rs.getString("user_password");
		}
		
		if(id_check.equals(user_id) && password_check.equals(user_password)){
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
