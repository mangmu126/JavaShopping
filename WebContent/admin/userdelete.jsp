<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.util.*" %>
 <%@ include file="_sessioncheck.jsp"  %>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	User.deleteUser(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.bjsxt.shopping.util.User"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
ɾ���ɹ�!

</body>
</html>