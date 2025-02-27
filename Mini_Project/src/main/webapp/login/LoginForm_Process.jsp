<%@page import="com.company.dao.UsersDao"%>
<%@page import="com.company.dto.UsersDto"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");
	String user_password = request.getParameter("user_password");

	UsersDao udao = new UsersDao();
	UsersDto users = udao.selectUser(user_id);	
	
	// 아이디 비밀번호 체크
	if(users == null){
		%>
        <script>
            alert("존재하지 않는 아이디입니다.");
            history.back();
        </script>
<%
	} else {
		String id_check=users.getUser_id(); 
		String password_check=users.getUser_password();
	
		if(user_password.equals(password_check)){
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_password", user_password);
%>
	        <script>
	            location.href = "../Index.jsp";
	        </script>
<%
		} else {
%>
	        <script>
	            alert("비밀번호가 일치하지 않습니다.");
	            location.href = "LoginForm.jsp";
	        </script>
<%
		}
	}

%>
