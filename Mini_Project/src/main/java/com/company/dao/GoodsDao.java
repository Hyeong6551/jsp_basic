package com.company.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.company.db.dbConnector;
import com.company.dto.GoodsDto;

public class GoodsDao {
	private dbConnector db = new dbConnector();
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 상품 생성 (Create)
	public boolean insertGoods(GoodsDto goods) {
		db.dbConnection();
		boolean success = false;
		try {
		    String sql = "INSERT INTO goods (goods_no,goods_image, goods_name, goods_price, goods_content)"+
		            " VALUES (NULL, ?, ?, ?, ?)";
			pstmt = db.getConn().prepareStatement(sql);
			pstmt.setString(1, goods.getGoods_image());
			pstmt.setString(2, goods.getGoods_name());
			pstmt.setInt(3, goods.getGoods_price());
			pstmt.setString(4, goods.getGoods_content());
			
			int result = pstmt.executeUpdate();
			if(result > 0) { success = true; }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.dbDisconnection();
		}
		return success;
	}
	
	// 상품 전체 조회
	public ArrayList<GoodsDto> selectAll() {
		db.dbConnection();
		ArrayList<GoodsDto> list = new ArrayList<>();
		try {
			String sql = "select * from goods";
			pstmt = db.getConn().prepareStatement(sql);
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
			db.dbDisconnection();
		}
		return list;
	}
	
	// 상품 개별 조회 (Read)
	public GoodsDto selectGoods(int goods_no) {
		db.dbConnection();
		GoodsDto goods = null;
		try {
			String sql = "select * from goods where goods_no=?";
			pstmt = db.getConn().prepareStatement(sql);
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
			db.dbDisconnection();
		}
		return goods;
	}
	
	// 상품 삭제 (Delete)
	public boolean deleteGoods(int goods_no) {
		db.dbConnection();
		boolean success = false;
		try {
			String sql = "DELETE FROM goods WHERE goods_no=?";
			pstmt = db.getConn().prepareStatement(sql);
			pstmt.setInt(1, goods_no);
			
			int result = pstmt.executeUpdate();
			if(result > 0) {success = true;}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.dbDisconnection();
		}
		return success;
	}
}