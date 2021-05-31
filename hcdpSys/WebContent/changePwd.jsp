<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>修改登录密码</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="<%=basePath%>css/forget/login.css"/>
<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css"/>
<link rel="stylesheet" href="<%=basePath%>css/forget/inputEffect.css" />
<link rel="stylesheet" href="<%=basePath%>css/forget/verifyCode.css" />
<link rel="stylesheet" href="<%=basePath%>css/season.css"/>

<style type="text/css">
html{width: 100%; height: 100%;}
#login #owl-login, #register #owl-login {
	width: 211px;
	height: 108px;
	background-image: url("<%=basePath%>images/forget/owl-login.png");
	position: absolute;
	top: -100px;
	left: 50%;
	margin-left: -111px;
}

@media all and (-webkit-min-device-pixel-ratio:1.5) , (
		min--moz-device-pixel-ratio :1.5) , ( -o-min-device-pixel-ratio
		:1.5/1) , ( min-device-pixel-ratio :1.5) , ( min-resolution :138dpi) ,
		( min-resolution :1.5dppx) {
	#login #owl-login, #register #owl-login {
		background-image: url("<%=basePath%>images/forget/owl-login@2x.png");
		-webkit-background-size: 211px 108px;
		-moz-background-size: 211px 108px;
		background-size: 211px 108px;
	}
}

#login #owl-login .arms .arm, #register #owl-login .arms .arm {
	width: 40px;
	height: 65px;
	position: absolute;
	left: 20px;
	top: 40px;
	background-image: url("<%=basePath%>images/forget/owl-login-arm.png");
	-webkit-transition: 0.3s ease-out;
	-moz-transition: 0.3s ease-out;
	-o-transition: 0.3s ease-out;
	-ms-transition: 0.3s ease-out;
	transition: 0.3s ease-out;
	-webkit-transform: rotate(-20deg);
	-moz-transform: rotate(-20deg);
	-o-transform: rotate(-20deg);
	-ms-transform: rotate(-20deg);
	transform: rotate(-20deg);
}

@media all and (-webkit-min-device-pixel-ratio:1.5) , (
		min--moz-device-pixel-ratio :1.5) , ( -o-min-device-pixel-ratio
		:1.5/1) , ( min-device-pixel-ratio :1.5) , ( min-resolution :138dpi) ,
		( min-resolution :1.5dppx) {
	#login #owl-login .arms .arm, #register #owl-login .arms .arm {
		background-image: url("<%=basePath%>images/forget/owl-login-arm@2x.png");
		-webkit-background-size: 40px 65px;
		-moz-background-size: 40px 65px;
		background-size: 40px 65px;
	}
}


#login .owl-signup .owl-arm, #register .owl-signup .owl-arm {
	background-image: url("<%=basePath%>images/forget/signup-arm.png");
	width: 92px;
	height: 103px;
	position: absolute;
	top: 78px;
	left: -75px;
	-webkit-transition: 0.3s ease-out;
	-moz-transition: 0.3s ease-out;
	-o-transition: 0.3s ease-out;
	-ms-transition: 0.3s ease-out;
	transition: 0.3s ease-out;
	-webkit-transform-origin: 100% 100%;
	-moz-transform-origin: 100% 100%;
	-o-transform-origin: 100% 100%;
	-ms-transform-origin: 100% 100%;
	transform-origin: 100% 100%;
}

@media all and (-webkit-min-device-pixel-ratio:1.5) , (
		min--moz-device-pixel-ratio :1.5) , ( -o-min-device-pixel-ratio
		:1.5/1) , ( min-device-pixel-ratio :1.5) , ( min-resolution :138dpi) ,
		( min-resolution :1.5dppx) {
	#login .owl-signup .owl-arm, #register .owl-signup .owl-arm {
		background-image: url("<%=basePath%>images/forget/signup-arm@2x.png");
		-webkit-background-size: 92px 103px;
		-moz-background-size: 92px 103px;
		background-size: 92px 103px;
	}
}

</style>

