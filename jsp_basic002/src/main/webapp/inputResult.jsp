<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String deptno = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	
	Connection conn = null; PreparedStatement pstmt = null;
	
	if(!deptno.equals("") && !dname.equals("") && !loc.equals("")){
		try {
			String sql = "insert into dept (deptno, dname, loc) values (?,?,?)";
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/spring5fs";
		
			conn = DriverManager.getConnection(url, "root","1234");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, deptno);
			pstmt.setString(2, dname);
			pstmt.setString(3, loc);
			pstmt.executeUpdate();
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			try{ if (pstmt != null) { pstmt.close(); } } catch(Exception e){ e.printStackTrace(); }
			try{ if (conn != null) { conn.close(); } } catch(Exception e){ e.printStackTrace(); }
			response.sendRedirect("listDept.jsp");
		}
	}
%>
