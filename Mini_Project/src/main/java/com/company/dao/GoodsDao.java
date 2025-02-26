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
	
	public void dbConnection() {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL,USER,PASS);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<GoodsDto> selectAll() {
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
			if(rs != null) { try { rs.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if(pstmt != null) { try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if(conn != null) { try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } }
		}
		return list;
	}
	
//	public ArrayList<GoodsDto> selectGoods(int goods_no) {
//		ArrayList<GoodsDto> list = new ArrayList<>();
//		try {
//			String sql = "select * from goods where goods_no=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, goods_no);
//			rs = pstmt.executeQuery();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			if(rs != null) { try { rs.close(); } catch (SQLException e) { e.printStackTrace(); } }
//			if(pstmt != null) { try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
//			if(conn != null) { try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } }
//		}
//		return list;
//	}
}
