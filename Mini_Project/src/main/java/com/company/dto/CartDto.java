package com.company.dto;

public class CartDto {
	private int cart_no;
	private String cart_user_id;
	private int cart_goods_no;
	private int cart_goods_quantity;
	private GoodsDto goodsDto;

	public int getCart_no() { return cart_no; }   public void setCart_no(int cart_no) { this.cart_no = cart_no; }
	public String getCart_user_id() { return cart_user_id; }   public void setCart_user_id(String cart_user_id) { this.cart_user_id = cart_user_id; }
	public int getCart_goods_no() { return cart_goods_no; }   public void setCart_goods_no(int cart_goods_no) { this.cart_goods_no = cart_goods_no; }
	public int getCart_goods_quantity() { return cart_goods_quantity; }   public void setCart_goods_quantity(int cart_goods_quantity) { this.cart_goods_quantity = cart_goods_quantity; }
	public GoodsDto getGoodsDao() { return goodsDto; } public void setGoodsDto(GoodsDto goodsDto) { this.goodsDto = goodsDto; }
	
	public CartDto(int cart_no, String cart_user_id, int cart_goods_no, int cart_goods_quantity, GoodsDto goodsDto) {
		super();
		this.cart_no = cart_no;
		this.cart_user_id = cart_user_id;
		this.cart_goods_no = cart_goods_no;
		this.cart_goods_quantity = cart_goods_quantity;
		this.goodsDto = goodsDto;
	}
	
	public CartDto(int cart_goods_no, int cart_goods_quantity) {
		super();
		this.cart_goods_no = cart_goods_no;
		this.cart_goods_quantity = cart_goods_quantity;
	}
	
	public CartDto() {
		super();
	}
}
