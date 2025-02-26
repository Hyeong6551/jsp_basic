package com.company.dto;

public class GoodsDto {
	int goods_no;
	String goods_image;
	String goods_name;
	int goods_price;
	String goods_content;
	
	public int getGoods_no() { return goods_no; } public void setGoods_no(int goods_no) { this.goods_no = goods_no; }
	public String getGoods_image() { return goods_image; } public void setGoods_image(String goods_image) { this.goods_image = goods_image; }
	public String getGoods_name() { return goods_name; } public void setGoods_name(String goods_name) { this.goods_name = goods_name; }
	public int getGoods_price() { return goods_price; } public void setGoods_price(int goods_price) { this.goods_price = goods_price; }
	public String getGoods_content() { return goods_content; } public void setGoods_content(String goods_content) { this.goods_content = goods_content; }
	
	public GoodsDto(int goods_no, String goods_image, String goods_name, int goods_price, String goods_content) {
		super();
		this.goods_no = goods_no;
		this.goods_image = goods_image;
		this.goods_name = goods_name;
		this.goods_price = goods_price;
		this.goods_content = goods_content;
	}
}
