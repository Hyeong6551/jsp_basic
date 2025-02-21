<%@ page import="java.sql.*" %>
<jsp:include page="dbConnection.jsp" />
<%
	Connection conn = (Connection)session.getAttribute("conn");

	// cart_no가 중복되지 않기 위해 select
	PreparedStatement pstmt = null;	ResultSet rs = null;
	String sql = "select * from cart";
	
	int new_cart_no = (int)(Math.random()*1000+1);
	
	try{
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			int cart_no = rs.getInt("cart_no");
			int temp = cart_no;
			if(new_cart_no == temp){
				new_cart_no = (int)(Math.random()*1000+1);
			} else {
				break;
			}
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally{
		try { if (rs != null) { rs.close(); } } catch (Exception e) { e.printStackTrace(); }
		try { if (pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
	}
	
	// insert into 부분
 	String user_id = (String)session.getAttribute("user_id");
	String goods_no = request.getParameter("goods_no");
	int goods_quantity = Integer.parseInt(request.getParameter("goods_quantity"));
	
	String sql2 = "insert into cart (cart_no, cart_user_no, cart_goods_no, cart_goods_quantity) "+
	"values(?,?,?,?)";

	try{
		pstmt = conn.prepareStatement(sql2);
		pstmt.setInt(1, new_cart_no);
		pstmt.setString(2, user_id);
		pstmt.setString(3, goods_no);
		pstmt.setInt(4, goods_quantity);
		pstmt.executeUpdate();
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		try { if (pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
		try { if (conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); }
		response.sendRedirect("CartForm.jsp");
	}
%>