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
		  var receivename=form.receivename.value;
		  var tele=form.tele.value;
		  if(receivename.length==0){   //usname==""
		  	alert("请输入收货人姓名！");
		  	return false;
		}
		  if(tele.length==0){   //usname==""
		  	alert("请填写号码！");
		  	return false;
		}
			return true;
		}
	
	</script>
  </head>
  
  <body > 
  <div align="center">
    <form method="post" action="BuyServlet" name="form3" onsubmit="return isValidate(form3)">
    <p>收货人姓名：
   <input type="text" name="receivename"/></p>        
   <p>电话号码：
   <input type="text" name="tele"/></p>
   <p>地址：
   <input type="text" name="address"/></p>
   <p>邮编：
   <input type="text" name="zipcode"/></p>
   <p>付款方式：
    <select name="paymode" id="pay" >
   <option value="支付宝"  selected="selected">支付宝</option>
          <option value="银联" selected="selected">银联</option>
          <option value="农业银行" selected="selected">农业银行</option>
          <option value="建设银行" selected="selected">建设银行</option>
          <option value="中国银行" selected="selected">中国银行</option></select></p>
 <input name="submit" type="submit" id="submit" value="提交" onclick="javascript:validate(form1)" />
        <input name="reset" type="reset" id="reset" value="重置" />
 <p><a href="cart.jsp">返回</a></p>
    </form>
    
    </div>>
  </body>
</html>
