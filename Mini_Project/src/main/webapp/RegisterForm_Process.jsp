<%@ page import="java.sql.*" %>
<jsp:include page="dbConnection.jsp" />
<%  
	String user_name = request.getParameter("user_name");
	String user_id = request.getParameter("user_id");
	String user_password = request.getParameter("user_password");
	String user_address = request.getParameter("address");
	String detailAddress = request.getParameter("detailAddress");
	String extraAddress = request.getParameter("extraAddress");
	String user_postcode = request.getParameter("postcode");
	
	user_address = user_address + " " + detailAddress;
	
	Connection conn = (Connection)session.getAttribute("conn");		
	PreparedStatement pstmt = null;
	
	if(user_name != null && user_id != null && user_password !=null && user_address != null){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/spring5fs";
			conn = DriverManager.getConnection(url,"root","1234");
			String sql = "insert into users (user_name, user_id, user_password, user_address,user_postcode) "+
					"values(?,?,?,?,?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_name);
			pstmt.setString(2, user_id);
			pstmt.setString(3, user_password);
			pstmt.setString(4, user_address);
			pstmt.setString(5, user_postcode);
			pstmt.executeUpdate();
			response.sendRedirect("RegisterForm_Result.jsp");
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			try{ if(pstmt != null){ pstmt.close();} }catch(Exception e){e.printStackTrace();}
			try{ if(conn != null){ conn.close();} }catch(Exception e){e.printStackTrace();}
		}
	} else {
		response.sendRedirect("RegisterForm.jsp");
	}
%>