<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Head Page</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    
    <link rel="stylesheet" type="text/css" href="<%=basePath%>res/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>res/bootstrap/css/bootstrap-theme.min.css">
    
    <script type="text/javascript" src="<%=basePath%>res/js/jquery-1.12.4.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="<%=basePath%>res/bootstrap/js/bootstrap.min.js" ></script>
    
    
    
    
</head>
<body>
<div class="modal fade user-update-modal" tabindex="-1" role="dialog"
		aria-labelledby="user-update-modal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">用户信息更改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal update_user_form">
						<div class="form-group">
							<label for="update_static_empName" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-8">
								<p class="form-control-static" id="update_static_empName" name="empName">${user.username } </p>
							</div>
						</div>
						
						<div class="form-group">
                        <label class="col-sm-2 control-label">原密码:</label>
	                        <div class="col-sm-5">
	                            <input type="password" name="password" class="form-control" id="oldpassword" placeholder="请输入原密码"/>
	                            <span id="helpBlock_add_inputName" class="help-block"></span>
	                        </div>
                   		 </div>
						
						<div class="form-group">
                        <label class="col-sm-2 control-label">新密码:</label>
	                        <div class="col-sm-5">
	                            <input type="password" name="newpassword" class="form-control" id="newpassword" placeholder="请输入新密码"/>
	                            <span id="helpBlock_add_inputName" class="help-block"></span>
	                        </div>
                   		 </div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="updateAdmin" class="btn btn-primary user_update_btn" edit-psw="${user.password }">修改</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


<div class="hrms_brand_nav">
    <nav class="navbar navbar-inverse navbar-static-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#hrms-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" id="company_logo" href="#">XXX公司LOGO</a>
            </div>

            <div class="collapse navbar-collapse" id="hrms-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="#">公司介绍 <span class="sr-only">(current)</span>  </a>
                    </li>
                    <li><a href="#">人力资源部</a></li>
                    <li><a href="#">请假申请</a></li>
                    <li><a href="#">报销申请</a></li>
                    <li><a href="#">出勤记录</a></li>
                </ul>

                <form class="navbar-form navbar-left">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="站内搜索">
                    </div>
                    <button type="submit" class="btn btn-default">搜索</button>
                </form>

                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user.username } ：您好<span class="caret"></span></a>
                        <ul class="dropdown-menu nav nav-pills nav-stacked">
                            <li class="active"><a href="#" data-toggle="modal" data-target=".user-update-modal"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 修改信息</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 头像更换</a></li>
                            <li><a href="#" class="hrms_logout"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> 账号退出</a></li>
                        </ul>
                    </li>
                </ul><!-- /.nav navbar-nav navbar-right -->
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div><!-- /.hrms_brand_nav -->
<script type="text/javascript">
    //主页面
    $("#company_logo").click(function () {
        $(this).attr("href", "<%=basePath%>adminindex");
    });
    //账号退出
    $(".hrms_logout").click(function () {
        window.location.href = "<%=basePath%>logout";
    });
</script>

<script type="text/javascript">
	
	 $("#updateAdmin").click(function () {
	  var password = $(this).attr("edit-psw");
	   var oldpass = $("#oldpassword").val();
	    if(oldpass=="" || oldpass.length==0){
	   		alert("原密码不能为空！");
	   		return ;
	   }
	  
	   if(oldpass != password){
	   		alert("您输入的密码与原密码不匹配，请重新输入");
	   		$("#oldpassword").val("");
	   		return;
	   }  
	   var newpassword = $("#newpassword").val();
	   if(newpassword==null || newpassword.length==0){
	   		alert("新密码不能为空！");
	   		return ;
	   }
	 	   $.ajax({
            url:"updateadmin/"+newpassword,
            type:"PUT",
            success:function (result) {
                if (result.code==100){
                    alert("更改成功！");
                    $(".user-update-modal").modal("hide");
                    //跳转到当前页
                   
                }else {
                    alert("更新失败！");
                }
            }
        }); 
	 	
	 });

</script>
</body>
</html>
