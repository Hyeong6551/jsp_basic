<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:include page="../dbConnection.jsp" />
<%
	DecimalFormat df = new DecimalFormat("###,###");

	Connection conn = (Connection)session.getAttribute("conn");
	PreparedStatement pstmt = null; ResultSet rs = null;
	 
	String goods_no = request.getParameter("goods_no");
	String sql = "select * from goods where goods_no=?";
	try {			
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, goods_no);
		rs = pstmt.executeQuery();
		if(rs.next()){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= rs.getString("goods_name") %> 상품 페이지</title>
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
	                    	<img class="card-img-top mb-5 mb-md-0" src="../<%=rs.getString("goods_image") %>" alt="..." /></div>
	                    <div class="col-md-6">
                   	        <input type="hidden" name="goods_no" value="<%=rs.getString("goods_no") %>"/>
                            <div class="small mb-1">상품번호 : <%=rs.getString("goods_no") %></div>
	                        <h1 class="display-5 fw-bolder"><%= rs.getString("goods_name") %></h1>
	                        <div class="fs-5 mb-5">
	                            <span><%=df.format(rs.getInt("goods_price")) %>원</span>
	                        </div>
	                        <div class="small mb-1"">
	                        	<p class="lead"><%=rs.getString("goods_content") %></p>
	                        </div>
         <%
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally{	
				try { if (rs != null) { rs.close(); } } catch (Exception e) { e.printStackTrace(); }
				try { if (pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
				try { if (conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); }
			}
		%>
	                        <div class="d-flex">
  	                            <input class="form-control text-center me-3" name="goods_quantity" type="num" min="1" value="1" style="max-width: 3rem" />
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