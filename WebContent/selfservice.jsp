<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page import="java.util.Date,com.bjsxt.shopping.util.*,java.sql.*"%>
<%
	User u = (User)session.getAttribute("user");
	if(u == null)
	{
		out.println("You havn't logged in!");
		return ;
	}
%>   
<%
	String action = request.getParameter("action");
	if(action !=null && action.trim().equals("modify"))
	{
		String username =  request.getParameter("username");
		String phone = request.getParameter("phone");
		int id = Integer.parseInt(request.getParameter("id"));
		String addr = request.getParameter("addr");
		User user = new User();
		user.setUsername(username);
		user.setAddr(addr);
		user.setPhone(phone);
		user.setId(id);
		user.setRdate(new Timestamp(System.currentTimeMillis()));
		user.update();
		
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.Timestamp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>修改信息</title>

</head>
<body>
	<form method="post" name="register" action="selfservice.jsp" >
	<input type="hidden" name="action" value="modify"/>
	<input type="hidden" name="id" value="<%=u.getId()%>"/>
	<table class="tableborder" align="center" cellpadding="4" cellspacing="1" width="97%">
	<tbody>
	<tr>
	<td class="altbg1" width="21%">用户名:</td>
	<td class="altbg2"><input id="userid" name="username" size="25" maxlength="25" type="text" value="<%=u.getUsername()%>"> 
	<span id="usermsg"></span>
	</tr>
	
	<tr>
	<td class="altbg1">手机号:</td>
	<td class="altbg2"><input name="phone" type="text" id="phone" size="25" value="<%=u.getPhone()%>"></td>
	</tr>
	
	<tr>
	<td class="altbg1" valign="top">送货地址:</td>
	<td class="altbg2"><textarea name="addr" cols="60" rows="5" id="addr" value="<%=u.getAddr()%>"></textarea></td>
	</tr>
	</tbody></table>
	<br>
	<center><input name="regsubmit" value="提 &nbsp; 交" type="submit"></center>
	</form>

</body>
</html>