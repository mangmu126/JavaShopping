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
<script language="javascript" src="script/TV20.js"></script>
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
		<script>
			addNode(-1,0,"���","images/top.gif");
			<%
			for(int i=0; i<categories.size(); i++) {
				Category c = categories.get(i);
				%>
				addNode(<%=c.getPid()%>,<%=c.getId()%>,"<%=c.getName()%>","images/top.gif");
				<%
				}
				%>
				showTV();
		</script>
		
	</table>
</body>
</html>