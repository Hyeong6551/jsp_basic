<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get Cookie</title>
</head>
<body>
<h2>쿠키 정보 확인</h2>
<% 
	Cookie[] cookies = request.getCookies();

	if(cookies != null){
		for(Cookie cookie : cookies){
			%>
			<p>쿠키 이름 : <%=cookie.getName() %></p>
			<p>쿠키 값 : <%=cookie.getValue() %></p>
			<%
		}
	} else {
		%>
		<p>저장된 쿠키가 없습니다.</p>
		<%
	}
%>
<p><a href="SetCookie.jsp">쿠키 생성 페이지로 이동</a></p>
</body>
</html>