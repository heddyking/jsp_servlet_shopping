<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="bean.DB" %>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showGoods.jsp' starting page</title>
    
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
    if(session.getAttribute("username")!=null)
    {
        DB db=new DB();
        String sql="select*from goods";
        ResultSet rs=db.executeQuery(sql);
        if(session.getAttribute("msg")!=null)
        {
            out.println(session.getAttribute("msg"));
            session.setAttribute("msg",null);
        } 
  %>
        <h1 align="center">商品显示</h1>
        <hr color="green">
        <table width="1000" border="1" align="center" style="color:firebrick">
          <tr bgcolor="silver">
            <th align="center">序号</th>
            <th align="center">商品名</th>
            <th align="center">价格</th>
            <th align="center">数量</th>
            <th align="center">图片</th>
            <th align="center">操作</th>
          </tr>
        <% 
          int i=1;
          while(rs.next())
          {
              String modifyurl="modifyGoods.jsp?cid="+rs.getString(1);
              String deleteurl="deleteGoods.jsp?cid="+rs.getString(1);
        %>
          <tr>
            <td align="center"><%=i%></td>
            <td align="center"><%=rs.getString(2)%></td>
            <td align="center"><%=rs.getString(3)%></td>
            <td align="center"><%=rs.getString(4)%></td>
            <td align="center"><img src="<%=rs.getString(6)%>"/></td>
            <td align="center"><a href="<%=modifyurl%>"></a>
                               <a href="<%=deleteurl%>">删除</a></td>
          </tr>
        <%
          i++;
          }
        %>
        </table>
        <a href="c_manager.jsp">返回</a>
  <%    
    }
    else
    {
  %>
        <h1>错误提示</h1>
        <hr color="green"/>
        <br>
                     您还未登录，请<a href="index.jsp">回首页</a>登录
  <%
    }
  %>
  </body>
</html>
