<%@page import="java.text.DecimalFormat"%>
<%@page import="com.company.dto.OrderDto"%>
<%@page import="com.company.dao.CartOrderDao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../login/loginCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=loginCheck %> 주문 목록</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<section class="h-100">
  <div class="container h-100 py-5">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-10">

        <div class="d-flex justify-content-between align-items-center mb-4">
          <h3 class="fw-normal mb-0"><%=loginCheck %> 주문목록</h3>
        </div>

<section class="h-100 gradient-custom">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-10 col-xl-8">
        <div class="card" style="border-radius: 10px;">
          <div class="card-header px-4 py-5">
            <h5 class="text-muted mb-0">주문해주셔서 감사합니다<span style="color: #a8729a;">Anna</span>!</h5>
          </div>
          <div class="card-body p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
            </div>
<%
	DecimalFormat df = new DecimalFormat("###,###");

	String user_id = (String)session.getAttribute("user_id");
	String order_id = request.getParameter("order_id"); 
	int order_no = Integer.parseInt(request.getParameter("order_no")); 
	CartOrderDao odao = new CartOrderDao();
 	OrderDto order = odao.selectOrder(order_no);
	
 	int price = order.getUsersDto().getGoodsDto().getGoods_price();
 	int quantity = order.getOrder_quantity();
	String goods_name = order.getUsersDto().getGoodsDto().getGoods_name();
	String goods_image = order.getUsersDto().getGoodsDto().getGoods_image();
	String address = order.getUsersDto().getUser_address();
	order_no = order.getOrder_no();
	String order_date = order.getOrder_date();
%>
            <div class="card shadow-0 border mb-4">
              <div class="card-body">
                <div class="row">
                  <div class="col-md-2 d-flex justify-content-between align-items-center">
                    <img src="../<%=goods_image %>"
                      class="img-fluid" alt="Phone">
                  </div>
                  <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                    <p class="text-muted mb-0"><%=goods_name %></p>
                  </div>
                  <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                    <p class="text-muted mb-0 small">수량 : <%=quantity %></p>
                  </div>
                  <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                    <p class="text-muted mb-0 small"><%=df.format(quantity*price) %> 원</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="d-flex justify-content-start pt-2">
              <p class="fw-bold mb-0">주문 번호 : <%=order_no %></p>
            </div>
            <div class="d-flex justify-content-start">
              <p class="text-muted mb-0">주문 날짜 : <%=order_date %></p>
            </div>
            <div class="d-flex justify-content-start">
              <p class="text-muted mb-0">배송지 : <%=address %></p>
            </div>

          </div>
          <div class="card-footer border-0 px-4 py-5"
            style="background-color: #a8729a; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
            <h5 class="d-flex align-items-center justify-content-end text-white text-uppercase mb-0">총합
               : <span class="h2 mb-0 ms-2"><%=df.format(quantity*price) %> 원</span></h5>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

      </div>
    </div>
  </div>
</section>
  		<jsp:include page="../footer.jsp"/>
</body>
</html>