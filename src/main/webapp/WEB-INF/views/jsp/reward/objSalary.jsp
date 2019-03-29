<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>薪资异议管理页面</title>
</head>
<body>
<div class="hrms_dept_container">
    <!-- 导航栏-->
    <%@ include file="../commom/head.jsp"%>


    <!-- 中间部分（左侧栏+表格内容） -->
    <div class="hrms_dept_body">
        <!-- 左侧栏 -->
        <%@ include file="../commom/leftsidebar.jsp"%>

        <!-- 表格内容 -->
        <div class="dept_info col-sm-10">
            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">薪资管理</a></li>
                        <li class="active">薪资异议信息</li>
                    </ol>
                </div>
                <!-- Table -->
                <table class="table table-bordered table-hover" id="dept_table">
                    <thead>
                        <th>编号</th>
                        <th>员工名</th>
                        <th>提交时间</th>
                        <th>异议内容</th>
                        <th>金额</th>
                        <th>审批时间</th>
                        <th>是否处理</th>
                        <th>操作</th>
                    </thead>
                    <tbody>
                        <c:forEach items="${pageInfo.list}" var="objsalary">
                            <tr>
                                <td>${objsalary.id}</td>
                                <td>${objsalary.employee.empName}</td>
                                 <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${objsalary.time}"/></td>
                                 <td>${objsalary.errcontent}</td>
                                 <td>${objsalary.money}</td>
                                 <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${objsalary.reissueTime}"/></td>
                                 <td>${objsalary.isexecute==0?"未处理":"已处理"}</td>
                                <td>
                                    <a href="#" role="button" class="btn btn-primary dept_edit_btn" data-toggle="modal" id="objsalarydedit" data-target=".objSalary-update-modal"><span class="glyphicon glyphicon-pencil" aria-hidden="true"/>编辑</a>
                                    <a href="#" role="button" class="btn btn-danger objsalary_delete_btn"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除</a>
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
                            <li><a href="getObjSalaryList?pageNo=1">首页</a></li>
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
                                    <li class="active"><a href="getObjSalaryList?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                                <c:if test="${pageInfo.pageNum != itemPage}">
                                    <li><a href="getObjSalaryList?pageNo=${itemPage}">${itemPage}</a></li>
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
                            <li><a href="getObjSalaryList?pageNo=${pageInfo.pages}">尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.dept_info -->
    </div><!-- /.hrms_dept_body -->
 
	<%@ include file="./objSalaryUpdate.jsp"%> 
    <!-- 尾部-->
    <%@ include file="../commom/foot.jsp"%>

</div><!-- /.hrms_dept_container -->

<script type="text/javascript">
    var curPageNo = ${pageInfo.pageNum};
    var totalPages = ${pageInfo.pages};
    //上一页
    $(".prePage").click(function () {
         if (curPageNo > 1){
             var pageNo = curPageNo - 1;
             $(this).attr("href", "getObjSalaryList?pageNo="+pageNo);
         }
    });
    //下一页
    $(".nextPage").click(function () {
        if (curPageNo < totalPages){
            var pageNo = curPageNo + 1;
            $(this).attr("href", "getObjSalaryList?pageNo="+pageNo);
        }
    });


    <!-- ==========================部门删除操作=================================== -->
    $(".objsalary_delete_btn").click(function () {
        var rewardId = $(this).parent().parent().find("td:eq(0)").text();
        var delDeptName = $(this).parent().parent().find("td:eq(1)").text();
        var curPageNo = ${pageInfo.pageNum};
        
        if (confirm("确认删除【"+ delDeptName +"】的工资异议信息吗？")){
            $.ajax({
                url:"delobjSalary/"+rewardId,
                type:"DELETE",
                success:function (result) {
                    if (result.code == 100){
                        alert("删除成功！");
                        window.location.href = "getObjSalaryList?pageNo="+curPageNo;
                    }else {
                        alert("删除失败！");
                    }
                }
            });
        }
    });
</script>
</body>
</html>
