<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page import="java.util.Date,com.bjsxt.shopping.util.*,java.sql.*,com.bjsxt.shopping.*"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Product p = ProductMgr.getInstance().loadById(id);
%>   
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.Timestamp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>修改信息</title>

</head>
<body>
	<center>产品展示</center>
	<img height=90 alt=<%=p.getName()%> src="images/2005829123549194.gif"/>
	<br/>
	<%=p.getName() %><br/><br/>
	<%=p.getDescr() %><br/><br/>
	<%=p.getNormalPrice() %><br/><br/>
	<%=p.getMemberPrice() %><br/><br/>
	<a href="buy.jsp?id=<%=id %>">加入购物车</a>
</body>
</html>