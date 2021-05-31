<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>火车订票系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/topa.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/top.css">
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript">
	function test() {
		ek.updateElement();
		var com = $("#tst").val();
		alert(com);
	}
	
	$(document).ready(function(){
		let  date=new Date();
		let  newdate=date.toLocaleString('chinese', { hour12: false });
		var str=newdate.split(':') ;
		var str2=str[0].split(' ');
		var hour=parseInt(str[1]);

		if(hour%3==0)
			{
			$("body").css("background-image","url(<%=basePath%>images/night-bg.jpg)");
			}
		else if(hour%3==1)
			{
			$("body").css("background-image","url(<%=basePath%>images/moring-bg.jpg)");
			}
		else if(hour%4==2)
		   {
			$("body").css("background-image","url(<%=basePath%>images/guangxi-bg.jpg)");
			}
		else
			{
			$("body").css("background-image","url(<%=basePath%>images/blue-bg.jpg)");
			}
		
})
</script>
</head>
<body style="background-image:url(<%=basePath%>images/moring-bg.jpg);">
<div style="background:rgba(255,255,255,0.3);">
  <center>

    			<iframe id="mainf" name="mainf" src="CusCkSvlt" frameborder="0" style="margin: 0;padding: 0;width: 100%;height:100%; min-width: 600px;min-height: 500px;"></iframe>
    			
    			
    			<jsp:include page="/top.jsp"></jsp:include>
  </center>
  </div>
  </body>
</html>
