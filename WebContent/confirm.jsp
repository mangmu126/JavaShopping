<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>.
    <%@page import="java.util.Date,com.bjsxt.shopping.util.*,java.sql.*,com.bjsxt.shopping.*,java.util.*"%>
<%
	User u = (User)session.getAttribute("user");
	if(u==null)
	{
		out.println("������û�е�½�������ȷ�Ϲ��򣬰��г��ۣ�ע������ѵ�");
	
		out.println("<a href='Login.jsp'>��½</a>");
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
		<td>��ƷId</td>
		<td>��Ʒ����</td>
		<td>��Ʒ�۸�(<%=(u==null)?"�г���":"��Ա��" %>)</td>
		<td>��Ʒ����</td>	
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
��<%=Math.round(cart.getTotalPrice()*100)/100 %>Ԫ
	<%
		if(u!=null)
		{
			%>
				��ӭ����<%=u.getUsername() %> ����ȷ�������ջ���Ϣ<br>
			<% 
		}
	%>
	
	<form action="order.jsp" method="post">
		�ͻ���Ϣ:<br/>
			<textarea name="addr"><%=(u==null)?"":u.getAddr() %></textarea>
			<input type="submit" value="�µ�"/>
		
	</form>
	

