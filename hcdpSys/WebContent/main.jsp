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

<link rel="stylesheet" type="text/css" href="fly.css">
<script type="text/javascript" src="https://cdn.bootcss.com/paper.js/0.9.24/paper-full.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=basePath%>css/input/set2.css">

<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
<link href="<%=basePath%>css/jquery.ui.core.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/mytable.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.ui.core.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="<%=basePath%>js/classie.js"></script>
<script type="text/javascript">
	//查询
	function cktj() {
		var saddr = $("#cksaddr").val();
		var eaddr = $("#ckeaddr").val();
		var yxsj = $("#ckyxsj").val();
		if (saddr == "" || eaddr == "" || yxsj == "") {
			alert("请输入正确的查询信息");
			return;
		}
		//当前时间
		var ndate = new Date();
		var sj = yxsj.replace(/\./g, "/");
		//用户所选时间
		var cdate = new Date(sj);
		if (ndate > cdate) {
			$("#ckyxsj").val("");
			alert("请选择正确的时间");
			return;
		}
		var sqls = "select tmp.*,zdname as eaddr,tname,traintype from (select piao.*,zdname as saddr from piao,zhandian where piao.szdid=zhandian.id and yxsj='"
				+ yxsj
				+ "' and zdname like '%"
				+ saddr
				+ "%') tmp,zhandian,traininfo where tmp.tid=traininfo.id and tmp.ezdid=zhandian.id and zdname like '%"
				+ eaddr + "%'";
		$("#sql").val(sqls);
		$("#ckf").submit();
	}
	function dpbt(pid) {
		if (pid == "" || pid == null) {
			return;
		}
		<c:if test="${empty userid}">
		alert("请登录.");
		</c:if>
		<c:if test="${not empty userid}">
		$.ajax({
			type : 'post',
			url : 'DpSvlt',
			data : {
				"pid" : pid
			},
			dataType : 'json',
			success : function(data) {
				if (data.msg == 1) {
					alert("订票成功。");
					window.location.href = "CusCkSvlt";
				} else {
					alert(data.msg);
				}
			}
		});
		</c:if>
	}
	window.onload = function() {
		$("#con").css("height", $(document).height() - 185);
	}
	/***
	 **/
	$(function() {
		$("#ckyxsj").datepicker();
	});
</script>

