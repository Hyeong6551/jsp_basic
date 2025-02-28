<%@page import="com.company.dao.CartOrderDao"%>
<%@page import="com.company.dto.CartDto"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../login/LoginCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=loginCheck %> 장바구니 목록</title>
<script>
	// 장바구니 삭제
	function deleteCart(no){
		if(confirm("장바구니에서 삭제 하시겠습니까?")){
            location.href = 'CartDelete_Process.jsp?cart_no=' + no;
		}	
	}
	
	// 장바구니 주문
	function order(id){
		if(confirm("주문하시겠습니까?")){
			location.href = '../order/Order_Process.jsp?order_id=' + id;
		}
	}
</script>
</head>
<body>
	<jsp:include page="../Header.jsp"/>
	<section class="h-100">
	  <div class="container h-100 py-5">
	    <div class="row d-flex justify-content-center align-items-center h-100">
	      <div class="col-10">
    	  <div class="d-flex justify-content-between align-items-center mb-4">
	          <h3 class="fw-normal mb-0"><%=loginCheck %> 장바구니</h3>
	      </div>
			<%
				DecimalFormat df = new DecimalFormat("###,###");
				String user_id = (String)session.getAttribute("user_id");
			
				int total=0;
			
				CartOrderDao cdao = new CartOrderDao();
				for(CartDto cart : cdao.selectAllCart(user_id)){
			%>
	        <div class="card rounded-3 mb-4">
	          <div class="card-body p-4">
	            <div class="row d-flex justify-content-between align-items-center">
	              <div class="col-md-2 col-lg-2 col-xl-2">
	                <img
	                  src="../<%=cart.getGoodsDao().getGoods_image() %>"
	                  class="img-fluid rounded-3" alt="Cotton T-shirt">
	              </div>
	              <div class="col-md-3 col-lg-3 col-xl-3">
	                <p class="lead fw-normal mb-2">상품명 : <%=cart.getGoodsDao().getGoods_name() %></p>
	              </div>
	              <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
	              	<h6 class="lead fw-normal mb-2 px-2">수량</h6	>
	                <input id="form1" min="0" name="quantity" value="<%=cart.getCart_goods_quantity() %>" type="text"
	                  class="form-control form-control-sm" style="max-width: 3rem; text-align: center" size=5 readonly="readonly">
	              </div>
	              <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
	                <h5 class="mb-0">가격 : <%=df.format(cart.getGoodsDao().getGoods_price() * cart.getCart_goods_quantity()) %>원</h5> <!-- input 수량이 늘어나면 가격 변동 -->
	              </div>	              
	              <div class="col-md-1 col-lg-1 col-xl-1 text-end">
	                <a href="javascript:void(0)" onclick="deleteCart('<%=cart.getCart_no()%>')" class="btn btn-danger">삭제</a>
	              </div>
	            </div>
	          </div>
	        </div>
<%
			total += cart.getGoodsDao().getGoods_price() * cart.getCart_goods_quantity();
		}
%>           
			<div class="d-flex justify-content-between align-items-center"> 
			    <div>
			        <h5 class="mb-0">총합 : <%=df.format(total) %>원</h5>
			    </div>
			    <a href="javascript:void(0)" class="btn btn-warning btn-lg" onclick="order('<%=user_id%>')">주문하기</a>
			</div>
	      </div>
	    </div>
	  </div>
	</section>
 	<jsp:include page="../Footer.jsp"/>
</body>
</html>