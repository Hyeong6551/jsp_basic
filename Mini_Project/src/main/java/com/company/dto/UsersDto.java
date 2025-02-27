package com.company.dto;

public class UsersDto {
	String user_id;
	String user_name;
	String user_password;
	String user_address;
	String user_postcode;
	String user_date;
	
	public String getUser_id() { return user_id; } public void setUser_id(String user_id) { this.user_id = user_id; }
	public String getUser_name() { return user_name; } public void setUser_name(String user_name) { this.user_name = user_name; }
	public String getUser_password() { return user_password; } public void setUser_password(String user_password) { this.user_password = user_password; }
	public String getUser_address() { return user_address; } public void setUser_address(String user_address) { this.user_address = user_address; }
	public String getUser_postcode() { return user_postcode; } public void setUser_postcode(String user_postcode) { this.user_postcode = user_postcode; }
	public String getUser_date() { return user_date; } public void setUser_date(String user_date) { this.user_date = user_date; }
	
	public UsersDto(String user_id, String user_name, String user_password, String user_address, String user_postcode,
			String user_date) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_password = user_password;
		this.user_address = user_address;
		this.user_postcode = user_postcode;
		this.user_date = user_date;
	}
	
	public UsersDto() {
		super();
	}
}