<script type="text/javascript">
		paper.install(window);
		var SQRT_3 = Math.pow(3, 0.5);
		var triangle, D, mousePos, position;
		var count = 50;

		window.onload = function() {
		  paper.setup('triangle-lost-in-space');

		  D = Math.max(paper.view.getSize().width, paper.view.getSize().height);

		  mousePos = paper.view.center.add([view.bounds.width / 3, 100]);
		  position = paper.view.center;

		  // Draw the BG
		  var background = new Path.Rectangle(view.bounds);
		      background.fillColor = '#3B3251';
		  buildStars();
		  triangle = new Triangle(50);

		  paper.view.draw();

		  paper.view.onFrame = function(event) {
		    position = position.add( (mousePos.subtract(position).divide(10) ) );
		    var vector = (view.center.subtract(position)).divide(10);
		    moveStars(vector.multiply(3));
		    triangle.update();
		  };
		};
		// ---------------------------------------------------
		//  Helpers
		// ---------------------------------------------------
		window.onresize = function() {
		  project.clear();
		  D = Math.max(paper.view.getSize().width, paper.view.getSize().height);
		  // Draw the BG
		  var background = new Path.Rectangle(view.bounds);
		      background.fillColor = '#3B3251';
		  buildStars();
		  triangle.build(50);
		};

		var random = function(minimum, maximum) {
		  return Math.round(Math.random() * (maximum - minimum) + minimum);
		};

		var map = function (n, start1, stop1, start2, stop2) {
		  return (n - start1) / (stop1 - start1) * (stop2 - start2) + start2;
		};
		// ---------------------------------------------------
		//  Triangle
		// ---------------------------------------------------
		var Triangle = function(a) {
		  this.build(a);
		};

		Triangle.prototype.build = function(a) {
		  // The points of the triangle
		  var segments = [new paper.Point(0, -a / SQRT_3),
		                  new paper.Point(-a/2, a * 0.5 / SQRT_3),
		                  new paper.Point(a/2, a * 0.5 / SQRT_3)];

		  this.flameSize = a / SQRT_3;
		  var flameSegments = [new paper.Point(0, this.flameSize),
		                       new paper.Point(-a/3, a * 0.4 / SQRT_3),
		                       new paper.Point(a/3, a * 0.4 / SQRT_3)];

		  this.flame = new Path({
		    segments: flameSegments,
		    closed: true,
		    fillColor: '#FCE589'
		  });
		  this.ship = new Path({
		    segments: segments,
		    closed: true,
		    fillColor: '#FF7885'
		  });
		  this.group = new Group({
		    children: [this.flame, this.ship],
		    position: view.center
		  });
		};

		Triangle.prototype.update = function() {
		  this.flame.segments[0].point.x = random(this.flame.segments[1].point.x, this.flame.segments[2].point.x);

		  var dist = mousePos.subtract(paper.view.center).length;
		  var angle = mousePos.subtract(paper.view.center).angle;
		  var spread = map(dist, 0, D/2, 10, 30);

		  this.flame.segments[0].point = paper.view.center.subtract(new Point({
		    length: map(dist, 0, D/2, 2*this.flameSize/3, this.flameSize),
		    angle: random(angle - spread, angle + spread)
		  }));
		};

		Triangle.prototype.rotate = function() {
		  var angle = paper.view.center.subtract(mousePos).angle - paper.view.center.subtract(this.ship.segments[0].point).angle;

		  this.group.rotate(angle, paper.view.center);
		};
		// ---------------------------------------------------
		//  Stars (from paperjs.org examples section)
		// ---------------------------------------------------
		window.onmousemove = function(event) {
		  mousePos.x = event.x;
		  mousePos.y = event.y;
		  triangle.rotate();
		};

		var buildStars = function() {
		  // Create a symbol, which we will use to place instances of later:
		  var path = new Path.Circle({
		    center: [0, 0],
		    radius: 5,
		    fillColor: 'white',
		    strokeColor: 'white'
		  });

		  var symbol = new Symbol(path);

		  // Place the instances of the symbol:
		  for (var i = 0; i < count; i++) {
		    // The center position is a random point in the view:
		    var center = Point.random().multiply(paper.view.size);
		    var placed = symbol.place(center);
		    placed.scale(i / count + 0.01);
		    placed.data = {
		      vector: new Point({
		        angle: Math.random() * 360,
		        length : (i / count) * Math.random() / 5
		      })
		    };
		  }

		  var vector = new Point({
		    angle: 45,
		    length: 0
		  });
		};

		var keepInView = function(item) {
		  var position = item.position;
		  var viewBounds = paper.view.bounds;
		  if (position.isInside(viewBounds))
		    return;
		  var itemBounds = item.bounds;
		  if (position.x > viewBounds.width + 5) {
		    position.x = -item.bounds.width;
		  }

		  if (position.x < -itemBounds.width - 5) {
		    position.x = viewBounds.width;
		  }

		  if (position.y > viewBounds.height + 5) {
		    position.y = -itemBounds.height;
		  }

		  if (position.y < -itemBounds.height - 5) {
		    position.y = viewBounds.height
		  }
		};

		var moveStars = function(vector) {
		  // Run through the active layer's children list and change
		  // the position of the placed symbols:
		  var layer = project.activeLayer;
		  for (var i = 1; i < count + 1; i++) {
		    var item = layer.children[i];
		    var size = item.bounds.size;
		    var length = vector.length / 10 * size.width / 10;
		    item.position = item.position.add( vector.normalize(length).add(item.data.vector));
		    keepInView(item);
		  }
		};
	</script>

