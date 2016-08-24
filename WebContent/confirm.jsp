<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>.
    <%@page import="java.util.Date,com.bjsxt.shopping.util.*,java.sql.*,com.bjsxt.shopping.*,java.util.*"%>
<%
	User u = (User)session.getAttribute("user");
	if(u==null)
	{
		out.println("您现在没有登陆，如果您确认购买，按市场价，注册是免费的");
	
		out.println("<a href='Login.jsp'>登陆</a>");
	}

	Cart cart = (Cart)session.getAttribute("cart");
	if(cart==null)
	{
		out.println("no product!");
		return;
	}
%>
<table>
	<tr>
		<td>商品Id</td>
		<td>商品名称</td>
		<td>商品价格(<%=(u==null)?"市场价":"会员价" %>)</td>
		<td>商品数量</td>	
	</tr>
	<%
		List<CartItem>items = cart.getItems();
		for(int i=0;i<items.size();i++)
		{
			CartItem ci = items.get(i);
			Product p = ProductMgr.getInstance().loadById(ci.getProductId());
	%>
		<tr>
			<td><%=ci.getProductId() %></td>
			<td><%=p.getName() %></td>
			<td><%=(u==null)?p.getNormalPrice():p.getMemberPrice() %></td>
			<td><%=ci.getCount()%></td>	
		</tr>
	<%} %>
	
</table>
共<%=Math.round(cart.getTotalPrice()*100)/100 %>元
	<%
		if(u!=null)
		{
			%>
				欢迎您：<%=u.getUsername() %> ，请确认您的收获信息<br>
			<% 
		}
	%>
	
	<form action="order.jsp" method="post">
		送货信息:<br/>
			<textarea name="addr"><%=(u==null)?"":u.getAddr() %></textarea>
			<input type="submit" value="下单"/>
		
	</form>
	

