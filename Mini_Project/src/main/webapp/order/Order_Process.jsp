<%@page import="com.company.dao.CartOrderDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../dbConnection.jsp" />
<%
	String order_id = request.getParameter("order_id");
	
	// 장바구니에 들어있는 상품 번호 꺼내오기
	
	CartOrderDao cdao = new CartOrderDao();
	ArrayList<Integer> list = cdao.selectCartNo(order_id);
	
	boolean success = cdao.insertOrder(order_id, list);
	
	if(success){
		cdao.deleteAllCart(order_id);
		response.sendRedirect("OrderSuccessForm.jsp");
	} else {
		%>
		<script>
			alert("실패..");
			location.href = history.back(-1);
		</script>
		<%
	}
%>