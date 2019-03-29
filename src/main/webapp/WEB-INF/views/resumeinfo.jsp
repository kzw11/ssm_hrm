<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>人力资源管理系统</title>
   
     <link rel="stylesheet" type="text/css" href="<%=basePath%>res/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>res/bootstrap/css/bootstrap-theme.min.css">
    
    <script type="text/javascript" src="<%=basePath%>res/js/jquery-1.12.4.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="<%=basePath%>res/bootstrap/js/bootstrap.min.js" ></script>
    <style type="text/css">
        <!--
        .atten {font-size:12px;font-weight:normal;color:#F00;}
        -->
        body{
        	background: url(res/image/resumeback.jpg) no-repeat;
        }
    </style>
</head>
<body class="ContentBody">
<form action="" method="post" id="formid">
    <div class="MainDiv">
        <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
            <tr>
                <th class="tablestyle_title" >当前用户:${user.username }</th>
            </tr>
            <tr>
                <td class="CPanel">

                    <table border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
                        <TR>
                            <TD width="100%">
                                <fieldset style="height:100%;">
                                    <legend>简历信息${resume.resumeId}</legend>
                                    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
                                       	<tr><td><input type="hidden" name="resumeId" value="${resume.resumeId}"/></td></tr>
                                        <tr>
                                            <td nowrap align="right" width="9%">姓名：</td>
                                            <td width="36%"><input name="realname" type="text" value="${resume.realname }">
                                                <span class="red">*</span></td>
                                            <td width="12%"><div align="right">性别：</div></td>
                                            <td width="43%">
                                               <label class="radio-inline"> 
												  <input type="radio" name="gender" id="inlineRadio1" value="男" checked="true"> 男
												</label>
												<label class="radio-inline">
												  <input type="radio" name="gender" id="inlineRadio2" value="女"> 女
												</label>

                                        </tr>
                                        <tr>
                                            <td nowrap align="right" width="9%">年龄：</td>
                                            <td><input name="age" type="text" value="${resume.age }"></td>
                                            <td><div align="right">籍贯：</div></td>
                                            <td><input name="job" type="text" value="汉族" >
                                                <span class="red">*</span></td>
                                        </tr>
                                        <tr>
                                            <td><div align="right">工作经验：</div></td>
                                            <td><input name="experience" type="text" class="input" value="${resume.experience }">
                                                <span class="red">*</span></td>
                                            <td nowrap align="right">上一份工作：</td>
                                            <td><input name="lastjob" type="text" class="input" value="${resume.lastjob }">
                                                <span class="red">*</span></td>
                                        </tr>
                                        <tr>
                                            <td><div align="right">期望薪资：</div></td>
                                            <td>
                                            <select name="salary">
                                            	
                                            	<option value="0">--请选择-</option>
                                                <option value="1000~3000">1000~3000</option>
                                                <option value="3000~5000">3000~5000</option>
                                                <option value="5000~8000" selected="true">5000~8000</option>
                                                <option value="8000~">8000~</option>
                                            </select>
                                            </td>
                                            <td nowrap align="right">学历：</td>
                                            <td>
                                            <select name="eduction">
                                            	<option value="0">--请选择-</option>
                                                <option value="高中">高中</option>
                                                <option value="大专">大专</option>
                                                <option value="本科" selected="true">本科</option>
                                                <option value="本科以上">本科以上</option>
                                            </select>
                                                <span class="red">*</span></td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right">电话：</td>
                                            <td><input name="phone" type="text" class="input" value="${resume.phone }">
                                                <span class="red">*</span></td>
                                            <td><div align="right">Email：</div></td>
                                            <td><input name="email" type="text" class="input" value="${resume.email }">
                                                <span class="red">*</span></td>
                                        </tr>
                                        
                                        <tr>
                                            <td nowrap align="right">兴趣爱好：</td>
                                            <td><input name="hobby" type="text" class="input" value="${resume.hobby }">
                                                <span class="red">*</span></td>
                                            <td><div align="right">政治面貌：</div></td>
                                            <td>
												<select name="politicalstatus">
                                                <option value="0">--请选择-</option>
                                                <option value="中共党员">中共党员</option>
                                                <option value="中共预备党员">中共预备党员</option>
                                                <option value="共青团员" selected="true">共青团员</option>
                                                <option value="群众">群众</option>
                                                <option value="其他">其他</option>
                                            </select>
                                             </td>
                                        </tr>
                                        
                                        <tr>
                                            <td width="9%" nowrap align="right">详细经历：</td>
                                            <td colspan="3">
					<textarea name="content" cols="80" rows="6" class="input" id="content" value="">我要干java
					</textarea></td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </TD>

                        </TR>
                    </TABLE>
                </td>
            </tr>
            <TR>
                <TD colspan="2" align="center" height="50px">
                    <input name="提交" type="button" class="button" id="updateresume" value="修改"/>　
                    <a href="index"><input type="button" value="返回"></a>
                </TD>
            </TR>
        </TABLE>
    </div>
</form>
</body>
<script>

	$("#updateresume").click(function(){
		$.ajax({
	            url:"updateResume",
	            type:"PUT",
	            data:$("#formid").serialize(),
	            success:function (result) {
	                if (result.code==100){
	                    alert("简历更改成功！");
	                    //跳转到当前页
	                    window.location.href="index";
	                }else {
	                    alert("简历修改失败");
	                }
            	},
            	error : function (XMLHttpRequest, textStatus, errorThrown) {
            		alert("服务器响应失败！");
            		window.location.href="index";
					
					
				}
	
	        });
	
	
	});
	

</script>

</html>

