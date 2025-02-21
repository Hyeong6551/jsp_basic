<%@page import="java.sql.*" %>
<%
	Connection conn = null;
	
	String url = "jdbc:mysql://localhost:3306/spring5fs";
	String db_name = "root";
	String db_password = "1234";
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, db_name, db_password);
		session.setAttribute("conn",conn);
	} catch (Exception e){
		e.printStackTrace();
	}
%>