<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript">
	function tjbt() {
		var op = $("#login-username").val();
		var np = $("#login-password").val();
		var dnp = $("#login-verify-code").val();
		if (op == "") {
			alert("旧密码不为空。");
			return;
		}
		if (np == "") {
			alert("新密码不能为空。");
			return;
		}
		if (np != dnp) {
			alert("两次密码输入不一致。");
			return;
		}
		$.ajax({
			url : 'ChangePwd',
			type : 'post',
			data : {
				opwd : op,
				npwd : np
			},
			dataType : 'json',
			success : function(data) {
				alert(data.msg);
			}
		});
	}
</script>
</head>

<body style="background:rgba(255,255,255,0);">

<div class="containerS">
	<div class="season"></div>
	<div class="sun"></div>
	<div class="rainbow">
		<div class="rainbow-colour"></div>
		<div class="rainbow-colour"></div>
		<div class="rainbow-colour"></div>
		<div class="rainbow-colour"></div>
		<div class="rainbow-colour"></div>
		<div class="rainbow-colour"></div>
		<div class="rainbow-colour"></div>
	</div>
	<div class="cloud-group">
		<div class="cloud">
			<div class="weather-container">
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
			</div>
		</div>
		<div class="cloud">
			<div class="weather-container">
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
			</div>
		</div>
		<div class="cloud">
			<div class="weather-container">
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
			</div>
		</div>
		<div class="cloud">
			<div class="weather-container">
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
			</div>
		</div>
		<div class="cloud">
			<div class="weather-container">
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
			</div>
		</div>
		<div class="cloud">
			<div class="weather-container">
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
			</div>
		</div>
		<div class="cloud">
			<div class="weather-container">
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
			</div>
		</div>
		<div class="cloud">
			<div class="weather-container">
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="snow"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
				<div class="rain"></div>
			</div>
		</div>
	</div>
	<div class="base">
		<div class="bush-group">
			<div class="bush"></div>
			<div class="bush"></div>
			<div class="bush"></div>
			<div class="bush"></div>
			<div class="bush"></div>
			<div class="bush"></div>
			<div class="bush"></div>
			<div class="bush"></div>
			<div class="bush"></div>
		</div>
		<div class="rabbit animated">
			<div class="head">
				<div class="ear"></div>
				<div class="ear"></div>
			</div>
		</div>
		<div class="tree-group">
			<div class="tree">
				<div class="trunk"></div>
				<div class="tree-top"></div>
			</div>
			<div class="tree">
				<div class="trunk"></div>
				<div class="tree-top"></div>
			</div>
			<div class="tree">
				<div class="trunk"></div>
				<div class="tree-top"></div>
			</div>
			<div class="tree">
				<div class="trunk"></div>
				<div class="branch"></div>
				<div class="branch"></div>
				<div class="branch"></div>
				<div class="branch"></div>
				<div class="branch"></div>
				<div class="branch"></div>
				<div class="branch"></div>
				<div class="branch"></div>
				<div class="branch"></div>
				<div class="branch"></div>
				<div class="branch"></div>
				<div class="branch"></div>
			</div>
			<div class="tree">
				<div class="trunk"></div>
				<div class="tree-top"></div>
				<div class="tree-top"></div>
				<div class="branch-two">
					<div class="tree-top"></div>
				</div>
				<div class="branch-two">
					<div class="tree-top"></div>
				</div>
				<div class="branch-two">
					<div class="tree-top"></div>
				</div>
			</div>
			<div class="tree">
				<div class="trunk"></div>
				<div class="tree-top"></div>
			</div>
			<div class="tree">
				<div class="trunk"></div>
				<div class="tree-top"></div>
			</div>
			<div class="tree">
				<div class="trunk"></div>
				<div class="tree-top">
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
				</div>
				<div class="tree-top"></div>
				<div class="tree-top"></div>
				<div class="flower">
					<div class="flower-in"></div>
					<div class="petal"></div>
					<div class="petal"></div>
					<div class="petal"></div>
				</div>
				<div class="flower">
					<div class="flower-in"></div>
					<div class="petal"></div>
					<div class="petal"></div>
					<div class="petal"></div>
				</div>
			</div>
			<div class="tree">
				<div class="trunk"></div>
				<div class="tree-top"> </div>
			</div>
			<div class="tree">
				<div class="trunk"></div>
				<div class="branch">
					<div class="branch-in"></div>
					<div class="pine-cone-row">
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
					</div>
				</div>
				<div class="branch">
					<div class="branch-in"></div>
					<div class="pine-cone-row">
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
					</div>
				</div>
				<div class="branch">
					<div class="branch-in"></div>
					<div class="pine-cone-row">
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
					</div>
				</div>
				<div class="branch">
					<div class="branch-in"></div>
					<div class="pine-cone-row">
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
					</div>
				</div>
				<div class="branch">
					<div class="branch-in"></div>
					<div class="pine-cone-row">
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
					</div>
				</div>
				<div class="branch">
					<div class="branch-in"></div>
					<div class="pine-cone-row">
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
					</div>
				</div>
				<div class="branch">
					<div class="branch-in"></div>
					<div class="pine-cone-row">
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
					</div>
				</div>
				<div class="branch">
					<div class="branch-in"></div>
					<div class="pine-cone-row">
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
					</div>
				</div>
				<div class="branch">
					<div class="branch-in"></div>
					<div class="pine-cone-row">
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
					</div>
				</div>
				<div class="branch">
					<div class="branch-in"></div>
					<div class="pine-cone-row">
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
						<div class="pine-cone"></div>
					</div>
				</div>
			</div>
			<div class="tree">
				<div class="trunk"></div>
				<div class="tree-top"></div>
				<div class="tree-top"></div>
				<div class="tree-top"></div>
			</div>
			<div class="tree">
				<div class="trunk"> </div>
				<div class="tree-top">
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
				</div>
				<div class="tree-top"></div>
				<div class="tree-top"></div>
				<div class="flower">
					<div class="flower-in"></div>
					<div class="petal"></div>
					<div class="petal"></div>
					<div class="petal"></div>
				</div>
				<div class="flower">
					<div class="flower-in"></div>
					<div class="petal"></div>
					<div class="petal"></div>
					<div class="petal"></div>
				</div>
			</div>
			<div class="tree">
				<div class="trunk"></div>
				<div class="tree-top"> </div>
				<div class="tree-top"></div>
				<div class="tree-top"></div>
				<div class="branch-two">
					<div class="tree-top"></div>
				</div>
				<div class="branch-two">
					<div class="tree-top"></div>
				</div>
			</div>
			<div class="tree">
				<div class="trunk"></div>
				<div class="tree-top">
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
				</div>
				<div class="tree-top">
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
				</div>
				<div class="tree-top">
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
					<div class="cone"> </div>
				</div>
			</div>
			<div class="tree">
				<div class="trunk"></div>
				<div class="tree-top">
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
					<div class="cone">      </div>
				</div>
				<div class="tree-top">
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
					<div class="cone">       </div>
				</div>
				<div class="tree-top">
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
					<div class="cone"></div>
				</div>
			</div>
		</div>
	</div>
