<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.util.*,com.bjsxt.shopping.*,java.util.*" %>
 <%@ include file="_sessioncheck.jsp"  %>
<%
	String action = request.getParameter("action");
	
	String strCategoryId = request.getParameter("cid");
	int categoryId = 0;
	if(strCategoryId !=null&& !strCategoryId.trim().equals("")){
		categoryId = Integer.parseInt(request.getParameter("cid"));
	}
	if(action!=null && action.trim().equals("add"))
	{
		String name = request.getParameter("name");
		String descr = request.getParameter("descr");
		double normalPrice = Double.parseDouble(request.getParameter("normalPrice"));
		double memberPrice = Double.parseDouble(request.getParameter("memberPrice"));
		categoryId = Integer.parseInt(request.getParameter("categoryid"));
		
		Product p = new Product();
		p.setId(-1);
		p.setName(name);
		p.setDescr(descr);
		p.setNormalPrice(normalPrice);
		p.setMemberPrice(memberPrice);
		p.setPdate(new Timestamp(System.currentTimeMillis()));
		p.setCategoryId(categoryId);
		ProductMgr.getInstance().addProduct(p);
		
		out.println("Congratulation!Resgistered OK!");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.bjsxt.shopping.util.User"%>
<%@page import="com.bjsxt.shopping.Product"%>
<%@page import="java.sql.Timestamp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>添加分类</title>
</head>
<body>
	<tbody><tr><td class="nav" align="left" nowrap="nowrap" width="90%">&nbsp;金尚商城 &raquo; <br></td>
<td align="right" width="10%">&nbsp;<a href="#bottom"><img src="images/arrow_dw.gif" align="absmiddle" border="0"></a></td>        
</tr></tbody>
<form method="post" name="formAdd" action="Productadd.jsp" >
<input type="hidden" name="action" value="add"/>

<table class="tableborder" align="center" cellpadding="4" cellspacing="1" width="97%">
<tbody><tr>
<td colspan="2" class="header">产品添加 - 必填内容</td>
</tr>
<tr>
<td class="altbg1" width="21%">产品名称:</td>
<td class="altbg2"><input name="name" size="25" maxlength="25" type="text"> 
</tr>

<tr>
<td class="altbg1">市场价格:</td>
<td class="altbg2"><input name="normalPrice" size="25" type="text"></td>
</tr><tr>
<td class="altbg1">会员价格:</td>
<td class="altbg2"><input name="memberPrice" size="25" type="text"></td>
</tr>

<tr>
<td class="altbg1">所属类别</td>

<td class="altbg2">
	<select>
		<option value="0">所有类别</option>
		<%
			List<Category> categories = Category.getCategories();
			for(Iterator<Category> it=categories.iterator();it.hasNext();)
			{
				Category c = it.next();
				String preStr = "";
				for(int i = 1;i<c.getGrade();i++)
				{
					preStr +="---";
				}
		%>
			<option value="<%=c.getId()%>" <%=c.getId()==categoryId?"selected":"" %>><%=preStr+c.getName() %></option>
		<%
		}%>
	</select>
</td>

</tr>

<tr>
<td class="altbg1" valign="top">产品描述:</td>
<td class="altbg2"><textarea name="descr" cols="60" rows="5" id="descr"></textarea></td>
</tr>
</tbody></table>
<br>
<center><input name="regsubmit" value="提 &nbsp; 交" type="submit"></center>
</form>

</body>
</html>