package com.bjsxt.shopping.dao;

import java.util.Date;
import java.util.List;

import com.bjsxt.shopping.Product;

public class ProductOracleDAO implements ProductDAO {

	@Override
	public boolean deleteProductByCategoryId(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteProductsById(int[] idArray) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Product> findProducts(int[] categoryId, String keyWord, double lowNormalPrice, double highNormalPrice,
			double lowMemberPrice, double highMemberPrice, Date startDate,
			Date endDate,int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> findProducts(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> getProducts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> getProducts(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateProduct(Product p) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addProduct(Product p) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getProducts(List<Product> proudcts, int pageNo,
			int pageSize) {
		// TODO Auto-generated method stub
		return 0;
	}

}
