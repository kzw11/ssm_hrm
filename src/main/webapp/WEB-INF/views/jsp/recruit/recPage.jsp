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
                        <li class="active">招聘信息</li>
                    </ol>
                </div>
                <!-- Table -->
                <table class="table table-bordered table-hover" id="emp_table">
                    <thead>
                    <th>招聘编号</th>
                    <th>部门名</th>
                    <th>招聘职位</th>
                    <th>描述</th>
                    <th>招聘人数</th>
                    <th>有效时间</th>
                    <th>操作</th>
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
                                    <a href="#" role="button" class="btn btn-primary emp_edit_btn" data-toggle="modal" data-target=".emp-update-modal"><span class="glyphicon glyphicon-pencil" aria-hidden="true"/>编辑</a>
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
                            <li><a href="getRecList?pageNo=1">首页</a></li>
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
                                    <li class="active"><a href="getRecList?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                                <c:if test="${pageInfo.pageNum != itemPage}">
                                    <li><a href="getRecList?pageNo=${itemPage}">${itemPage}</a></li>
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
                            <li><a href="getRecList?pageNo=${pageInfo.pages}">尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->

        <!-- 尾部 -->
        <%@ include file="../commom/foot.jsp"%>
    </div><!-- /.hrms_body -->
</div><!-- /.container -->

<%@ include file="./recruitAdd.jsp"%>

<%-- <%@ include file="employeeUpdate.jsp"%>  --%>


<script>
    $(function () {
        //上一页
        var curPage = ${pageInfo.pageNum};
        var totalPages = ${pageInfo.pages};
        $(".prePage").click(function () {
            if (curPage > 1){
                var pageNo = curPage-1;
                $(this).attr("href", "gettrainList?pageNo="+pageNo);
            }
        });
        //下一页
        $(".nextPage").click(function () {
            if (curPage < totalPages){
                var pageNo = curPage+1;
                $(this).attr("href", "getRecList?pageNo="+pageNo);
            }
        });
    })

    <!-- ==========================员工删除操作=================================== -->
    $(".emp_delete_btn").click(function () {
        var curPage = ${pageInfo.pageNum};
        var delEmpId = $(this).parent().parent().find("td:eq(0)").text();
        var delEmpName = $(this).parent().parent().find("td:eq(1)").text();
        if (confirm("确认删除【" + delEmpName+ "】的信息吗？")){
            $.ajax({
                url:"deleteTrain/"+delEmpId,
                type:"DELETE",
                success:function (result) {
                    if (result.code == 100){
                        alert("删除成功！");
                        window.location.href="getRecList?pageNo="+curPage;
                    }else {
                        alert(result.extend.emp_del_error);
                    }
                }
            });
        }
    });


</script>
</body>
</html>
