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
<p> <a href="goodslist.jsp">��ʾ��Ʒ</a></p>
 <p> <a href ="cart.jsp">�鿴���ﳵ</a></p>
   <p>  <a href="showMyOrder.jsp">�鿴����</a></p>
 <p>  <a href ="logout.jsp">ע��</a></p>
  <p>  <a href ="index.jsp">����</a></p>



<%}
else
{%>
<a href="index.jsp">δ��½</a>
<%} %>
    </div>
  </body>
</html>
