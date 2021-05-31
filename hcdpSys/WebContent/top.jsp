<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<div class="whole" style="background:rgba(255,255,255,0.3);">
	<div class="welcome" style="background-color: gray; color: white; font-size: 15px; font-family: 仓耳章鱼小丸子体 W01">
		欢迎使用火车售票系统/@zy hx</div>
	<div class="menu">
		<c:if test="${empty userid}">
			<div class="menu-btn">
				<a href="InitLoginSvlt?sflag=0"><img
					src="<%=basePath%>images/custom-login-icon.png" width="100px" /></a>
				<div class="imformation">用户登录</div>
			</div>
			<a href="index.jsp"><div class="menu-btn">
					<img width="100px" src="<%=basePath%>images/search-train-icon.png" /></a>
			<div class="imformation">车次查询</div>
	</div>
	</c:if>
	<c:if test="${!empty userid}">

		<div class="menu-btn">
			<a target="mainf" href="CusCkSvlt"><img
				src="<%=basePath%>images/search-train-icon.png" width="100px" /></a>
			<div class="imformation">车次查询</div>
		</div>
		<div class="menu-btn">
			<a target="mainf" href="DpListSvlt"><img
				src="<%=basePath%>images/my-order-icon.png" width="100px" /></a>
			<div class="imformation">我的订单</div>
		</div>
		<div class="menu-btn">
			<a target="mainf" href="changePwd.jsp"><img
				src="<%=basePath%>images/setting-password-icon.png" width="100px" /></a>
			<div class="imformation">修改密码</div>
		</div>
		<div class="menu-btn">
			<a href="<%=basePath%>LogoutSvlt?flag=cus"><img
				src="<%=basePath%>images/exit-icon.png" width="100px" /></a>
			<div class="imformation">注销</div>
		</div>
	</c:if>
	<div class="menu-btn">
		<a href="<%=basePath%>admin/login.jsp" style="font-weight: bolder;"><img
			src="<%=basePath%>images/admin-login-icon.png" width="100px" /></a>
		<div class="imformation">管理员登录</div>
	</div>
</div>

</div>


