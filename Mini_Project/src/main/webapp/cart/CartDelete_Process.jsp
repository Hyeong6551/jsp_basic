<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../dbConnection.jsp" />
<%
	int cart_no = Integer.parseInt(request.getParameter("cart_no")); 
	Connection conn = (Connection)session.getAttribute("conn");
	PreparedStatement pstmt = null;
	
	try { 
	    String sql = "delete from cart where cart_no=?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, cart_no);
	    pstmt.executeUpdate();
	} catch(Exception e) {
	    out.println("오류 발생: " + e.getMessage());
	} finally {
	    if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
	    if(conn != null) try { conn.close(); } catch(Exception e) {}
		response.sendRedirect("CartForm.jsp");
	}
%>