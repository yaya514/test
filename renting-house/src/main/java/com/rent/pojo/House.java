package com.rent.pojo;

import java.io.Serializable;

public class House implements Serializable {
	
	private int hid;			//房屋id
	private String name;	//房屋名称
	private String address; //房屋地址
	private String image;	//房屋图片
	private double price;	//房屋价格
	private String house_desc;	//房屋描述
	
	private String area;	//房屋面积
	private String huxing;	//房屋户型
	private int is_rent;	//房屋状态（0：未被租借，1：已被租借）
	
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	public String getHouse_desc() {
		return house_desc;
	}
	public void setHouse_desc(String house_desc) {
		this.house_desc = house_desc;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getHuxing() {
		return huxing;
	}
	public void setHuxing(String huxing) {
		this.huxing = huxing;
	}
	public int getIs_rent() {
		return is_rent;
	}
	public void setIs_rent(int is_rent) {
		this.is_rent = is_rent;
	}
	
	
}
