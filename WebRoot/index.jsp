<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript">
		function isValidate(form){
		  var username=form.username.value;
		  var userpass=form.userpass.value;
		  if(username.length==0){   //usname==""
		  	alert("请输入用户名！");
		  	return false;
		}
		  if(userpass.length==0){   //usname==""
		  	alert("请输入密码！");
		  	return false;
		}
			return true;
		}
	
	</script>
  </head>
  
  <body > 
  <div align="center">
    <form method="post" action="LoginServlet" name="form1" onsubmit="return isValidate(form1)">
    <p><br></p><p>账户登录！<br></p><p>用户名：<input type="text" name="username" value="shidun"></p>
    <p>密码： <input type="password" name="userpass"  value="123"></p>
    <p>&nbsp;<input type="submit" value="提交" name="submit">
    <input type="reset" value="重置" name="reset"></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
        <a href="reg.jsp">我要注册</a>
    
    <a href="c_manager.jsp">管理员</a>
    </form>
    
    </div>>
  </body>
</html>
