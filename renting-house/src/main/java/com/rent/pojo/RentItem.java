package com.rent.pojo;

import java.io.Serializable;

public class RentItem implements Serializable{
	
	private int hid;	  		//租房订单id
	private String pname;  	//用户名字
	private String phone;	//用户手机号
	private double money;	//用户余额
	private String name;	//房源名字
	private double price;	//房源价格
	private int is_rent;	//房源状态
	
	private String image; 	//房源图片
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getIs_rent() {
		return is_rent;
	}
	public void setIs_rent(int is_rent) {
		this.is_rent = is_rent;
	}
	
	
	
}
