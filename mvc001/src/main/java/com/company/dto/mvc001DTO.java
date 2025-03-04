package com.company.dto;

public class mvc001DTO {
	private String username;
	private int age;
	
	public mvc001DTO() {
		super();
	}
	
	public mvc001DTO(String username, int age) {
		super();
		this.username = username;
		this.age = age;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}

}
