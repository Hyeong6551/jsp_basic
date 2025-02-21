<%@page import="java.sql.*"%>
<jsp:include page="dbConnection.jsp" />
<%
	PreparedStatement pstmt = null; ResultSet rs = null;
	
	Connection conn = (Connection)session.getAttribute("conn");
	String sql = "SELECT * FROM users where user_id=?";
	
	String user_id = request.getParameter("user_id");
	String user_password = request.getParameter("user_password");
	
	// 아이디 비밀번호 체크
	String id_check=""; 
	String password_check="";

	try{
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
		try { if (rs != null) { rs.close(); } } catch (Exception e) { e.printStackTrace(); }
		try { if (pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
		try { if (conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); }
	}
%>
