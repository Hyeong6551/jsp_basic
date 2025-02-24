<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:include page="dbConnection.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
	<div>
	<jsp:include page="Header.jsp" />
		<%
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
		<form action="Cart_Process.jsp">
	        <section class="py-5">
	            <div class="container px-4 px-lg-5 my-5">
	                <div class="row gx-4 gx-lg-5 align-items-center">
	                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="<%=rs.getString("goods_image") %>" alt="..." /></div>
	                    <div class="col-md-6">
                            <div class="small mb-1">상품번호 : <%=rs.getString("goods_no") %></div>
	                        <h1 class="display-5 fw-bolder"><%= rs.getString("goods_name") %></h1>
	                        <div class="fs-5 mb-5">
	                            <span><%=rs.getInt("goods_price") %></span>
	                        </div>
	                        <div style="width: 300px">
	                        	<p class="lead"><%=rs.getString("goods_content") %></p>
	                        </div>
	                        <div class="d-flex">
	                            <input class="form-control text-center me-3" name="goods_quantity" type="num" value="1" style="max-width: 3rem" />
	                            <input class="btn btn-outline-dark flex-shrink-0" type="submit" value="장바구니에 추가"/>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </section>
	        <input type="hidden" name="goods_no" value="<%=rs.getString("goods_no") %>"/>
        </form>
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
		<jsp:include page="Footer.jsp" />
	</div>
</body>
</html>