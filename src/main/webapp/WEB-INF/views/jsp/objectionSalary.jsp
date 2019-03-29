<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>工资异议</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>res/bootstrap/css/bootstrap.min.css">
  <script type="text/javascript" src="<%=basePath%>res/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
  
  		$(document).on("click","#btn_ageree",function(){
  			
  			var content = $("#errorcontent").val();
  			var money = $("#money").val();
  			
  			if(content == null || content.length==0){
  				alert("输入的内容不可为空！");
  				return ;
  			}
  			
  			if(money == null || money.length==0){
  				alert("金额不可为空！");
  				return ;
  			}
  			
  			$.ajax({
  				url:"addobjectionsalary",
  				type:"POST",
  				data:{"content":content,"money":money},
  				success:function(result){
  					if(result.code==100){
  						alert("提交成功！");
  						window.location.href="toempindex"
  					}else{
  						alert("提交失败！");
  					}
  				}
  			
  			});
  		
  		});
  		
  		
  
  </script>
  
  </head>
  
  <body style="min-height:800px; height: auto">
		
		<div class="container" >
			<div class="row">
				<div class="col-md-12">
					
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<br>
				</div>
			</div>
		
			<div class="row">
				<div class="col-md-12">
				<form action="" method="post">
					<table class="table-condensed">
						<th>工资异议</th>
						<tr><td>异议内容:</td><td><input type="text" name="content" id="errorcontent"></td></tr>
						<tr><td>金额:</td><td><input type="text" name="money" id="money"></td></tr>
						<tr></tr>
					</table>
					<input type="button" href="#" value="提交" id="btn_ageree" class="btn btn-primary"><input type="button" class="btn btn-default" value="返回" onclick="window.history.go(-1)">	
				</form>		
				</div>
			</div>
		
		</div>
		

  </body>
  

  
</html>
