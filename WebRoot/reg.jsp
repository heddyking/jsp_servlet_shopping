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
    <form method="post" action="RegServlet" name="form1" onsubmit="return isValidate(form1)">
    <p><br></p><p>用户注册></p><p>用户名：<input type="text" name="username" ></p>
    <p>密码： <input type="password" name="userpass"></p>
    <p>性别:&nbsp&nbsp&nbsp&nbsp&nbsp<input name="gender" type="radio" value="男"/>男&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp<input name="gender" type="radio" value="女"/>女</p>
   <p>出生日期：
   <input type="text" name="birthdate"/></p>
    <p>籍贯
   <select name="nativeplace" id="province" >
   <option value="浙江"  selected="selected">浙江</option>
          <option value="江苏" selected="selected">江苏</option>
          <option value="安徽" selected="selected">安徽</option>
          <option value="北京" selected="selected">北京</option>
          <option value="上海" selected="selected">上海</option></select></p>
    <p>&nbsp;<input type="submit" value="提交" name="submit">
    <input type="reset" value="重置" name="reset"></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
    </form>
   
      <a href ="showUsers.jsp">查看用户</a>
      <%if(session.getAttribute("reg_error")!=null){
      out.println(session.getAttribute("reg_error")); 
      session.setAttribute("reg_error",null);
      }%>
      <p><a href="index.jsp">返回首页</a></p>
    </div>
  </body>
</html>
