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
%>
<center>您一共购买了这么多商品:</center>
<form action="cartupdate.jsp" method="post">
<table>
	<tr>
		<td>商品Id</td>
		<td>商品名称</td>
		<td>商品价格</td>
		<td>商品数量</td>	
	</tr>
	<%
		List<CartItem>items = cart.getItems();
		for(int i=0;i<items.size();i++)
		{
			CartItem ci = items.get(i);
	%>
		<tr>
			<td><%=ci.getProductId() %></td>
			<td><%=ProductMgr.getInstance().loadById(ci.getProductId()).getName() %></td>
			<td><%=ci.getPrice() %></td>
			<td><input type=text size=4 name="<%="p"+ci.getProductId() %>"value=<%=ci.getCount() %>></td>	
		</tr>
	<%} %>
	
</table>
共<%=Math.round(cart.getTotalPrice()*100)/100 %>元
<input type="submit" value="修改数量"/>
<input type="button" value="确认订单" onclick="document.location.href='confirm.jsp'"/>
</form>