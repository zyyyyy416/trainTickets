<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>登陆/注册</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/auth.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/top.css">
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery。ripples.js"></script>
<script type="text/javascript">

	function rgcheck() {
		var idcard = $("#rgidcard").val();
		var password = $("#rgpassword").val();
		var sname = $("#rgsname").val();
		if (idcard == "" || password == "" || sname == "") {
			alert("请输入完整的个人信息。");
			return false;
		}
		$.ajax({
			url : 'RegSvlt',
			type : 'post',
			data : {
				rgidcard : idcard,
				rgpassword : password,
				rgsname : sname
			},
			dataType : 'json',
			success : function(data) {
				alert(data.msg);
			}
		});
		return true;
	}

	function lgtj() {
		var name = $("#lguname").val();
		var password = $("#lgupassword").val();
		var vcode = $("#vcode").val();
		if (vcode == "" ) {
			alert("验证码不能为空。");
			return;
		}
		if (name == "" || password == "") {
			alert("账号和密码都不能为空。");
			return;
		}
		$.ajax({
			url : 'LoginSvlt',
			data : {
				uname : name,
				upassword : password,
				utype : 'cus',
				vcode : vcode
			},
			type : 'post',
			dataType : 'json',
			success : function(data) {
				if (data.msg == 1) {
					window.location.href = "index.jsp";
				} else {
					alert(data.msg);
				}
			}
		});
	}
	
	function tjbt(){
		var op=$("#cname").val();
		var idcard=$("#idcard").val();
		var np=$("#npwd").val();
		var dnp=$("#dnpwd").val();
		if(op==""){
			alert("真实姓名不为空。");
			return;
		}
		if(idcard==""){
			alert("身份证号不为空。");
			return;
		}
		if(np==""){
			alert("新密码不能为空。");
			return;
		}
		if(np!=dnp){
			alert("两次密码输入不一致。");
			return;
		}
		$.ajax({
			url:'FogetPswSvlt',
			type:'post',
			data:{cname:op,cidcard:idcard,np:np,dnp:dnp},
			dataType:'json',
			success:function(data){
				alert(data.msg);
			}
		});
	}
	
	$(function(){
		//点击图片切换验证码
		$("#vcodeImg").click(function(){
			this.src="CpachaServlet?method=loginCapcha&t="+new Date().getTime();
		});
		

		
		//设置复选框
		$(".skin-minimal input").iCheck({
			radioClass: 'iradio-blue',
			increaseArea: '25%'
		});
	})
	
	$(document).ready(function(){
		let  date=new Date();
		let  newdate=date.toLocaleString('chinese', { hour12: false });
		var str=newdate.split(':') ;
		var str2=str[0].split(' ');
		var hour=parseInt(str[1]);
		
		if(hour%4==0)
			{
			$("body").css("background-image","url(<%=basePath%>images/night-bg.jpg)");
			}
		else if(hour%4==1)
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
	<center>
		<div id="whole-main">
			<div id="mountain">
				<img id="train" src="<%=basePath%>images/login-top.png">
			</div>
			<div id="space"></div>
			<div class="lowin">
				<div class="lowin-brand">
					<img src="<%=basePath%>images/kodinger.jpg" alt="logo">
				</div>
				<div class="lowin-wrapper">
					<div class="lowin-box lowin-login">
						<div class="lowin-box-inner">
							<form>
								<p>现在登录</p>
								<div class="lowin-group">
								<label>账号</label>
									 <input
										type="text" id="lguname" class="lowin-input"
										placeholder="此处请输入身份证号" />
								</div>
								<div class="lowin-group password-group">
									<label>密码 <a href="#" class="forgot-link">忘记密码?</a></label> <input
										type="password" id="lgupassword"
										autocomplete="current-password" class="lowin-input">
								</div>
								
								<input type="button" value="登陆" class="lowin-btn login-btn"
									onclick="lgtj()" />

								<div class="text-foot">
									没有账号? <a href="" class="register-link">马上注册</a>
								</div>
							</form>
						</div>
					</div>

					<div class="lowin-box lowin-register">
						<div class="lowin-box-inner">
							<form>
								<p>注册账号</p>
								<div class="lowin-group">
									<label>真实姓名</label> <input type="text" id="rgsname"
										autocomplete="name" class="lowin-input">
								</div>
								<div class="lowin-group">
									<label>账号</label> <input type="text" id="rgidcard"
										class="lowin-input" placeholder="此处请输入身份证号" />
								</div>
								<div class="lowin-group">
									<label>密码</label> <input type="password" id="rgpassword"
										autocomplete="current-password" class="lowin-input">
								</div>
								<input type="button" value="注册" class="lowin-btn"
									onclick="rgcheck()" />

								<div class="text-foot">
									已经有账号? <a href="" class="login-link">马上登陆</a>
								</div>
							</form>
						</div>
					</div>
					
					<div class="lowin-box lowin-remember">
						<div class="lowin-box-inner">
							<form>
								<p>忘记密码</p>
								<div class="lowin-group">
									<label>账号 </label> <input
										type="text" class="lowin-input"
										placeholder="此处请输入身份证号" id="idcard"/>
								</div>
								<div class="lowin-group">
									<label>真实性名<a href="#" class="login-back-link" >登陆?</a> </label> 
									<input type="text" autocomplete="current-password" class="lowin-input" id="cname">
								</div>
								<div class="lowin-group">
									<label>新密码</label> <input
										type="password"
										autocomplete="current-password" class="lowin-input" id="npwd">
								</div>
								<div class="lowin-group" id="varicode" >
									<label>重复密码 </label> 
									<input type="text" autocomplete="current-password" class="lowin-input" id="dnpwd">
								</div>
								
								<input type="button" value="提交" class="lowin-btn login-btn"
									onclick="tjbt()" />

								<div class="text-foot">
									下次要记牢密码哦！
								</div>
                            </form>
						</div>
					</div>
				</div>

				<jsp:include page="/top.jsp"></jsp:include>

				<footer class="lowin-footer"> Design By @itskodinger. More
				Templates <a href="http://www.cssmoban.com/" target="_blank"
					title="模板之家">模板之家</a> - Collect from <a
					href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
				</footer>
			</div>

			<script src="<%=basePath%>js/auth.js"></script>
			<script>
			Auth.init({
				login_url : '#login',
				forgot_url : '#forgot'
			});
		</script>
		</div>
	</center>
</body>
</html>