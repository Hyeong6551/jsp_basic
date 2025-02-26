<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
<link rel="stylesheet" href="../css/logRg.css" type="text/css">
</head>
<body>
	<jsp:include page="../Header.jsp"/>
	<form action="LoginForm_Process.jsp" method="post">
		<div class="register-container my-5 py3">
			<div class="mb-3 mt-3">
			  <label for="id" class="form-label">아이디</label>
			  <input type="text" class="form-control" name="user_id">
			</div>
			<div class="mb-3">
			  <label for="pwd" class="form-label">비밀번호</label>
			  <input type="password" class="form-control" name="user_password">
			</div>
			<div class="d-flex" id="login">
			<button type="submit" class="btn btn-primary">로그인</button>
			</div>
		</div>
	</form>
	<jsp:include page="../Footer.jsp"/>
</body>
</html>