<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 쿠키 생성
Cookie cookie = new Cookie("userName","hyeong");
Cookie cookie2 = new Cookie("userAge","25");
// 쿠키 추가
response.addCookie(cookie);
response.addCookie(cookie2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Set Cookie</title>
</head>
<body>
<p>쿠키 확인 : <a href="GetCookie.jsp">여기</a>를 클릭하세요.</p>
</body>
</html>