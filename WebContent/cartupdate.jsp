<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>.
    <%@page import="java.util.Date,com.bjsxt.shopping.util.*,java.sql.*,com.bjsxt.shopping.*,java.util.*"%>
<%
	Cart cart = (Cart)session.getAttribute("cart");
	if(cart==null)
	{
		out.println("no product!");
		return;
	}
	
	List<CartItem> items = cart.getItems();
	for(int i=0;i<items.size();i++)
	{
		CartItem ci = items.get(i);
		String strCount = request.getParameter("p"+ci.getProductId());
		if(strCount !=null && !strCount.trim().equals(""))
		{
			ci.setCount(Integer.parseInt(strCount));
		}
	}
	
%>
<center>ÐÞ¸Ä³É¹¦</center>
<div id="num"></div>
<script>
	var leftTime = 5000;
	function go()
	{
		document.getElementById("num").innerText = leftTime;
		leftTime -= 1000;
		if(leftTime <=0)
		{
			document.location.href ="cart.jsp";
		}
		
	}
	
	setInterval(go,1000);
</script>