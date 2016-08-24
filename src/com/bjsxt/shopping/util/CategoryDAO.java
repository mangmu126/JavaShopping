package com.bjsxt.shopping.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class CategoryDAO {
	public static void save(Category c)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = DB.getConn();
			String sql =null;
			if(c.getId()==-1){
				sql = "insert into category values (null,?,?,?,?,?)";
			}else
			{
				sql = "insert into category values ("+c.getId()+",?,?,?,?,?)";
			}
			pstmt = DB.preStmt(conn, sql);
			pstmt.setInt(1,c.getPid());
			pstmt.setString(2,c.getName());
			pstmt.setString(3,c.getDescr());
			pstmt.setInt(4,c.isLeaf()?0:1);
			pstmt.setInt(5,c.getGrade());
			pstmt.executeUpdate();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally{
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	public  static void getCategories(List<Category> list,int id)
	{	
		Connection conn = null;
		try{
			conn = DB.getConn();
			getCategories(conn,list,id);
		}finally{
			DB.close(conn);
		}
	}
	
	public  static void getCategories(Connection conn,List<Category> list,int id)
	{	
		ResultSet rs = null;
		try{
			String sql ="select * from category where pid = "+id;
			rs = DB.executeQuery(conn, sql);
			while(rs.next())
			{
				Category c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setPid(rs.getInt("pid"));
				c.setLeaf(rs.getInt("cno")==0?true:false);
				c.setGrade(rs.getInt("grade"));
				list.add(c);
				if(!c.isLeaf())
				{
					getCategories(list,c.getId());
				}
				
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally{
			DB.close(rs);
		}
	}
	public static void addChildCategory(int pid,String name,String descr) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		try{
			conn = DB.getConn();
			
			conn.setAutoCommit(false);
			rs = DB.executeQuery(conn, "select * from category where id = "+pid);
			int parentGrade = 0;
			if(rs.next())
				parentGrade = rs.getInt("grade");
			// 存储新的category
			String sql = "insert into category values(null,?,?,?,?,?)";
			
			pstmt = DB.preStmt(conn, sql);
			pstmt.setInt(1,pid);
			pstmt.setString(2,name);
			pstmt.setString(3,descr);
			pstmt.setInt(4,0);
			pstmt.setInt(5,parentGrade+1);
			pstmt.executeUpdate();
			
			// 更新父节点
			stmt = DB.getStatement(conn);
			if(pid!=0)
				DB.executeUpdate(stmt,"update category set cno = 1 where id ="+pid);
			
			conn.commit();
			conn.setAutoCommit(true);
		}catch(SQLException e)
		{
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			DB.close(rs);
			DB.close(stmt);
			DB.close(pstmt);
			DB.close(conn);
		}
		
	}
	public static Category loadById(int id) {
	
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Category c = null;
		try{
			conn = DB.getConn();
			rs = DB.executeQuery(conn, "select * from category where id ="+id);
			if(rs.next())
			{
				 c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setPid(rs.getInt("pid"));
				c.setLeaf(rs.getInt("cno")==0?true:false);
				c.setGrade(rs.getInt("grade"));
			}
		}catch(SQLException e)
		{
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return c;
	}
	
}
