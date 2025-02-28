<%@page import="com.company.dao.CartOrderDao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cart_no = Integer.parseInt(request.getParameter("cart_no")); 
	
	CartOrderDao cdao = new CartOrderDao();
	boolean success = cdao.deleteCart(cart_no);
	
	if(success){
		%>
		<script>
			alert("삭제를 완료하셨습니다");
			// history.back(-1); 뒤로가기 기능이므로 삭제가 된것이 화면에 반영이 되지않음
			location.href = "CartForm.jsp";
		</script>
		<%
	} else {
		%>
		<script>
			alert("삭제 실패");
			location.href = "CartForm.jsp";
		</script>
		<%
	}
%>