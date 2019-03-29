<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>招聘管理页面</title>
</head>
<body>
<div class="hrms_container">
    <!-- 导航条 -->
    <%@ include file="../commom/head.jsp"%>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="hrms_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="../commom/leftsidebar.jsp"%>

        <!-- 中间员工表格信息展示内容 -->
        <div class="emp_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">招聘管理</a></li>
                        <li class="active">面试信息</li>
                    </ol>
                </div>
                <!-- Table -->
                <table class="table table-bordered table-hover" id="emp_table">
                    <thead>
                    <th>序号</th>
                    <th>应聘者</th>
                    <th>投递时间</th>
                    <th>面试状态</th>
                    <th>面试时间</th>
                    <th>是否录用</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                        <c:forEach items="${pageInfo.list}" var="emp">
                            <tr id="${emp.interviewId}">
                                <td>${emp.interviewId}</td>
                                <td>${emp.user.username}</td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${emp.delivertime}"/></td>
                                <td>${emp.isinterview==0?"未面试":"已面试"}</td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${emp.interviewtime}"/></td>
                                <td>${emp.isavail==0?"未录用":"录用"}</td>
                                <td>
                                    <a href="#" role="button" id="viewinfo" class="btn btn-primary emp_edit_btn" data-toggle="modal" data-target=".view-update-modal"><span class="glyphicon glyphicon-edit" aria-hidden="true"/>编辑</a>
                                    <a href="#" role="button" id="noticeview" class="btn btn-success notice_btn" ><span class="glyphicon glyphicon-log-in" aria-hidden="true"/>通知面试</a>
                                    <a href="#" role="button" class="btn btn-danger emp_delete_btn"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="panel-body">
                    <div class="table_items">
                        当前第<span class="badge">${pageInfo.pageNum}</span>页，共有<span class="badge">${pageInfo.pages}</span>页，总记录数<span class="badge">${pageInfo.total}</span>条。
                    </div>
                    <nav aria-label="Page navigation" class="pull-right">
                        <ul class="pagination">
                            <li><a href="getInterList?pageNo=1">首页</a></li>
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
                                    <li class="active"><a href="getInterList?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                                <c:if test="${pageInfo.pageNum != itemPage}">
                                    <li><a href="getInterList?pageNo=${itemPage}">${itemPage}</a></li>
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
                            <li><a href="getInterList?pageNo=${pageInfo.pages}">尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->

        <!-- 尾部 -->
        <%-- <%@ include file="../commom/foot.jsp"%> --%>
    </div><!-- /.hrms_body -->
</div><!-- /.container -->
<%@ include file="../commom/foot.jsp"%>
<%--  <%@ include file="jsp/employeeAdd.jsp"%> --%>
<%@ include file="./interviewinfo.jsp"%>


<script>
    $(function () {
        //上一页
        var curPage = ${pageInfo.pageNum};
        var totalPages = ${pageInfo.pages};
        $(".prePage").click(function () {
            if (curPage > 1){
                var pageNo = curPage-1;
                $(this).attr("href", "getInterList?pageNo="+pageNo);
            }
        });
        //下一页
        $(".nextPage").click(function () {
            if (curPage < totalPages){
                var pageNo = curPage+1;
                $(this).attr("href", "getInterList?pageNo="+pageNo);
            }
        });
    })

    <!-- ==========================员工删除操作=================================== -->
    $(".emp_delete_btn").click(function () {
        var curPage = ${pageInfo.pageNum};
        var delEmpId = $(this).parent().parent().find("td:eq(0)").text();
        var delEmpName = $(this).parent().parent().find("td:eq(1)").text();
        if (confirm("确认删除【" + delEmpName+ "】的面试信息吗？")){
            $.ajax({
                url:"deleteInterview/"+delEmpId,
                type:"DELETE",
                success:function (result) {
                    if (result.code == 100){
                        alert("删除成功！");
                        window.location.href="getInterList?pageNo="+curPage;
                    }else {
                        alert(result.extend.emp_del_error);
                    }
                }
            });
        }
    });


</script>

<script type="text/javascript">

	/* $(function(){
		alert("首页弹出来！");
		
		
		
	}); */
		
	 $(document).on("click","#noticeview",function(){
		    var resumeid = $(this).parent().parent().find("td:eq(0)").text();
				//alert(resumeid);
			var table = document.getElementById("emp_table");
			var rowInput = document.getElementById(resumeid);
			 var cell4 = rowInput.cells[6];
			var btn_update = cell4.firstChild;
			var btn_sure = document.createElement("input");
			btn_sure.setAttribute("type", "button");
			btn_sure.setAttribute("value", "确定");
			btn_sure.setAttribute("class", "btn btn-primary btn-sm");
			btn_sure.setAttribute("onclick", "sureClick('" + resumeid + "')"); 
			cell4.replaceChild(btn_sure, btn_update); 
 				
		
		 
		
			if (confirm("确认通知该应聘者面试？")){
			
				for (var i = 4; i < 5; i++) {
					var td1 = rowInput.cells[i];
					var content = td1.innerHTML;
					td1.innerHTML = "<input type='datetime-local' id='intername' value='" + content + "'/>";
				}
			
				
		} 
	
		});
		
		 function sureClick(id) {
			var rowInput = document.getElementById(id);
			
			var intertime = $("#intername").val();
			var intertime2 = intertime.replace("T", " ");
			alert(intertime2);
			$.ajax({
				url:"updatenotice",
				data:{"resumeid":id,"intertime":intertime2},
				type:"post",
				dataType:"json",
				success:function(result){
					if(result.code==100){
						alert("已通知成功!");
						window.location.reload();
					}
				}
			
			});
		
		} 

</script>
</body>
</html>