<script type="text/javascript">
        (function () {
            if (!String.prototype.trim) {
                (function () {
                    // Make sure we trim BOM and NBSP
                    var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
                    String.prototype.trim = function () {
                        return this.replace(rtrim, '');
                    };
                })();
            }

            [ ].slice.call(document.querySelectorAll('input.input__field')).forEach(function (inputEl) {
                // in case the input is already filled..
                if (inputEl.value.trim() !== '') {
                    classie.add(inputEl.parentNode, 'input--filled');
                }

                // events:
                inputEl.addEventListener('focus', onInputFocus);
                inputEl.addEventListener('blur', onInputBlur);
            });

            function onInputFocus(ev) {
                classie.add(ev.target.parentNode, 'input--filled');
            }

            function onInputBlur(ev) {
                if (ev.target.value.trim() === '') {
                    classie.remove(ev.target.parentNode, 'input--filled');
                }
            }
        })();
    </script>

<style>
		canvas{
		width: 94%;
		height: 30%;
		z-index:1;
		margin-left:3%;
		margin-top:20px;
		}
		
		#contents{
		   z-index:2;
		   position: absolute;
		   margin-top:-230px;
		   margin-left:130px;
		}
		
		.search_btn{
		   margin-top:45px;
		}
		
		
</style>

</head>

<body>
<canvas id="triangle-lost-in-space" resize="true"></canvas>

	<div id="contents">
		<div id="title">车票信息查询</div><br /><br />
		   <span class="input input--kozakura" style="width:200px;">
					<input class="input__field input__field--kozakura" type="text" id="cksaddr" name="cksaddr"/>
					<label class="input__label input__label--kozakura" for="cksaddr">
						<span class="input__label-content input__label-content--kozakura" data-content="始发站">始发站</span>
					</label>
						<svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
					</svg>
		   </span>
		    
		   <span class="input input--kozakura" style="width:200px;">
					<input class="input__field input__field--kozakura" type="text" id="ckeaddr" name="ckeaddr"/>
					<label class="input__label input__label--kozakura" for="ckeaddr">
						<span class="input__label-content input__label-content--kozakura" data-content="终点站">终点站</span>
					</label>
						<svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
					</svg>
		   </span>
		   
		   <span class="input input--kozakura" style="width:200px;">
					<input class="input__field input__field--kozakura" type="text" id="ckyxsj" name="ckyxsj"/>
					<label class="input__label input__label--kozakura" for="ckeaddr">
						<span class="input__label-content input__label-content--kozakura" data-content="有效日期">有效日期</span>
					</label>
						<svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
					</svg>
		   </span>
		<input class="search_btn" type="button" value="查    询" onclick="cktj();" />

		<table class="ticket-info">
			<tr>
				<td align="center" valign="top">
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
									<th width="100px" style="color: white;" class="one">始发站</th>
									<th width="100px" style="color: white;" class="two">终点站</th>
									<th width="80px" style="color: white;" class="one">发车时间</th>
									<th width="60px" style="color: white;" class="two">票价</th>
									<th width="100px" style="color: white;" class="one">车厢座号</th>
									<th width="100px" style="color: white;" class="two">车票类型</th>
									<th width="100px" style="color: white;" class="one">有效时间</th>
									<th width="60px" style="color: white;" class="two">操作</th>
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
									<td width="100px" class="oned">${a.szdname}</td>
									<td width="100px" class="twod">${a.ezdname }</td>
									<td width="80px"  class="oned">${a.stime }</td>
									<td width="60px" class="twod">${a.pval }</td>
									<td width="100px" class="oned">${a.cxzh }</td>
									<td width="100px" class="twod">${a.ptype }</td>
									<td width="100px" class="oned">${a.yxsj }</td>
									<td><input class="search_btn2" type="button" value="订  票" onclick="dpbt('${a.id }');" /></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</td>
			</tr>
		</table>

		<div style="display: none;">
			<form id="ckf" action="CusCkSvlt" method="post">
				<input type="hidden" id="sql" name="sql" value="" /> <input
					type="hidden" id="flgs" name="flgs" value="1" />
			</form>
		</div>
	</div>

</body>
</html>