<%@page import="com.company.dto.GoodsDto"%>
<%@page import="com.company.dao.GoodsDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	DecimalFormat df = new DecimalFormat("###,###");
	int goods_no = Integer.parseInt(request.getParameter("goods_no"));

	GoodsDao gdao = new GoodsDao();
	GoodsDto goods = gdao.selectGoods(goods_no);
%>
<title><%=goods.getGoods_name() %> 상품 페이지</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
<script>
	function loginPage(){
		alert("로그인 후에 이용 가능합니다");
		location.href="../login/LoginForm.jsp";
	}
</script>
</head>
<body>
	<div>
	<jsp:include page="../Header.jsp" />
		<form action="../cart/Cart_Process.jsp">
	        <section class="py-5">
	            <div class="container px-4 px-lg-5 my-5">
	                <div class="row gx-4 gx-lg-5 align-items-center">
	                    <div class="col-md-6">
	                    	<img class="card-img-top mb-5 mb-md-0" src="../<%= goods.getGoods_image() %>" alt="..." /></div>
	                    <div class="col-md-6">
                   	        <input type="hidden" name="cart_goods_no" value="<%=goods.getGoods_no() %>"/>
                            <div class="small mb-1">상품번호 : <%=goods.getGoods_no() %></div>
	                        <h1 class="display-5 fw-bolder"><%=goods.getGoods_name() %> </h1>
	                        <div class="fs-5 mb-5">
	                            <span><%=df.format(goods.getGoods_price()) %>원</span>
	                        </div>
	                        <div class="small mb-1"">
	                        	<p class="lead"><%=goods.getGoods_content() %></p>
	                        </div>
	                        <div class="d-flex">
  	                            <input class="form-control text-center me-3" name="cart_goods_quantity" type="num" min="1" value="1" style="max-width: 3rem" />
  	    <%	
			String loginCheck = (String) session.getAttribute("user_id");
			if(loginCheck == null){
		%>
	                            <a class="btn btn-outline-dark flex-shrink-0" href="../login/LoginForm.jsp" onclick="loginPage()">장바구니에 추가</a>
	    <%
			} else {
		%> 
       	                        <input class="btn btn-outline-dark flex-shrink-0" type="submit" value="장바구니에 추가"/>
	    <%
			}
	    %>
	                        </div>



	                    </div>
	                </div>
	            </div>
	        </section>
        </form>

		<jsp:include page="../Footer.jsp" />
	</div>
</body>
</html>