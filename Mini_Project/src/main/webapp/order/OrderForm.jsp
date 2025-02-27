<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../login/LoginCheck.jsp" %>
<jsp:include page="../dbConnection.jsp" />
<%
	Connection conn = (Connection)session.getAttribute("conn");
	String sql = "select * from orderlist ol, goods g where ol.order_goods_no = g.goods_no";
	
	PreparedStatement pstmt = null;	ResultSet rs = null;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=loginCheck %> 주문 목록</title>
</head>
<body>
<jsp:include page="../Header.jsp"/>
<section class="h-100">
  <div class="container h-100 py-5">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-10">

        <div class="d-flex justify-content-between align-items-center mb-4">
          <h3 class="fw-normal mb-0"><%=loginCheck %> 주문목록</h3>
        </div>

        <div class="card rounded-3 mb-4">
          <div class="card-bo	dy p-4">
            <div class="row d-flex justify-content-between align-items-center">
              <div class="col-md-2 col-lg-2 col-xl-2">
                <img
                  src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                  class="img-fluid rounded-3" alt="Cotton T-shirt">
              </div>
              <div class="col-md-3 col-lg-3 col-xl-3">
                <p class="lead fw-normal mb-2">상품명</p>
              </div>
              <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
               <p class="lead fw-normal mb-2">개수</p>

                <input id="form1" min="0" name="quantity" value="2" type="number"
                  class="form-control form-control-sm" />

              </div>
              <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                <h5 class="mb-0">$499.00</h5>
              </div>
              <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                <a href="#!" class="btn btn-danger">삭제</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
  		<jsp:include page="../Footer.jsp"/>
</body>
</html>