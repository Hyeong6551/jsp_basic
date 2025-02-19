<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/logRg.css" type="text/css">
</head>
<body>
<%  
	String user_name = request.getParameter("user_name");
	String user_id = request.getParameter("user_id");
	String user_password = request.getParameter("user_password");
	String birth = request.getParameter("birth");
	String address = request.getParameter("address");
	
	String url = "jdbc:mysql://localhost:3306/spring5fs";
	String sql = "insert into users (user_name, user_id, user_password, birth, address) "+
			"values(?,?,?,?,?);";
	Connection conn = null;	PreparedStatement pstmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,"root","1234");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user_name);
		pstmt.setString(2, user_id);
		pstmt.setString(3, user_password);
		pstmt.setString(4, birth);
		pstmt.setString(5, address);
		pstmt.executeUpdate();
	} catch (Exception e){
		e.printStackTrace();
	} finally {
		try{ if(pstmt != null){ pstmt.close();} }catch(Exception e){e.printStackTrace();}
		try{ if(conn != null){ conn.close();} }catch(Exception e){e.printStackTrace();}
	}
	
%>
<jsp:include page="header.jsp"></jsp:include>
<div class="register-container my-2">
	<p>회원가입이 완료되었습니다</p><br>	
	<p><%=user_name %>님 환영합니다</p><br>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>