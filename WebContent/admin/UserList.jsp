<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
  <%@ include file="_sessioncheck.jsp"  %>
<%@ page import="java.sql.*,com.bjsxt.shopping.util.*,java.util.*" %>

<%
	List<User> users = User.getUsers();
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
				for(Iterator<User> it = users.iterator();it.hasNext();)
				{
					User u = it.next();
			%>
			<tr>
					<td><%=u.getId() %></td>
					<td><%=u.getUsername() %></td>
					<td><%=u.getAddr() %></td>
					<td><%=u.getPhone() %></td>
					<td><%=u.getRdate() %></td>
					<td><a href="userdelete.jsp?id=<%=u.getId() %>">ɾ��</a></td>
			</tr>
			<% } %>
		
		
	</table>
</body>
</html>