package com.bjsxt.shopping.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;

import com.bjsxt.shopping.Product;
import com.bjsxt.shopping.util.Category;
import com.bjsxt.shopping.util.DB;

public interface ProductDAO {
	public List<Product>getProducts();
	public List<Product>getProducts(int pageNo,int pageSize);
	public List<Product>findProducts(int[] categoryId,
									 String keyWord,
									 double lowNormalPrice,
									 double highNormalPrice,
									 double lowMemberPrice,
									 double highMemberPrice,
									 Date startDate,
									 Date endDate,
									 int pageNo,
									 int pageSize);
	public List<Product>findProducts(String name);
	public boolean deleteProductByCategoryId(int id);
	public boolean deleteProductsById(int[] idArray);
	public boolean updateProduct(Product p);
	public boolean addProduct(Product p);
	public int getProducts(List<Product> proudcts, int pageNo,
			int pageSize);
	public Product loadById(int id);
}
