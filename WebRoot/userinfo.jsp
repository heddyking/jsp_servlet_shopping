<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <div align="center">
  <%if(session.getAttribute("username")!=null){ %>
  <p></p>
  <p></p>
  <p></p>
<p> <a href="goodslist.jsp">显示商品</a></p>
 <p> <a href ="cart.jsp">查看购物车</a></p>
   <p>  <a href="showMyOrder.jsp">查看订单</a></p>
 <p>  <a href ="logout.jsp">注销</a></p>
  <p>  <a href ="index.jsp">返回</a></p>



<%}
else
{%>
<a href="index.jsp">未登陆</a>
<%} %>
    </div>
  </body>
</html>
