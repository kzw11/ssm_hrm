<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>注册</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>res/login/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>res/login/css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>res/login/css/component.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>res/layui/css/layui.css" />
<script type="text/javascript"
	src="<%=basePath%>res/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=basePath%>res/layui/layui.js"></script>
</head>
<body>

	<div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas"></canvas>
				<div class="logo_box">
					<h3>欢迎你</h3>
					<form action="#" name="f" method="post">

						<div class="input_outer">
							<span class="u_user" id="spanusername"></span> <input
								name="username" id="username" class="text"
								style="color: #FFFFFF !important" type="text"
								placeholder="请输入账户" onblur="confirmUserName(this)">
						</div>

						<div class="input_outer">
							<span class="us_uer"></span> <input name="password" id="password"
								class="text"
								style="color: #FFFFFF !important; position:absolute; z-index:100;"
								value="" type="password" placeholder="请输入密码">
						</div>

						<div class="input_outer">
							<span class="us_uer"></span> <input name="repassword"
								id="repassword" class="text"
								style="color: #FFFFFF !important; position:absolute; z-index:100;"
								value="" type="password" placeholder="请确认密码">
						</div>

						<div class="mb2">
							<a id="sub" lay-filter="sub" class="act-but submit"
								href="javascript:;" style="color: #FFFFFF">立即注册</a>
						</div>
						  <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: #FFFFFF !important" href="<%=basePath%>tologin">已有账号,前往登录>>></a></div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /container -->
	<script src="<%=basePath%>res/login/js/TweenLite.min.js"></script>
	<script src="<%=basePath%>res/login/js/EasePack.min.js"></script>
	<script src="<%=basePath%>res/login/js/rAF.js"></script>
	<script src="<%=basePath%>res/login/js/demo-1.js"></script>
</body>
<script type="text/javascript">
	function confirmUserName(obj) {
		var username = $("#username").val();
		if (username == "") {
			layer.msg('请填写账号!', {
				time : 2000,
				icon : 2
			});
			return;
		}

		$.ajax({
			type : "GET",
			url : '${basePath}checkusername?username=' + username,
			success : function(msg) {
				if (msg == 'success') {
					layer.msg('用户名已存在！', {
						icon : 6
					});
					$("#username").val("");
				} else {

				}

			},
			error : function() {
				layer.msg('服务器响应失败！', {
					icon : 5
				});
			}
		});

	}
</script>

<script>
	//加载弹出层组件
	layui.use('layer', function() {

		var layer = layui.layer;

		//登录的点击事件
		$("#sub").on("click", function() {
			regist();
		})

		$("body").keydown(function() {
			if (event.keyCode == "13") {
				regist();
			}
		})

		//注册函数
		function regist() {
			var username = $(" input[ name='username' ] ").val();
			var password = $(" input[ name='password' ] ").val();
			var repassword = $(" input[ name='repassword' ] ").val();

			if ("" == username || "" == password) {
				layer.msg('请填写账号密码!', {
					icon : 2,
					time : 1000
				});
				return;
			}

			if (password != repassword) {
				layer.msg('两次输入的密码不匹配!', {
					icon : 2,
					time : 700
				});
				$("#password").val("");
				$("#repassword").val("");
				return;
			}

			$.ajax({
				url : "<%=basePath%>register",
				data : {
					"username" : username,
					"password" : password
				},
				type : "post",
				dataType : "json",
				success : function(data) {

					if (data.code == 100) {
						layer.msg('注册成功！', {
							icon : 1
						});
						$("#username").val("");
						$("#password").val("");
						$("#repassword").val("");
					} else {
						layer.msg('注册失败！', {
							icon : 5
						});
					}
					$("#username").val("");
					$("#password").val("");
					$("#repassword").val("");

				},
				error : function() {
					layer.msg('服务器响应失败！', {
						icon : 5
					});
				}
			});
		}
	})
</script>
</html>