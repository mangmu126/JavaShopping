package com.bjsxt.shopping.util;

import java.util.ArrayList;
import java.util.List;

public class Category {
	private int id;
	private String name;
	private String descr;
	private int pid;
	private boolean leaf;
	private int grade;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public boolean isLeaf() {
		return leaf;
	}
	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public static void add(Category c)
	{
		CategoryDAO.save(c);
		
	}
	public static void addTopCategory(String name,String descr)
	{
		Category c = new Category();
		c.setId(-1);
		c.setName(name);
		c.setDescr(descr);
		c.setPid(0);
		c.setLeaf(true);
		c.setGrade(1);
		add(c);
	}
	public static List<Category> getCategories()
	{
		List<Category> list = new ArrayList<Category>();
		CategoryDAO.getCategories(list,0);
		return list;
	}
	public static void addChildCategory(int pid,String name,String descr){
		CategoryDAO.addChildCategory(pid,name,descr);
	}
	
}
