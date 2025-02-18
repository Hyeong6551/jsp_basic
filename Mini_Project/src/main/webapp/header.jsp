<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.container {
	background: skyblue;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<%-- Header --%>
	<div class="container my5 p-4"> 
		<a href="index.jsp"><header>Hyeong's shop</header></a>
		<div class="LogRgForm">
			<a href="loginForm.jsp">
				<input type="button" value="로그인" class="btn btn-primary" />
			</a>
			<a href="registerForm.jsp">
				<input type="button" value="회원가입" class="btn btn-danger" />
			</a>
		</div>
	</div> <%-- Header end --%>
</body>
</html>