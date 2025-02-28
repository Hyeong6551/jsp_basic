package com.company.dto;

public class OrderDto {
	private int order_no; 
	private String order_user_id;
	private int order_goods_no;
	private int order_quantity;
	private String order_date;
	private UsersDto usersDto;
	
	public int getOrder_no() { return order_no; } public void setOrder_no(int order_no) { this.order_no = order_no; }
	public String getOrder_user_id() { return order_user_id; } public void setOrder_user_id(String order_user_id) { this.order_user_id = order_user_id; } 
	public int getOrder_goods_no() { return order_goods_no; } public void setOrder_goods_no(int order_goods_no) { this.order_goods_no = order_goods_no; }
	public String getOrder_date() { return order_date; } public void setOrder_date(String order_date) { this.order_date = order_date; }
	public UsersDto getUsersDto() { return usersDto; } public void setUsersDto(UsersDto usersDto) { this.usersDto = usersDto; }
	public int getOrder_quantity() { return order_quantity; } public void setOrder_quantity(int order_quantity) { this.order_quantity = order_quantity; }
	
	public OrderDto(int order_no, String order_user_id, int order_goods_no,int order_quantity, String order_date, UsersDto usersDto) {
		super();
		this.order_no = order_no;
		this.order_user_id = order_user_id;
		this.order_goods_no = order_goods_no;
		this.order_quantity = order_quantity; 
		this.order_date = order_date;
		this.usersDto = usersDto;
	}
	
	public OrderDto() { super(); }
}
