package com.company.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.company.dto.GoodsDto;

public class GoodsDao {
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
	
	// 상품 생성 (Create)
	public boolean insertGoods(GoodsDto goods) {
		dbConnection();
		boolean success = false;
		try {
		    String sql = "INSERT INTO goods (goods_no,goods_image, goods_name, goods_price, goods_content)"+
		            " VALUES (NULL, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, goods.getGoods_image());
			pstmt.setString(2, goods.getGoods_name());
			pstmt.setInt(3, goods.getGoods_price());
			pstmt.setString(4, goods.getGoods_content());
			
			int result = pstmt.executeUpdate();
			if(result > 0) { success = true; }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnection();
		}
		return success;
	}
	
	// 상품 전체 조회
	public ArrayList<GoodsDto> selectAll() {
		dbConnection();
		ArrayList<GoodsDto> list = new ArrayList<>();
		try {
			String sql = "select * from goods";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GoodsDto dto = new GoodsDto(
						rs.getInt("goods_no"),rs.getString("goods_image"), 
						rs.getString("goods_name"), rs.getInt("goods_price"),rs.getString("goods_content"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbDisconnection();
		}
		return list;
	}
	
	// 상품 개별 조회 (Read)
	public GoodsDto selectGoods(int goods_no) {
		dbConnection();
		GoodsDto goods = null;
		try {
			String sql = "select * from goods where goods_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goods_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				goods = new GoodsDto();
				goods.setGoods_no(rs.getInt("goods_no"));
				goods.setGoods_image(rs.getString("goods_image"));
				goods.setGoods_name(rs.getString("goods_name"));
				goods.setGoods_price(rs.getInt("goods_price"));
				goods.setGoods_content(rs.getString("goods_content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbDisconnection();
		}
		return goods;
	}
	
	// 상품 삭제 (Delete)
	public boolean deleteGoods(int goods_no) {
		dbConnection();
		boolean success = false;
		try {
			String sql = "DELETE FROM goods WHERE goods_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goods_no);
			
			int result = pstmt.executeUpdate();
			if(result > 0) {success = true;}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnection();
		}
		return success;
	}
}
