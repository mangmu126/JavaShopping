<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
  <%@ include file="_sessioncheck.jsp"  %>
<%@ page import="java.sql.*,com.bjsxt.shopping.util.*,java.util.*,com.bjsxt.shopping.*" %>
<%!
	private static final int PAGE_SIZE = 3;
%>
<%
	String strPageNo = request.getParameter("pageno");
	int pageNo = 1;
	if(strPageNo!=null)
	{
		pageNo = Integer.parseInt(strPageNo);
	}
	
%>
<%
List<Product> categories = new ArrayList<Product>();
int pageCount= ProductMgr.getInstance().getProducts(categories,pageNo,PAGE_SIZE);
if(pageNo>=pageCount)
	pageNo = pageCount;
int upPage = pageNo<=1?1:pageNo-1;
int downPage = pageNo>=pageCount?pageCount:pageNo+1;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center">
		<tr>
		<td>
			ID
		</td>
		<td>
			�û���
		</td>
		<td>
			����
		</td>
		<td>
			��ͨ��Ǯ
		</td>
		<td>
			��Ա��Ǯ
		</td>
		<td>
			��Ŀ����
		</td>	
		<td>
			ʱ��
		</td>	
		
		<td>
			����
		</td>
		</tr>
		
			<%
				for(Iterator<Product> it = categories.iterator();it.hasNext();)
				{
					Product p = it.next();
					
			%>
			<tr>
					<td><%=p.getId() %></td>
					<td><%=p.getName() %></td>
					<td><%=p.getDescr() %></td>
					<td><%=p.getNormalPrice() %></td>
					<td><%=p.getMemberPrice() %></td>
					<td><%=p.getCategory().getName() %></td>
					<td><%=p.getPdate() %></td>
					<td><a href="productdelete.jsp?id=<%=p.getId() %>">ɾ��</a><a href="productmodify.jsp?id=<%=p.getId() %>">�޸�</a></td>
			</tr>
			<% } %>
		
		
	</table>
	<center>
		��<%=pageNo %>ҳ
		&nbsp;
		��<%=pageCount %>ҳ
		&nbsp;
		<a href="Productlist.jsp?pageno=<%=upPage %>">��һҳ</a>
		&nbsp;
		<a href="Productlist.jsp?pageno=<%=downPage %>">��һҳ</a>
		&nbsp;
		<a href="Productlist.jsp?pageno=<%=pageCount %>">���һҳ</a>
	</center>
	
</body>
</html>