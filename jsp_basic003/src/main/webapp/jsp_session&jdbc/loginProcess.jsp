<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;

	int empno=0;
	String ename="";
	
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	
	try {
		String sql = "select * from emp where empno=?";
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/spring5fs";
		
		conn = DriverManager.getConnection(url, "root","1234");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		rs = pstmt.executeQuery();

		if(rs.next()){
			ename = rs.getString("ename");
			empno = rs.getInt("empno");
		}
		
		if(userid.equals(String.valueOf(empno)) && password.equals(ename)){
			session.setAttribute("userid", userid);
			session.setAttribute("password", password);
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("login.jsp");
		}
	}catch (Exception e){
		e.printStackTrace();
	}finally {
		try{ if(rs != null){rs.close();} } catch (Exception e){e.printStackTrace(); }
		try{ if(pstmt != null){pstmt.close();} } catch (Exception e){e.printStackTrace(); }
		try{ if(conn != null){conn.close();} } catch (Exception e){e.printStackTrace(); }
	}
%>