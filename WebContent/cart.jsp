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
<center>��һ����������ô����Ʒ:</center>
<form action="cartupdate.jsp" method="post">
<table>
	<tr>
		<td>��ƷId</td>
		<td>��Ʒ����</td>
		<td>��Ʒ�۸�</td>
		<td>��Ʒ����</td>	
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
��<%=Math.round(cart.getTotalPrice()*100)/100 %>Ԫ
<input type="submit" value="�޸�����"/>
<input type="button" value="ȷ�϶���" onclick="document.location.href='confirm.jsp'"/>
</form>