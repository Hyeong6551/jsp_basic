<%@page import="java.text.DecimalFormat"%>
<%@page import="com.company.dto.GoodsDto"%>
<%@page import="com.company.dao.GoodsDao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String loginCheck = (String) session.getAttribute("user_id");
	if(!("admin".equals(loginCheck))){
		%>
		<script>
			alert("사용 권한이 없습니다.")
			window.location.href = "${pageContext.request.contextPath}/index.jsp"; 
		</script>
		<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리 페이지</title>
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
        location.href = 'goodsDelete_Process.jsp?goods_no=' + goods_no;
    }
}
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container my-5">
    <table border="1">
       <tr>
       	   <th>번호</th>
           <th>상품명</th>
           <th>가격</th>
           <th>설명</th>
           <th>삭제</th>
       </tr>
<%
	DecimalFormat df = new DecimalFormat("###,###");

	GoodsDao gdao = new GoodsDao();
	for(GoodsDto goods : gdao.selectAll()){
%>
		<tr>
			<td><%=goods.getGoods_no() %></td>	
			<td><%=goods.getGoods_name() %></td>	
			<td><%=df.format(goods.getGoods_price()) %> 원</td>
			<td><%=goods.getGoods_content()%></td>
            <td>
                <a href="#" onclick="deleteGoods('<%=goods.getGoods_no() %>')">삭제</a>
            </td>
		</tr>
<%	
	}
%>
	</table>
	<a href="goodsCreateForm.jsp" class="btn btn-primary mt-4">상품 추가</a>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>