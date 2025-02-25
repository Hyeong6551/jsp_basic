<%@page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:include page="../dbConnection.jsp" />
<%
	Connection conn = (Connection)session.getAttribute("conn"); 

	// cart_no가 중복되지 않기 위해 select
	PreparedStatement pstmt = null;
	
	// insert into 부분
 	String user_id = (String)session.getAttribute("user_id");
	String goods_no = request.getParameter("goods_no");
	int goods_quantity = Integer.parseInt(request.getParameter("goods_quantity"));
	
	String sql2 = "insert into cart (cart_user_no, cart_goods_no, cart_goods_quantity) "+
	"values(?,?,?) ON DUPLICATE KEY update cart_goods_quantity = cart_goods_quantity + VALUES(cart_goods_quantity)";

	try{
		pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1, user_id);
		pstmt.setString(2, goods_no);
		pstmt.setInt(3, goods_quantity);
		pstmt.executeUpdate();
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		try { if (pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
		try { if (conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); }
		response.sendRedirect("CartForm.jsp");
	}
	
	
%>