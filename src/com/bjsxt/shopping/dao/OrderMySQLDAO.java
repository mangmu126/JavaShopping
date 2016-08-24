package com.bjsxt.shopping.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import com.bjsxt.shopping.Cart;
import com.bjsxt.shopping.CartItem;
import com.bjsxt.shopping.SalesOrder;

import com.bjsxt.shopping.util.DB;


public class OrderMySQLDAO{

	public void saveOrder(SalesOrder so) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsKey = null;
		try{
			conn = DB.getConn();
			conn.setAutoCommit(false);
			String sql="insert into salesorder values (null,?,?,?,?)";
			pstmt = DB.preStmt(conn, sql,true);
			pstmt.setInt(1, so.getU().getId());
			pstmt.setString(2, so.getAddr());
			pstmt.setTimestamp(3, so.getODate());
			pstmt.setInt(4, so.getStatus());
			pstmt.executeUpdate();
			rsKey = pstmt.getGeneratedKeys();
			rsKey.next();
			int Key = rsKey.getInt(1);
			
			
			String sqlItem = "insert into salesitem values(null,?,?,?,?)";
			pstmt = DB.preStmt(conn, sqlItem);
			Cart c = so.getCart();
			List<CartItem> items = c.getItems();
			for(int i=0;i<items.size();i++)
			{
				CartItem ci = items.get(i);
				pstmt.setInt(1,ci.getProductId());
				pstmt.setDouble(2,ci.getPrice());
				pstmt.setInt(3,ci.getCount());
				pstmt.setInt(4, Key);
				pstmt.addBatch();
			}
			pstmt.executeBatch();
			conn.commit();
			conn.setAutoCommit(true);
		}catch(SQLException e)
		{
			e.printStackTrace();
			try {
				conn.rollback();
				conn.setAutoCommit(true);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			DB.close(pstmt);
			DB.close(conn);
		}
		
	}
	
	
}
