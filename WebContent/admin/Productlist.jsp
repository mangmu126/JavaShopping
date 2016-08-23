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
			用户名
		</td>
		<td>
			描述
		</td>
		<td>
			普通价钱
		</td>
		<td>
			会员价钱
		</td>
		<td>
			栏目名称
		</td>	
		<td>
			时间
		</td>	
		
		<td>
			操作
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
					<td><a href="productdelete.jsp?id=<%=p.getId() %>">删除</a><a href="productmodify.jsp?id=<%=p.getId() %>">修改</a></td>
			</tr>
			<% } %>
		
		
	</table>
	<center>
		第<%=pageNo %>页
		&nbsp;
		共<%=pageCount %>页
		&nbsp;
		<a href="Productlist.jsp?pageno=<%=upPage %>">上一页</a>
		&nbsp;
		<a href="Productlist.jsp?pageno=<%=downPage %>">下一页</a>
		&nbsp;
		<a href="Productlist.jsp?pageno=<%=pageCount %>">最后一页</a>
	</center>
	
</body>
</html>