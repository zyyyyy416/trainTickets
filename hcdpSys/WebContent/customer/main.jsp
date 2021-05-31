<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>车票信息查询</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/cstype.css">
<link href="<%=basePath%>css/jquery.ui.core.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/jquery.ui.datepicker.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/jquery.ui.theme.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/btn-2.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/pure.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/mytable.css">
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.ui.core.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.ui.datepicker.js"></script>
<script type="text/javascript"
	src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="<%=basePath%>js/vector.js"></script>
<script type="text/javascript">
	//查询
	function hpbt(id, flgs) {
		<c:if test="${empty userid}">
		alert("请登录.");
		</c:if>
		<c:if test="${not empty userid}">
		$.ajax({
			url : 'HandlePiaoSvlt',
			type : 'post',
			data : {
				"idi" : id,
				"flgs" : flgs
			},
			dataType : 'json',
			success : function(data) {
				alert(data.msg);
				if (data.dt == 1) {
					window.location.href = "DpListSvlt";
				} else if (data.dt == 2) {//改签
					window.location.href = "CusCkSvlt";
				} else {
				}
			}
		});
		</c:if>
	}
	window.onload = function() {
		$("#con").css("height", $(document).height() - 185);
	}

	$(function() {
		// 初始化 传入dom id
		var victor = new Victor("container", "output");
		var theme = [ [ "#002c4a", "#005584" ], [ "#35ac03", "#3f4303" ],
				[ "#ac0908", "#cd5726" ], [ "#18bbff", "#00486b" ] ]
		$(".color li").each(function(index, val) {
			var color = theme[index];
			$(this).mouseover(function() {
				victor(color).set();
			})
		});
	});
</script>

</head>

<body>

<div id="container"><div id="output"></div></div>

	<div id="title-info">订票信息列表</div>

	<div id="nrdiv">
		<table border="0" cellpadding="0" cellspacing="0" class="mytable">
			<tr>
				<td colspan="11" align="center"></td>
			</tr>
			<c:if test="${not empty alist}">
				<tr bgcolor="#4a4a4a">
					<!-- 
	    									<td width="50px"  style="color:white;">ID</td>
	    									 -->
					<th width="80px" style="color: white;" class="one">车次</th>
					<th width="80px" style="color: white;" class="two">火车类型</th>
					<th width="80px" style="color: white;" class="one">始发站</th>
					<th width="80px" style="color: white;" class="two">终点站</th>
					<th width="80px" style="color: white;" class="one">发车时间</th>
					<th width="60px" style="color: white;" class="two">票价</th>
					<th width="90px" style="color: white;" class="one">车厢座号</th>
					<th width="80px" style="color: white;" class="two">车票类型</th>
					<th width="80px" style="color: white;" class="one">有效时间</th>
					<th width="60px" style="color: white;" class="two">状态</th>
					<th width="52px"style="color: white;">操作</th>
				</tr>
			</c:if>
			<!-- 
    								 -->
			<c:forEach var="a" items="${alist}">
				<tr>
					<!-- 
    										<td width="50px"  >${a.id }</td>
    										 -->
					<td width="80px" class="oned">${a.tname }</td>
					<td width="80px" class="twod">${a.traintype }</td>
					<td width="80px" class="oned">${a.szdname}</td>
					<td width="80px" class="twod">${a.ezdname }</td>
					<td width="80px" class="oned">${a.stime }</td>
					<td width="60px" class="twod">${a.pval }</td>
					<td width="90px" class="oned">${a.cxzh }</td>
					<td width="80px" class="twod">${a.ptype }</td>
					<td width="80px" class="oned">${a.yxsj }</td>
					<td width="60px" class="twod">${a.lyflag }</td>
					<td width="52px"><c:if test="${a.lyflag eq '待付款'}">
							<input type="button" class="search_btn2" value="付款"
								onclick="hpbt('${a.id}','fk');"
								onmouseover="this.style.backgroundColor='red';"
								onmouseout="this.style.backgroundColor='';" />
							<input type="button" class="search_btn2" value="退票"
								onclick="hpbt('${a.id}','tp');"
								onmouseover="this.style.backgroundColor='red';"
								onmouseout="this.style.backgroundColor='';" />
						</c:if> <c:if test="${a.lyflag eq '已付款'}">
							<input type="button" class="search_btn2" value="领票"
								onclick="hpbt('${a.id}','lp');"
								onmouseover="this.style.backgroundColor='red';"
								onmouseout="this.style.backgroundColor='';" />
							<input type="button" class="search_btn2" value="改签"
								onclick="hpbt('${a.id}','gq');"
								onmouseover="this.style.backgroundColor='red';"
								onmouseout="this.style.backgroundColor='';" />
							<input type="button" class="search_btn2" value="退票"
								onclick="hpbt('${a.id}','tp');"
								onmouseover="this.style.backgroundColor='red';"
								onmouseout="this.style.backgroundColor='';" />
						</c:if> <c:if test="${a.lyflag eq '已领票'}">
						</c:if></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div style="display: none;">
		<form id="ckf" action="CusCkSvlt" method="post">
			<input type="hidden" id="sql" name="sql" value="" /> <input
				type="hidden" id="flgs" name="flgs" value="1" />
		</form>
	</div>

</body>
</html>