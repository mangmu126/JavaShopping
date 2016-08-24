<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>.
    <%@page import="com.bjsxt.shopping.util.*,java.sql.*,com.bjsxt.shopping.*,java.util.*"%>
<%
	User u = (User)session.getAttribute("user");
	if(u==null)
	{
		u = new User();
		u.setId(-1);
	}

	Cart cart = (Cart)session.getAttribute("cart");
	if(cart==null)
	{
		out.println("no product!");
		return;
	}
%>
<%
	String addr = request.getParameter("addr");
	SalesOrder so = new SalesOrder();
	so.setAddr(addr);
	so.setCart(cart);
	so.setU(u);
	so.setODate(new Timestamp(System.currentTimeMillis()));
	so.setStatus(0);
	
	so.save();
	
	
	
	session.removeAttribute("cart");
%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<center>
	谢谢您在本站购物!欢迎继续！
</center>