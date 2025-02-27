<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../dbConnection.jsp" />
<%
	String order_id = request.getParameter("order_id");

	Connection conn = (Connection)session.getAttribute("conn"); 
	PreparedStatement pstmt = null;	ResultSet rs = null;
	
	// 장바구니에 들어있는 상품 번호 꺼내오기
	ArrayList<Integer> list = new ArrayList<>();
	
	String select_sql = "select * from users u, cart c where c.cart_user_id = u.user_id and u.user_id=?";
	try{
		pstmt = conn.prepareStatement(select_sql);
		pstmt.setString(1, order_id);
		rs = pstmt.executeQuery();
		while(rs.next()){
			list.add(rs.getInt("cart_goods_no"));
		}
	}catch(Exception e){
		e.printStackTrace();
	} finally{
		try{ if(rs != null){ rs.close(); } } catch(Exception e){ e.printStackTrace(); }
	}

	// 꺼내온 상품번호를 주문목록에 넣기 
 	String insert_sql = "INSERT INTO orderlist (order_user_id, order_goods_no,order_date) "+
			  "VALUES(?,?,now())";
	
	Iterator<Integer> iter = list.iterator();
	while(iter.hasNext()){
		try{
			pstmt = conn.prepareStatement(insert_sql);
			pstmt.setString(1, order_id);
			pstmt.setInt(2, iter.next());	
		} catch(Exception e){
			e.printStackTrace();
		}
		pstmt.executeUpdate();
	}
	
	// 장바구니 삭제
	String delete_sql = "DELETE FROM cart WHERE cart_user_id=?";
	try {
		pstmt = conn.prepareStatement(delete_sql);
		pstmt.setString(1, order_id);
		pstmt.executeUpdate();
	} catch (Exception e){
		e.printStackTrace();
	} finally {
		try{ if(pstmt != null){ pstmt.close(); } } catch(Exception e){ e.printStackTrace(); }
		try{ if(conn != null){ conn.close(); } } catch(Exception e){ e.printStackTrace(); }
		response.sendRedirect("OrderSuccessForm.jsp");
	}
%>