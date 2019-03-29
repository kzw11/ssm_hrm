<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>

<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/crud
 -->
 <link rel="stylesheet" type="text/css" href="<%=basePath%>res/bootstrap/css/bootstrap.min.css">
    
    <script type="text/javascript" src="<%=basePath%>res/js/jquery-1.12.4.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="<%=basePath%>res/bootstrap/js/bootstrap.min.js" ></script>
	<style>
		body{
			/* background-color:#ccc; */
		}
		
	</style>

<script type="text/javascript">

	window.onload = function() {

		var node = document.getElementById("timeshow");
		
		setInterval(function() {
			var time = new Date();
			var hours = time.getHours();
			var mints = time.getMinutes();
			var second = time.getSeconds();
			var flag = 'AM';
			 if (hours > 12) {
				//hours =hours- 12;
				flag = 'PM'
			}
			if (hours <= 9) {
				hours = '0' + hours;
			}
			if (mints <= 9) {
				mints = '0' + mints;
			}

			if (second <= 9) {
				second = '0' + second;
			}
			node.innerHTML = flag +"  "+ hours + ":" + mints + ":" + second ;

		}, 1000)


	}

</script>
</head>
<body style="min-height:800px; height: auto">
<!-- 招聘信息详情的模态框 -->

<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">招聘详情</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">招聘编号</label>
		    <div class="col-sm-10">
		      	<p class="form-control-static" id="recid"></p>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">公司名:</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static" id="reccompany">上海中科软科技有限公司</p>
		      <!-- <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@atguigu.com"> -->
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">公司地址</label>
		    <div class="col-sm-10">
		     	<p class="form-control-static" id="recaddress"> 上海市静安区江场三路56号202</p>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">招聘职位</label>
		    <div class="col-sm-4">
		    	<!-- 部门提交部门id即可 -->
		      <p class="form-control-static" id="recpos"></p>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label class="col-sm-2 control-label">招聘人数</label>
		    <div class="col-sm-10">
		     	<p class="form-control-static" id="recpeople"> </p>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label class="col-sm-2 control-label">有效时间</label>
		    <div class="col-sm-10">
		     	<p class="form-control-static" id="rectime"> </p>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">描述要求</label>
		    <div class="col-sm-10">
		     	<p class="form-control-static" id="recdes"> </p>
		    </div>
		  </div>
		 
		  
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="qz">求职</button>
      </div>
    </div>
  </div>
</div>



