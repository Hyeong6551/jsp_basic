package com.company.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.company.db.dbConnector;
import com.company.dto.CartDto;
import com.company.dto.GoodsDto;
import com.company.dto.OrderDto;
import com.company.dto.UsersDto;

public class CartOrderDao {
	private dbConnector db = new dbConnector();
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    
	// 장바구니 담기 (Create)
	public boolean insertCart(CartDto cart) {
		db.dbConnection();
		boolean success = false;
		try {
			String sql = "INSERT INTO cart (cart_user_id, cart_goods_no, cart_goods_quantity) "+
					"VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE cart_goods_quantity = cart_goods_quantity + VALUES(cart_goods_quantity)";
			pstmt = db.getConn().prepareStatement(sql);
			pstmt.setString(1, cart.getCart_user_id());
			pstmt.setInt(2, cart.getCart_goods_no());
			pstmt.setInt(3, cart.getCart_goods_quantity());
			
			int result = pstmt.executeUpdate();
			if(result > 0) { success = true; }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.dbDisconnection();
		}
		return success;
	}
	
	// 장바구니에서 꺼내온 상품 번호를 주문록목에 넗기 - 2. line 151
	public boolean insertOrder(String order_id, ArrayList<Integer> cart_no) {
		db.dbConnection();
		boolean success = false;
		Iterator<Integer> iter = cart_no.iterator();
		while(iter.hasNext()) {
			try {
			 	String sql = "INSERT INTO orderlist (order_user_id, order_goods_no, order_date) "+
						  "VALUES(?,?,now())";
				pstmt = db.getConn().prepareStatement(sql);
				pstmt.setString(1, order_id);
				pstmt.setInt(2, iter.next());
				
				int result = pstmt.executeUpdate();
				if(result > 0) { success=true; }
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return success;
	}
	
	// 모든 장바구니 조회
	public ArrayList<CartDto> selectAllCart(String user_id) {
		db.dbConnection();
		ArrayList<CartDto> list = new ArrayList<>();
		try {
			String sql = "select c.cart_no, c.cart_user_id ,c.cart_goods_no, "
					+ "c.cart_goods_quantity, g.goods_image,g.goods_name ,g.goods_price "
					+ "from goods g, cart c where g.goods_no=c.cart_goods_no and c.cart_user_id=?";
			pstmt = db.getConn().prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GoodsDto gdto = new GoodsDto(
						rs.getString("goods_image"),rs.getString("goods_name"),rs.getInt("goods_price"));
				CartDto cdto = new CartDto(
						rs.getInt("cart_no"),rs.getString("cart_user_id"), 
						rs.getInt("cart_goods_no"), rs.getInt("cart_goods_quantity"),gdto);
				list.add(cdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbDisconnection();
		}
		return list;
	}
	
	// 모든 주문목록 조회
	public ArrayList<OrderDto> selectAllOrder(String user_id) {
		db.dbConnection();
		ArrayList<OrderDto> list = new ArrayList<>();
		try {
			String sql = "select o.*, u.user_id, u.user_name, u.user_address, "
					+ "u.user_postcode, g.goods_name, g.goods_image, g.goods_price from orderlist o, users u,goods g where u.user_id= o.order_user_id and g.goods_no=o.order_goods_no and u.user_id=?";
			pstmt = db.getConn().prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GoodsDto gdto = new GoodsDto(
						rs.getString("goods_image"),rs.getString("goods_name"),rs.getInt("goods_price"));
				UsersDto udto = new UsersDto(
						rs.getString("user_id"),rs.getString("user_name"),rs.getString("user_address"),rs.getString("user_postcode"),gdto);
				OrderDto odto = new OrderDto(
						rs.getInt("order_no"),rs.getString("order_user_id"),rs.getInt("order_goods_no"),rs.getInt("order_goods_no"),rs.getString("order_date"),udto);
				list.add(odto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbDisconnection();
		}
		return list;
	}
	
	// 주문 상품 개별 조회 (Read)
	public OrderDto selectOrder(int order_no) {
		db.dbConnection();
		OrderDto order = null;
		try {
			String sql = "select o.*, u.user_id, u.user_name, u.user_address, "
					+ "u.user_postcode, g.goods_name, g.goods_image, g.goods_price from orderlist o, users u,goods g where u.user_id= o.order_user_id and g.goods_no=o.order_goods_no and o.order_no=?";
			pstmt = db.getConn().prepareStatement(sql);
			pstmt.setInt(1, order_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GoodsDto gdto = new GoodsDto(
						rs.getString("goods_image"),rs.getString("goods_name"),rs.getInt("goods_price"));
				UsersDto udto = new UsersDto(
						rs.getString("user_id"),rs.getString("user_name"),rs.getString("user_address"),rs.getString("user_postcode"),gdto);
				order = new OrderDto(
						rs.getInt("order_no"),rs.getString("order_user_id"),rs.getInt("order_goods_no"),rs.getInt("order_goods_no"),rs.getString("order_date"),udto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbDisconnection();
		}
		return order;
	}
	
	// 장바구니에 들어있는 상품 번호 꺼내오기 - 1. line 42
	public ArrayList<Integer> selectCartNo(String order_id) {
		db.dbConnection();
		ArrayList<Integer> list = new ArrayList<>();
		try {
			String sql = "select c.cart_goods_no, c.cart_goods_quantity from users u, cart c where c.cart_user_id = u.user_id and u.user_id=?";
			pstmt = db.getConn().prepareStatement(sql);
			pstmt.setString(1, order_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt("cart_goods_no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbDisconnection();
		}
		return list;
	}
	
	// 해당하는 장바구니 삭제 (Delete)
	public boolean deleteCart(int cart_no) {
		db.dbConnection();
		boolean success=false;
		try {
			String sql = "DELETE FROM cart WHERE cart_no=?";
			pstmt = db.getConn().prepareStatement(sql);
			pstmt.setInt(1, cart_no);
			
			int result = pstmt.executeUpdate();
			if(result > 0) { success=true; }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbDisconnection();
		}
		return success;
	}
	
	// 해당 유저의 모든 장바구니 삭제 - 3. end
	public boolean deleteAllCart(String order_id) {
		db.dbConnection();
		boolean success=false;
		try {
			String sql = "DELETE FROM cart WHERE cart_user_id=?";
			pstmt = db.getConn().prepareStatement(sql);
			pstmt.setString(1, order_id);
			int result = pstmt.executeUpdate();
			if(result > 0) { success=true; }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbDisconnection();
		}
		return success;
	}
}
