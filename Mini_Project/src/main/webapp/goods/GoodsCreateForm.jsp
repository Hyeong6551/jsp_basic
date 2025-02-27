<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String loginCheck = (String) session.getAttribute("user_id");
	if(!("admin".equals(loginCheck))){
		%>
		<script>
			alert("사용 권한이 없습니다.")
			window.location.href = "${pageContext.request.contextPath}/Index.jsp"; 
		</script>
		<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가</title>
<style>
.goods-container {
    text-align: center;
    width: 600px;
    margin: 0 auto;
}
</style>
</head>
<body>
	<jsp:include page="../Header.jsp" /> 
	
	<form action="GoodsCreateForm_Process.jsp" method="post" enctype="multipart/form-data">
		<div class="goods-container my-4">
			<div class="mb-3 mt-3">
			  <label for="name" class="form-label">상품명</label>
			  <input type="text" class="form-control" name="goods_name">
			</div>
			<div class="mb-3">
			  <label for="price" class="form-label">가격</label>
			  <input type="text" class="form-control" name="goods_price" pattern="[0-9]*">
			</div>
			<div class="mb-3">
			  <label for="content" class="form-label">상품 설명</label>
			  <textarea class="form-control" name="goods_content" style="height: 200px; resize: none"></textarea>
			</div>
			<div class="mb-3">
				<label for="file" class="form-label">파일 업로드</label>
				<input type="file" class="form-control" name="goods_uploadFile" />
			</div>
			<button type="submit" class="btn btn-primary mt-5">상품추가</button>
		</div>
	</form>
	
	<jsp:include page="../Footer.jsp" />
</body>
</html>