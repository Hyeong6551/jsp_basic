package com.company.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.company.dto.GoodsDto;
import com.company.dto.UsersDto;

public class UsersDao {
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/spring5fs?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
	private static final String USER = "root";
	private static final String PASS = "1234";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// db 연결
	public void dbConnection() {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL,USER,PASS);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// db 연결 끊기
	public void dbDisconnection() {
		try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	// 회원가입 (Create)
	public boolean insertUser(UsersDto users) {
		dbConnection();
		boolean success = false;
		try {
			String sql = "INSERT INTO users (user_name, user_id, user_password, user_address,user_postcode) "+
					"VALUES(?,?,?,?,?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, users.getUser_name());
			pstmt.setString(2, users.getUser_id());
			pstmt.setString(3, users.getUser_password());
			pstmt.setString(4, users.getUser_address());
			pstmt.setString(5, users.getUser_postcode());
			
			int result = pstmt.executeUpdate();
			if(result > 0) { success = true; }
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnection();
		}
		return success;
	}
	
	// 개별 회원 조회 (Read)
	public UsersDto selectUser(String user_id){
		dbConnection();
		UsersDto users = null;
		try {
			String sql = "SELECT * FROM users where user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				users = new UsersDto();
				users.setUser_id(rs.getString("user_id"));
				users.setUser_name(rs.getString("user_name"));
				users.setUser_password(rs.getString("user_password"));
				users.setUser_address(rs.getString("user_address"));
				users.setUser_postcode(rs.getString("user_postcode"));
				users.setUser_date(rs.getString("user_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbDisconnection();
		}
		return users;
	}
	
	// 정보 수정 (Update)
	public boolean updateUser(UsersDto users) {
		dbConnection();
		boolean success = false;
		try {
			String sql = "UPDATE users SET user_password=?, user_name=?, "
					+ "user_address=?, user_postcode=? WHERE user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, users.getUser_password());
			pstmt.setString(2, users.getUser_name());
			pstmt.setString(3, users.getUser_address());
			pstmt.setString(4, users.getUser_postcode());
			pstmt.setString(5, users.getUser_id());
			
			int result = pstmt.executeUpdate();
			if(result > 0) { success = true; }
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnection();
		}
		return success;
	}
	
	// 회원 탈퇴 (Delete)
	public Boolean deleteUser(String user_id) {
		dbConnection();
		Boolean success = false;
		try {
			String sql = "DELETE FROM users WHERE user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			int result = pstmt.executeUpdate();
			if(result > 0) {success = true;}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return success;
	}
}
