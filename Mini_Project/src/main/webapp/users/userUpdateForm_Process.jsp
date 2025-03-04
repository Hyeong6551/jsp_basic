<%@page import="com.company.dao.UsersDao"%>
<%@page import="com.company.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	String user_id = request.getParameter("user_id");
	String user_name = request.getParameter("user_name");
	String user_password = request.getParameter("user_password");
	String user_address = request.getParameter("user_address");
	String detailAddress = request.getParameter("detailAddress");
	String extraAddress = request.getParameter("extraAddress");
	String user_postcode = request.getParameter("user_postcode");
	
	user_address = user_address + " " + detailAddress;
	
	UsersDto users = new UsersDto();
	users.setUser_id(user_id);
	users.setUser_name(user_name);
	users.setUser_password(user_password);
	users.setUser_address(user_address);
	users.setUser_postcode(user_postcode);
	
	UsersDao udao = new UsersDao();
	boolean success = udao.updateUser(users);
	
	if(success){
%>
	<script>
	    alert("회원님의 정보가 수정되었습니다.");
	    location.href = "userForm.jsp";
	</script>
<%
	} else{
%>
	<script>
	    alert("정보 수정 실패");
	    history.back();
	</script>
<%
}
%>