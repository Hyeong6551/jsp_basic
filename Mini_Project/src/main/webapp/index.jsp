<%@page import="com.company.dto.GoodsDto"%>
<%@page import="com.company.dao.GoodsDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css" type="text/css">
<title>hyeong's shops</title>
</head>
<body>
	<div>
	<jsp:include page="header.jsp" />
		<%-- Categories --%>
		<div class="categories my-5">
			<div class="small-container">
				<div class="row">
<%
	DecimalFormat df = new DecimalFormat("###,###");

	GoodsDao gdao = new GoodsDao();
	for(GoodsDto goods : gdao.selectAll()){

%>
		<div class="col-3">
			<a href="goods/goods.jsp?goods_no=<%=goods.getGoods_no() %>">
				<img src="<%=goods.getGoods_image() %>">
				<h6><%=goods.getGoods_name() %></h6>	
				<p><%=df.format(goods.getGoods_price()) %>원</p>
			</a>
		</div>
<%	
	}
%>
				</div>
			</div>
		</div> <%-- Categories end --%>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>