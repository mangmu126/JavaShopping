package com.bjsxt.shopping;




import java.sql.*;

import com.bjsxt.shopping.util.User;

public class SalesOrder {
	int id;
	User u;
	String addr;
	Timestamp oDate;
	Cart cart;
	int status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getU() {
		return u;
	}
	public void setU(User u) {
		this.u = u;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Timestamp getODate() {
		return oDate;
	}
	public void setODate(Timestamp date) {
		oDate = date;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public void save()
	{
		OrderMgr.getInstance().saveOrder(this);
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
