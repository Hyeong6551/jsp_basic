<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../login/loginCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 성공 페이지</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container my-5 d-flex flex-column align-items-center text-center">
	<h2><%=session.getAttribute("user_id") %>님의 상품 주문이 완료되었습니다</h2>
		<div class="container d-flex justify-content-center my-4 gap-5">
			 <a class="btn btn-outline-dark flex-shrink-0" href="orderList.jsp">주문목록으로 이동</a>
			 <a class="btn btn-outline-dark flex-shrink-0" href="../index.jsp">홈 화면으로 이동</a>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>