<!-- 员工添加的模态框 -->
<div class="modal fade" id="interviewStatus" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">面试反馈信息</h4>
      </div>
      <div class="modal-body">
       		<table class="table table-bordered table-hover" id="interview_table">
                    <thead>
                    <th>序号</th>
                    <th>投递时间</th>
                    <th>是否已阅</th>
                    <th>面试通知</th>
                    <th>面试时间</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                      
                    </tbody>
                </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>


	<!-- 搭建显示页面 -->
	<div class="container">
	
	 <nav class="navbar navbar-default row no-yj  navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
				   <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-list-left" aria-expanded="false" value="aaaaadre">qwqw
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar">asd</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
                    <a class="navbar-brand" href="#">&nbsp;&nbsp;OA招聘网</a>
                </div>

                <div class="collapse navbar-collapse pull-right" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        
                        
                        <li>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="height: 50px">
                           <c:if test="${empty user }"> <span class="glyphicon glyphicon-user" aria-hidden="true"/></c:if>
                            <%-- <img class="img-circle pull-left img-responsive nav-user-img" src="<%=basePath%>res/image/user.jpg" /> --%>
                           <%--  <span class="pull-left nav-username"> --%>
                            	<%-- <c:if test="${empty user }">
									<a href="${pageContext.request.contextPath}/tologin">登录</a>
									|<a href="${pageContext.request.contextPath}/toregister">注册</a>
									
								</c:if> --%>
                            	<c:if test="${not empty user }"> ${user.username }:您好</c:if>
                            </span>
                        </a>

                            <ul class="dropdown-menu dropdown-menu-right clearfix" style="padding-top: 0px">
                                <li class="user-li-head"><span>
                                    <img class="img-circle nav-user-img-xiala center-block" src="<%=basePath%>res/image/user.jpg" /></span>
                                    <p></p>
                                    <p class="text-center"><span>网络部 - 网络工程师</span></p>
                                    <p class="text-center"><span>远一博</span> </p>
                                    <p class="text-center"><small><span id="timeshow"></span></small></p>
                                </li>
                                <li style="padding: 10px 20px; padding-bottom: 20px">
									<c:if test="${not empty user }">
	                                    <div class="pull-left">
	                                        <a href="#" class="btn btn-default btn-flat no-yj">资料</a>
	                                    </div>
	                                    <div class="pull-right">
	                                        <a href="logout" class="btn btn-default btn-flat no-yj">注销</a>
	                                    </div>
                                    </c:if>
                                    <c:if test="${empty user }">
                                    		<div class="pull-left">
	                                        <a href="tologin" class="btn btn-default btn-flat no-yj">登录</a>
	                                    </div>
	                                    <div class="pull-right">
	                                        <a href="toregister" class="btn btn-default btn-flat no-yj">注册</a>
	                                    </div>
                                    
                                    </c:if>
                                </li>
                                </ul>
                        </li>
                         <li><a class="dropdown-toggle" data-toggle="dropdown" href="#"> 简历</a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li><a href="toResume">添加简历</a></li>
                                <li><a href="lookresume">查看我的简历</a></li>
                            </ul>
                        </li>
                        <li><a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-bell"><i class="label label-warning label-nav">0</i></i></a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li><a href="#" data-toggle="modal" data-target=".interviewStatus" id="interviewNotice">我的通知</a></li>
                            </ul>
                        </li>
                        
                        <li><a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-envelope"><i class="label label-success label-nav">0</i></i></a>

                            <ul class="dropdown-menu dropdown-menu-right">
                                <li><a href="#">哈哈哈</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
	
	<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
			
				<h2>招聘信息</h2>
			</div>
		</div>
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
			
				<h1>招聘信息</h1>
			</div>
		</div>
		
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>招聘编号</th>
		                    <th>部门名</th>
		                    <th>招聘职位</th>
		                    <th>描述</th>
		                    <th>招聘人数</th>
		                    <th>有效时间</th>
		                    <th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pageInfo.list}" var="emp">
                            <tr>
                                <td>${emp.reid}</td>
                                <td>${emp.dept.deptName}</td>
                                <td>${emp.position.positionName}</td>
                                <td>${emp.describes}</td>
                                <td>${emp.numbs}人</td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${emp.valuetime}"/></td>
                                <td>
                                    <a href="#" role="button" class="btn btn-primary emp_edit_btn edit_btn" data-toggle="modal" data-target=".emp-update-modal" edit-id="${emp.reid}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"/>详情</a>
                                    <a href="#" role="button" id="qz" class="btn btn-success emp_handresume_btn" qiuzhi-id="${emp.reid }"> <span class="glyphicon glyphicon-heart" aria-hidden="true" ></span>&nbsp;求职</a>
                                </td>
                            </tr>
                        </c:forEach>
					</tbody>
				</table>
				
				<div class="panel-body">
                    <div class="table_items">
                    </div>
                    
                </div>
				
			</div>
		</div>

		<!-- 显示分页信息 -->
		<div class="row">
			<!--分页文字信息  -->
			<div class="col-md-6" id="page_info_area">
			  当前第<span class="badge">${pageInfo.pageNum}</span>页，共有<span class="badge">${pageInfo.pages}</span>页，总记录数<span class="badge">${pageInfo.total}</span>条。
			</div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area">
				<nav aria-label="Page navigation" class="pull-right">
                        <ul class="pagination">
                            <li><a href="index?pageNo=1">首页</a></li>
                            <c:if test="${pageInfo.pageNum==1}">
                                <li class="disabled">
                                    <a href="#" aria-label="Previous" class="prePage">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${pageInfo.pageNum!=1}">
                                <li>
                                    <a href="#" aria-label="Previous" class="prePage">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach begin="1" end="${pageInfo.pages<5?pageInfo.pages:5}" step="1" var="itemPage">
                                <c:if test="${pageInfo.pageNum == itemPage}">
                                    <li class="active"><a href="index?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                                <c:if test="${pageInfo.pageNum != itemPage}">
                                    <li><a href="index?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                            </c:forEach>

                            <c:if test="${pageInfo.pageNum==pageInfo.pages}">
                                <li class="disabled" class="nextPage">
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${pageInfo.pageNum!=pageInfo.pages}">
                                <li>
                                    <a href="#" aria-label="Next" class="nextPage">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <li><a href="index?pageNo=${pageInfo.pages}">尾页</a></li>
                        </ul>
                    </nav>
			</div>
		</div>
		
	</div>
	

	
	<script type="text/javascript">
	   //显示招聘详情
	   $(document).on("click",".edit_btn",function(){
			
			var reid=$(this).attr("edit-id");
			//alert(reid);
			//1、查出招聘信息详情
			getReclist(reid);
			
			//3、把员工的id传递给模态框的更新按钮
			$("#emp_update_btn").attr("edit-id",$(this).attr("edit-id")); 
			$("#empUpdateModal").modal({
				backdrop:"static"
			});
		});
		
		//确认面试
		$(document).on("click",".confir_btn",function(){
			var interviewid = $(this).attr("inter_id");
			var notice_id=$(this).attr("notice_id");
			if(notice_id==0){
				alert("您还没有面试通知，请耐心等待···");
			}else{
				
				$.ajax({
					url:"updateisinterview/"+interviewid,
					type:"GET",
					success:function(result){
						if(result.code==100){
							alert("确认成功,祝你好运!");
							$("#interviewStatus").modal("hide");
						}else{
							alert("确认失败,请稍后重试!");
						}
					}
				
				});
				
			
			}
			
			
		});
		
		//面试通知模态框
		 $(document).on("click","#interviewNotice",function(){
			//$.post("getInterviewNotice");
			$.ajax({
				url:"getInterviewNotice",
				type:"POST",
				success:function(result){
					if(result.code==100){
						$("#interview_table tbody").empty();
						var interview=result.extend.interlist;
						$.each(interview,function(index,item){
							var interviewIdtd=  $("<td></td>").append(item.interviewId);
							var delivertimetd=  $("<td></td>").append(getLocalTime(item.delivertime/1000));
							var isreadtd=  $("<td></td>").append(item.isread==0?"未读":"已阅");
							var noticeinterviewtd=  $("<td></td>").append(item.noticeinterview==0?"暂无":"收到");
							var interviewtimetd=  $("<td></td>").append(getLocalTime(item.interviewtime/1000));
							
							var confirBtn = $("<button></button>").addClass("btn btn-primary btn-sm confir_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-ok-circle")).append("确认");
							confirBtn.attr("inter_id",item.interviewId).attr("notice_id",item.noticeinterview);
							
							var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
							delBtn.attr("del-id",item.empId);
							
							var btnTd = $("<td></td>").append(confirBtn).append(" ").append(delBtn);
							
							$("<tr></tr>").append(interviewIdtd)
								.append(delivertimetd)
								.append(isreadtd)
								.append(noticeinterviewtd)
								.append(interviewtimetd)
								.append(btnTd)
								.appendTo("#interview_table tbody");
						})
						
					}
					
				}
			
			});
			//alert(reid);
			//1、查出招聘信息详情
			//getReclist(reid);
			//2、查出员工信息，显示员工信息
			//getEmp($(this).attr("edit-id"));
			
			//3、把员工的id传递给模态框的更新按钮
			//$("#emp_update_btn").attr("edit-id",$(this).attr("edit-id")); 
			$("#interviewStatus").modal({
				backdrop:"static"
			});
		});
		
	   
	   //求职投递按钮
	    $(document).on("click","#qz",function(){
		    var resumeid = $(this).parent().parent().find("td:eq(0)").text();
			/* var resumeid = $(this).attr("qiuzhi-id"); */
				
			if (confirm("确认投递该职位？")){
			
				$.ajax({
					url:"insertrecruit/"+resumeid,
					type:"GET",
					 success:function (result) {
					 	if (result.code == 100){
					 	
					 		alert("简历投递成功，请做好面试准备！");			 	
					 	
						 }else{
						 	alert(result.extend.msg);
						 }
					 }
			});
		}
	
		}); 
	   
	   
	    function getLocalTime(nS) {     
			   return new Date(parseInt(nS) * 1000).toLocaleString().replace(/:\d{1,2}$/,' ');     
		};
	   
	   function getReclist(id){
			$.ajax({
				url:"getrecruit/"+id,
				type:"GET",
				success:function(result){
					//console.log(result);
					/* alert(result.code) */
					 if (result.code == 100){
					 	var recData = result.extend.rec;
					 	$("#recid").text(recData.reid);
					 	$("#recpos").text(recData.position.positionName);
					 	$("#rectime").text(recData.valuetime);
					 	$("#recpeople").text(recData.numbs);
					 	$("#recdes").text(recData.describes);
					 	
					 }
				
				}
			});
		}
	   
        $(document).ready(function () {
            $(".dropdownMenu").dropdown();
            $(".nav-left-dropdown>a").click(function () {


                if ($(this).attr("d") != 1 && $(this).attr("d") != undefined) {
                    $(this).removeClass("nav-left-dropdown-a");
                    $this = $(this);
                    $(this).next("ul").slideUp(300, function () { $this.removeClass("nav-left-bottrom-border"); $this.removeClass("nav-left-dropdown-ul") });

                    $(this).attr("d", "1");

                } else {
                    $(this).addClass("nav-left-dropdown-a");
                    $(this).addClass("nav-left-bottrom-border");
                    $(this).next("ul").addClass("nav-left-dropdown-ul").slideDown(300);
                    $(this).attr("d", "2");

                }


            })
        });

		
	</script>
	
	<script type="text/javascript">
	  $(function () {
        //上一页
        var curPage = ${pageInfo.pageNum};
        var totalPages = ${pageInfo.pages};
        $(".prePage").click(function () {
            if (curPage > 1){
                var pageNo = curPage-1;
                $(this).attr("href", "index?pageNo="+pageNo);
            }
        });
        //下一页
        $(".nextPage").click(function () {
            if (curPage < totalPages){
                var pageNo = curPage+1;
                $(this).attr("href", "index?pageNo="+pageNo);
            }
        });
    })
	
	</script>
</body>



</html>