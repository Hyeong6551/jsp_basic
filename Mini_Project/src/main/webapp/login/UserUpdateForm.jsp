<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../dbConnection.jsp" />
<%
	Connection conn = (Connection)session.getAttribute("conn");
	PreparedStatement pstmt = null;	ResultSet rs = null;
	
	String sql = "select * from users";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 페이지</title>
</head>
<body>
	<jsp:include page="../Header.jsp"/>
<%=rs.getString("user_name") %><br>
<%=rs.getString("user_postcode") %><br>
<%=rs.getString("user_address") %><br>

<%
		}
	} catch (Exception e){
		e.printStackTrace();
	} finally {
	    if(rs != null) try { rs.close(); } catch(Exception e) {}
	    if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
	    if(conn != null) try { conn.close(); } catch(Exception e) {}
	}
%>
	<jsp:include page="../Footer.jsp"/>
</body>
</html>