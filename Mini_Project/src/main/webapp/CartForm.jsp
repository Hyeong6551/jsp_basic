<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:include page="dbConnection.jsp" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록</title>
</head>
<body>
	<jsp:include page="Header.jsp"/>
	<section class="h-100">
	  <div class="container h-100 py-5">
	    <div class="row d-flex justify-content-center align-items-center h-100">
	      <div class="col-10">
    	  <div class="d-flex justify-content-between align-items-center mb-4">
	          <h3 class="fw-normal mb-0">장바구니</h3>
	      </div>
			<%
				PreparedStatement pstmt = null; ResultSet rs = null;
				String sql = "select * from goods g, cart c where g.goods_no=c.cart_goods_no";
				
				Connection conn = (Connection)session.getAttribute("conn");
			
				try {
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
			%>
<script>
	function cal(){
        let quantity = document.getElementById("quantity").value;
        let price = <%=rs.getInt("goods_price") %>; // JSP에서 가져온 가격 값
        let total = quantity * price;
        document.getElementById("total").innerText = total + "원";
	}
</script>
	        <div class="card rounded-3 mb-4">
	          <div class="card-body p-4">
	            <div class="row d-flex justify-content-between align-items-center">
	              <div class="col-md-2 col-lg-2 col-xl-2">
	                <img
	                  src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
	                  class="img-fluid rounded-3" alt="Cotton T-shirt">
	              </div>
	              <div class="col-md-3 col-lg-3 col-xl-3">
	                <p class="lead fw-normal mb-2"><%=rs.getString("goods_name") %></p>
	              </div>
	              <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
	                <input id="form1" min="0" name="quantity" value="<%=rs.getInt("cart_goods_quantity") %>" type="number"
	                  class="form-control form-control-sm" onchange="cal()"/>
	              </div>
	              <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
	                <h5 class="mb-0"><%=rs.getInt("goods_price") %></h5> <!-- input 수량이 늘어나면 가격 변동 -->
	              </div>
	              <div class="col-md-1 col-lg-1 col-xl-1 text-end">
	                <a href="#!" class="btn btn-danger">삭제</a>
	              </div>
	            </div>
	          </div>
	        </div>
<%
		}
	} catch (Exception e){
		e.printStackTrace();
	}
%>            
			<div class="col-md-1 col-lg-1 col-xl-1 text-end">
               <h5 class="mb-0"><span id="total"></span></h5>
            </div>
	        <button  type="button" class="btn btn-warning btn-block btn-lg">주문하기</button>
	      </div>
	    </div>
	  </div>
	</section>
 	<jsp:include page="Footer.jsp"/>
</body>
</html>