<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
  <%@ include file="_sessioncheck.jsp"  %>
<%@ page import="java.sql.*,com.bjsxt.shopping.util.*,java.util.*" %>

<%
	List<Category> categories = Category.getCategories();
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
			�绰
		</td>
		<td>
			��ַ
		</td>
		<td>
			ע��ʱ��
		</td>	
		<td>
			����
		</td>	
		</tr>
		
			<%
				for(Iterator<Category> it = categories.iterator();it.hasNext();)
				{
					Category c = it.next();
					String preStr ="";
					for(int i=1;i<c.getGrade();i++){
						 preStr += "------";
					}
			%>
			<tr>
					<td><%=c.getId() %></td>
					<td><%=c.getName() %></td>
					<td><%=c.getPid() %></td>
					<td><%=c.getGrade() %></td>
					<td><a href="Categoryadd.jsp?pid=<%=c.getId() %>">����ӽڵ�</a></td>
			</tr>
			<% } %>
		
		
	</table>
</body>
</html>