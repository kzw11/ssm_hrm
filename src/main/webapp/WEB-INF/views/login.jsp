<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <base id="base" href="${base}">
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>res/login/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>res/login/css/demo.css" />
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>res/login/css/component.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>res/layui/css/layui.css" />
    <script type="text/javascript" src="<%=basePath%>res/js/jquery-1.12.4.min.js"></script>
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
                        <span class="u_user"></span>
                        <input name="username" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户">
                    </div>
                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input name="password" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
                    </div>
                    <div class="layui-input-block" style="color: #FFFFFF !important">
						<select id="type" name="type" lay-verify="">
						  <option value="-1">--请选择--</option>
						  <option value="0" selected>游客</option>
						  <option value="1">员工</option>
						  <option value="2">管理员</option>
						</select> 
                    </div>
                    <div class="mb2"><a id = "sub" lay-filter="sub" class="act-but submit" href="javascript:;" style="color: #FFFFFF">登录</a></div>
                    <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: #FFFFFF !important" href="<%=basePath%>toregister">还没有账号,前往注册>>></a></div>
                </form>
            </div>
        </div>
    </div>
</div><!-- /container -->
<script src="<%=basePath%>res/login/js/TweenLite.min.js"></script>
<script src="<%=basePath%>res/login/js/EasePack.min.js"></script>
<script src="<%=basePath%>res/login/js/rAF.js"></script>
<script src="<%=basePath%>res/login/js/demo-1.js"></script>
</body>
<script>
    //加载弹出层组件
    layui.use('layer',function(){

        var layer = layui.layer;

        //登录的点击事件
        $("#sub").on("click",function(){
            login();
        })

        $("body").keydown(function(){
            if(event.keyCode == "13"){
                login();
            }
        })

        //登录函数
        function login(){
            var username = $(" input[ name='username' ] ").val();
            var password = $(" input[ name='password' ] ").val();
            var type = $("#type").val();        
            if("" == username || "" == password) {
			    layer.msg('请填写账号密码!', {
					icon : 2,
					time : 1000
				});
				return;
			}			
			if("" == type) {
			    layer.msg('请选择类型!', {
					icon : 2,
					time : 1200
				});
				return;
			}           
            $.ajax({
                url:"<%=basePath%>login",
                data:{"username":username,"password":password,"type":type},
                type:"post",
                dataType:"json",
                success:function(data){
                     if(data.code==100){
                     	if(type==1){
                     		window.location = "toempindex";
                     	}else if(type==0){
                     		window.location = "index";
                     	}else if(type==2){
                     		window.location="adminindex";
                     	}
                        
                    }else{
                        layer.msg('登录失败,请重新登录！', {icon: 5});
                        $(" input[ name='username' ] ").val("");
			            $(" input[ name='password' ] ").val("");
			            $("#type").val("");
                    } 
                },
                error : function () {
					layer.msg('服务器响应失败！', {icon: 5});
				}
            });
        }
    })
</script>
</html>