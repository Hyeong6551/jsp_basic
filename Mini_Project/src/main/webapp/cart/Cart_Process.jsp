<%@page import="com.company.dao.CartDao"%>
<%@page import="com.company.dto.CartDto"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
 	String cart_user_id = (String)session.getAttribute("user_id");
	int cart_goods_no = Integer.parseInt(request.getParameter("cart_goods_no"));
	int cart_goods_quantity = Integer.parseInt(request.getParameter("cart_goods_quantity"));
	
	CartDto cart = new CartDto();
	cart.setCart_user_id(cart_user_id);
	cart.setCart_goods_no(cart_goods_no);
	cart.setCart_goods_quantity(cart_goods_quantity);
	
	CartDao cdao = new CartDao();
	boolean success = cdao.insertCart(cart);
	
    if(success) {
%>
	<script>
	    alert("장바구니에 추가하였습니다.");
	    location.href = "CartForm.jsp";
	</script>
<%
    } else {
%>
    <script>
        alert("추가 실패");
        history.back();
    </script>
<%
    }
%> 