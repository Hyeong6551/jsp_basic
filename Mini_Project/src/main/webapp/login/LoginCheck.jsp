<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String loginCheck = (String) session.getAttribute("user_id");
	if(loginCheck == null){
		%>
		<script>
			alert("로그인을 해주세요")
			window.location.href = "${pageContext.request.contextPath}/login/LoginForm.jsp"; 
		</script>
		<%
	}
%>