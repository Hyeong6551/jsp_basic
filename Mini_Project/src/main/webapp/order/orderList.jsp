<%@page import="com.company.dto.OrderDto"%>
<%@page import="com.company.dao.CartOrderDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
    width: 100%;
    border-collapse: collapse;
}
th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}
th {
    background-color: #f2f2f2;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container my-5">
    <table border="1">
       <tr>
       	   <th>주문번호</th>
           <th>상품명</th>
           <th>주문날짜</th>
       </tr>
<%
	DecimalFormat df = new DecimalFormat("###,###");
	String user_id = (String)session.getAttribute("user_id");
	CartOrderDao odao = new CartOrderDao();
	for(OrderDto order : odao.selectAllOrder(user_id)){
%>
		<tr>
			<td><a href="orderForm.jsp?order_no=<%=order.getOrder_no() %>"><%=order.getOrder_no() %></a></td>	
			<td><%=order.getUsersDto().getGoodsDto().getGoods_name() %></td>	
			<td><%=order.getOrder_date()%></td>
		</tr>			
<%	
	}
%>
	</table>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>