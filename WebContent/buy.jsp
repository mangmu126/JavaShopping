<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page import="java.util.Date,com.bjsxt.shopping.util.*,java.sql.*,com.bjsxt.shopping.*"%>
<%
	Cart cart = (Cart)session.getAttribute("cart");
	if(cart == null)
	{
		cart = new Cart();
		session.setAttribute("cart",cart);
	}
	
	
	int id = Integer.parseInt(request.getParameter("id"));
	CartItem c1 = new CartItem();
	Product p = ProductMgr.getInstance().loadById(id);
	c1.setProductId(id);
	c1.setCount(1);
	c1.setPrice(p.getNormalPrice());
	cart.add(c1);
	
	response.sendRedirect("cart.jsp");
%>   
