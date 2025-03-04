<%@page import="com.company.dto.UsersDto"%>
<%@page import="com.company.dao.UsersDao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../dbConnection.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 페이지</title>
<script>
	function deleteCheck(id) {
		if(confirm("정말 탈퇴하시겠습니까?")) {
			location.href = "userDelete_Process.jsp?user_id=" + id;
		}
	}
</script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
<%
	String user_id = (String)session.getAttribute("user_id");
	UsersDao udao = new UsersDao();
	UsersDto users = udao.selectUser(user_id);			
%>
	<%=users.getUser_name() %><br>
	<%=users.getUser_postcode() %><br>
	<%=users.getUser_address() %><br>
	<a href="userUpdateForm.jsp?user_id=<%=user_id %>" class="btn btn-primary mt-5">정보 수정</a>
	<a href="javascript:void(0)" onclick="deleteCheck('<%=user_id %>')" class="btn btn-primary mt-5">회원 탈퇴</a>
	<jsp:include page="../footer.jsp"/>
</body>
</html>
