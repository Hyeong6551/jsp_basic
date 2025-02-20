<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<%-- Header --%>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="index.jsp">Hyeong's shop</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="cartForm.jsp">장바구니</a></li>
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="orderForm.jsp">주문 목록</a></li>
                </ul>
                <form class="d-flex">
                    <a class="btn btn-outline-dark me-2"  href="loginForm.jsp">로그인</a>
                    <a class="btn btn-outline-dark me-2"  href="registerForm.jsp">회원가입</a>
                </form>
            </div>
        </div>
    </nav>
 <%-- Header end --%>
</body>
</html>