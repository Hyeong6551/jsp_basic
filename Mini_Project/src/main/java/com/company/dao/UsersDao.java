package com.company.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.company.db.dbConnector;
import com.company.dto.UsersDto;

public class UsersDao {
	private dbConnector db = new dbConnector();
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

	// 회원가입 (Create)
	public boolean insertUser(UsersDto users) {
		db.dbConnection();
		boolean success = false;
		try {
			String sql = "INSERT INTO users (user_name, user_id, user_password, user_address,user_postcode) "+
					"VALUES(?,?,?,?,?);";
			pstmt = db.getConn().prepareStatement(sql);
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
			db.dbDisconnection();
		}
		return success;
	}
	
	// 개별 회원 조회 (Read)
	public UsersDto selectUser(String user_id){
		db.dbConnection();
		UsersDto users = null;
		try {
			String sql = "SELECT * FROM users where user_id=?";
			pstmt = db.getConn().prepareStatement(sql);
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
			db.dbDisconnection();
		}
		return users;
	}
	
	// 정보 수정 (Update)
	public boolean updateUser(UsersDto users) {
		db.dbConnection();
		boolean success = false;
		try {
			String sql = "UPDATE users SET user_password=?, user_name=?, "
					+ "user_address=?, user_postcode=? WHERE user_id=?";
			pstmt = db.getConn().prepareStatement(sql);
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
			db.dbDisconnection();
		}
		return success;
	}
	
	// 회원 탈퇴 (Delete)
	public Boolean deleteUser(String user_id) {
		db.dbConnection();
		Boolean success = false;
		try {
			String sql = "DELETE FROM users WHERE user_id=?";
			pstmt = db.getConn().prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			int result = pstmt.executeUpdate();
			if(result > 0) {success = true;}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbDisconnection();
		}
		return success;
	}
}