</div>


<div id="login">
		<input id="tab-1" type="radio" name="tab" class="sign-in hidden" checked />
		<input id="tab-2" type="radio" name="tab" class="sign-up hidden" />
		<input id="tab-3" type="radio" name="tab" class="sign-out hidden" />
		<div class="wrapper">
			<!-- 登录页面 -->
			<div class="login sign-in-htm">
				<form class="container offset1 loginform">
					<!-- 猫头鹰控件 -->
					<div id="owl-login" class="login-owl">
						<div class="hand"></div>
						<div class="hand hand-r"></div>
						<div class="arms">
							<div class="arm"></div>
							<div class="arm arm-r"></div>
						</div>
					</div>
					<div class="pad input-container">
						<section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="login-username" 
									autocomplete="off" placeholder="输入原密码" tabindex="1" maxlength="15" />
								<label class="input__label input__label--hideo" for="login-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="login-password" placeholder="请输入新密码" tabindex="2" maxlength="15"/>
								<label class="input__label input__label--hideo" for="login-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="login-verify-code" 
									autocomplete="off" placeholder="再次输入新密码" tabindex="3" maxlength="4" />								
								<label class="input__label input__label--hideo" for="login-verify-code">
									<i class="fa fa-fw fa-bell-o icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>								
							</span>
						</section>
					</div>
					<div class="form-actions">
						<input class="btn btn-primary" type="button" tabindex="3" onclick="tjbt();"  value="提    交" style="color:white; margin-right:135px;"/>
					</div>
				</form>
			</div>

		</div>
	</div>

 

<script src="<%=basePath%>js/season.js"></script>
</body>
</html>
