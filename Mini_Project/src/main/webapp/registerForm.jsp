<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/logRg.css" type="text/css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<form action="registerForm_success.jsp">
		<div class="register-container my-4">
			<div class="mb-3 mt-3">
			  <label for="id" class="form-label">아이디</label>
			  <input type="text" class="form-control" name="user_id">
			</div>
			<div class="mb-3">
			  <label for="pwd" class="form-label">비밀번호</label>
			  <input type="password" class="form-control" name="user_password">
			</div>
			<div class="mb-3">
			  <label for="address" class="form-label">주소</label>
			  <input type="text" class="form-control" name="address">
			</div>
			<div class="mb-3">
			  <label for="name" class="form-label">이름</label>
			  <input type="text" class="form-control" name="user_name">
			</div>
			<div class="mb-3">
			  <label for="name" class="form-label">생년월일</label>
			  <input type="date" class="form-control" name="birth" max="9999-12-31">
			</div>
			<div class="form-check mb-3">
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>
	</form>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>