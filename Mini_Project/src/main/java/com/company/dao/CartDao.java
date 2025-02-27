package com.company.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.company.dto.CartDto;
import com.company.dto.GoodsDto;

public class CartDao {
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
	
	// 장바구니 담기 (Create)
	public boolean insertCart(CartDto cart) {
		dbConnection();
		boolean success = false;
		try {
			String sql = "INSERT INTO cart (cart_user_id, cart_goods_no, cart_goods_quantity) "+
					"VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE cart_goods_quantity = cart_goods_quantity + VALUES(cart_goods_quantity)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cart.getCart_user_id());
			pstmt.setInt(2, cart.getCart_goods_no());
			pstmt.setInt(3, cart.getCart_goods_quantity());
			
			int result = pstmt.executeUpdate();
			if(result > 0) { success = true; }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnection();
		}
		return success;
	}
	
	// 모든 장바구니 조회
	public ArrayList<CartDto> selectAll() {
		dbConnection();
		ArrayList<CartDto> list = new ArrayList<>();
		try {
			String sql = "select * from goods";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CartDto dto = new CartDto(
						rs.getInt("cart_no"),rs.getString("goods_image"), 
						rs.getInt("cart_goods_no"), rs.getInt("cart_goods_quantity"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbDisconnection();
		}
		return list;
	}
	
	// 장바구니 삭제 (Delete)
}
