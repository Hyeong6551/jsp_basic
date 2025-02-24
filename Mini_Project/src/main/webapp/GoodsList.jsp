<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="dbConnection.jsp" />
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
<script>
// 상품 삭제 시 팝업창
function deleteGoods(goods_no) {
    if(confirm('정말로 이 상품을 삭제하시겠습니까?')) {
        location.href = 'GoodsDelete_Process.jsp?goods_no=' + goods_no;
    }
}
</script>
</head>
<body>
	<jsp:include page="Header.jsp" />
	<div class="container">
    <table border="1">
       <tr>
       	   <th>번호</th>
           <th>상품명</th>
           <th>가격</th>
           <th>설명</th>
           <th>삭제</th>
       </tr>
	<%
	Connection conn = (Connection)session.getAttribute("conn");
	PreparedStatement pstmt = null; ResultSet rs = null;
	String sql = "SELECT * FROM goods";
	try {		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
%>
		<tr>
			<td><%=rs.getString("goods_no") %></td>	
			<td><%=rs.getString("goods_name") %></td>	
			<td><%=rs.getInt("goods_price") %></td>
			<td><%=rs.getString("goods_content") %></td>
            <td>
                <a href="#" onclick="deleteGoods('<%=rs.getString("goods_no")%>')">삭제</a>
            </td>
		</tr>
<%	
		}
	} catch (Exception e){
		e.printStackTrace();
	} finally {
		try { if (rs != null) { rs.close(); } } catch (Exception e) { e.printStackTrace(); }
		try { if (pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
		try { if (conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); }
	}
%>
	</table>
		<div>
			<a href="GoodsCreateForm.jsp" class="btn btn-primary">상품 추가</a>
		</div>
	</div>
	<jsp:include page="Footer.jsp" />
</body>
</html>