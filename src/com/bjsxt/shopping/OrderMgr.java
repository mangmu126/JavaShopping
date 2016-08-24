package com.bjsxt.shopping;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;

import com.bjsxt.shopping.dao.OrderMySQLDAO;
import com.bjsxt.shopping.util.DB;



public class OrderMgr {
	OrderMySQLDAO dao = null;
	private static OrderMgr om = null;
	static {
		if(om==null)
		{
			om = new OrderMgr();
			om.setDao(new OrderMySQLDAO());
		}
	}
	private OrderMgr(){}
	public static OrderMgr getInstance(){
		return om;
	}
	public OrderMySQLDAO getDao() {
		return dao;
	}
	public void setDao(OrderMySQLDAO dao) {
		this.dao = dao;
	}
	public void saveOrder(SalesOrder so)
	{
		dao.saveOrder(so);
	}
}
