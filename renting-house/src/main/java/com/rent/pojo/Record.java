package com.rent.pojo;

import java.util.Date;

public class Record {
	
	private int rid;				//交易订单id	
	private String pname;			//交易人
	private String phone;			//交易人手机号
	private double money;			//交易人余额
	private double changeMoney;		//交易人余额变动情况（+代表充值，-代表房租）
	private String date;			//交易时间
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
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
	public double getChangeMoney() {
		return changeMoney;
	}
	public void setChangeMoney(double changeMoney) {
		this.changeMoney = changeMoney;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
