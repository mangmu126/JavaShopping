package com.bjsxt.shopping;

import java.util.Date;
import java.util.List;

import com.bjsxt.shopping.dao.ProductDAO;
import com.bjsxt.shopping.dao.ProductMySQLDAO;



public class ProductMgr {
	ProductDAO dao = null;
	private static ProductMgr pm = null;
	static {
		if(pm==null)
		{
			pm = new ProductMgr();
			pm.setDao(new ProductMySQLDAO());
		}
	}
	private ProductMgr(){}
	public static ProductMgr getInstance(){
		return pm;
	}
	public List<Product>getProducts()
	{
		return dao.getProducts();
	}
	public List<Product>getProducts(int pageNo,int pageSize)
	{
		return dao.getProducts(pageNo,pageSize);
		
	}
	public int getProducts(List<Product> proudcts,int pageNo,int pageSize)
	{
		return dao.getProducts(proudcts,pageNo,pageSize);
		
	}
	public List<Product>findProducts(int[] categoryId,
									 String keyWord,
									 double lowNormalPrice,
									 double highNormalPrice,
									 double lowMemberPrice,
									 double highMemberPrice,
									 Date startDate,
									 Date endDate,
									 int pageNo,
									 int pageSize){
		return dao.findProducts(categoryId, keyWord, lowNormalPrice, highNormalPrice, lowMemberPrice, highMemberPrice, startDate, endDate, pageNo, pageSize);
	}
	public List<Product>findProducts(String name){
		return null;
	}
	public boolean deleteProductByCategoryId(int id)
	{
		return false;
	}
	public boolean deleteProductsById(int[] idArray)
	{
		return false;
	}
	public boolean updateProduct(Product p)
	{
		return false;
	}
	public ProductDAO getDao() {
		return dao;
	}
	public void setDao(ProductDAO dao) {
		this.dao = dao;
	}
	public boolean addProduct(Product p)
	{
		return  dao.addProduct(p);
	}
}
