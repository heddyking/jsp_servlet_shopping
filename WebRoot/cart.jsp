<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cart.jsp' starting page</title>
    
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
  <a href="goodslist.jsp">继续购物</a>
  <table border=1>
  <tr>
     <td>物品编号</td>
     <td>物品名称</td>
     <td>价格</td>
     <td>数量</td>
     <td>操作</td>
  </tr>
  <c:forEach var="item" items="${cart}">
  <tr>
    <form action="ProcessCart">
    <input type="hidden" name="cid" value="${item.goods.cid}"/>
    <td>${item.goods.cid}</td>
    <td>${ item.goods.cname}</td>
    <td>${item.goods.cprice }</td>
    <td><input type="text" name="quantity" value="${ item.quantity}"/></td>
    <td><input type="submit"  name="action" value="修改" ></td>
    <td><input type="submit"  name="action" value="删除" > </td>

    </form>
</tr>
</c:forEach>
  </table>  
  <p></p>
    <p></p>
	<label style="font-size:18px;color:red;font-weight:bold;font-style:italic">总价：</label><label>${total}</label>
	<p></p>
    <p></p>
     <a href="buyinfo.jsp">付款</a> 
       <a href ="userinfo.jsp">返回</a>
      </div>
  </body>
</html>





  
