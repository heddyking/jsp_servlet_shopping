<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import ="java.sql.*" %>
<%@ page import="bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
 
    
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
 <%
 DB db=new DB(); 
   String sql="delete from user where id="+request.getParameter("id");
Boolean i=db.executeUpdate(sql);
if(i){
	session.setAttribute("msg", "É¾³ý³É¹¦£¡");
}else{
	session.setAttribute("msg", "É¾³ýÊ§°Ü£¡");
}
response.sendRedirect("showUsers.jsp");%>
  </body>
</html>
