<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="panel-group col-sm-2" id="hrms_sidebar_left" role="tablist" aria-multiselectable="true">
    
    <ul class="nav nav-pills nav-stacked emp_sidebar">
        <li role="presentation" class="active">
            <a href="#" data-toggle="collapse" data-target="#collapse_emp">
                <span class="glyphicon glyphicon-user" aria-hidden="true" onclick="showNav('collapse_emp')">&nbsp;员工管理</span>
            </a>
            
            <ul class="nav nav-pills nav-stacked" id="collapse_emp" style="display:none">
                <li role="presentation"><a href="#" class="emp_info">员工信息</a></li>
                <li role="presentation"><a href="#" role="button" class="emp_add_btn" data-toggle="modal" data-target=".emp-add-modal">员工新增</a></li>
                <li role="presentation"><a href="#" class="emp_clearall_btn">员工清零</a></li>
            </ul>
            
        </li>
    </ul>
    
    <ul class="nav nav-pills nav-stacked dept_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#collapse_dept">
                <span class="glyphicon glyphicon-cloud" aria-hidden="true" onclick="showNav('collapse_dept')">&nbsp;部门管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_dept" style="display:none">
                <li role="presentation"><a href="#" class="dept_info">部门信息</a></li>
                <li role="presentation"><a href="#" class="dept_add_btn" data-toggle="modal" data-target=".dept-add-modal">部门新增</a></li>
                <li role="presentation"><a href="#" class="dept_clearall_btn">部门清零</a></li>
            </ul>
        </li>
    </ul>

	 <ul class="nav nav-pills nav-stacked dept_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#collapse_dept">
                <span class="glyphicon glyphicon-road" aria-hidden="true" onclick="showNav('collapse_pos')">&nbsp;职位管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_pos" style="display:none">
                <li role="presentation"><a href="#" class="pos_info">职位信息</a></li>
                <li role="presentation"><a href="#" id="pos_add" class="pos_add_btn" data-toggle="modal" data-target=".pos-add-modal">职位新增</a></li>
            </ul>
        </li>
    </ul>

	<ul class="nav nav-pills nav-stacked dept_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#collapse_dept">
                <span class="glyphicon glyphicon-hand-right" aria-hidden="true" onclick="showNav('collapse_train')">&nbsp;培训管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_train" style="display:none">
                <li role="presentation"><a href="#" class="train_info">培训信息</a></li>
                <li role="presentation"><a href="#" class="train_add_btn" id="train_add" data-toggle="modal" data-target=".train-add-modal">培训新增</a></li>
                <li role="presentation"><a href="#" class="train_clearall_btn">培训清零</a></li>
            </ul>
        </li>
    </ul>
    
   
   <ul class="nav nav-pills nav-stacked dept_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#collapse_dept">
                <span class="glyphicon glyphicon-object-align-left" aria-hidden="true" onclick="showNav('collapse_rec')">&nbsp;招聘管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_rec" style="display:none">
                <li role="presentation"><a href="#" class="rec_info">招聘信息</a></li>
                <li role="presentation"><a href="#" class="rec_add_btn" data-toggle="modal" data-target=".recruit_add_modal">招聘新增</a></li>
            	<li role="presentation"><a href="#" class="view_info">面试信息</a></li>
            </ul>
        </li>
    </ul>
    
    
    <ul class="nav nav-pills nav-stacked dept_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#collapse_notice">
                <span class="glyphicon glyphicon-bullhorn" aria-hidden="true" onclick="showNav('collapse_notice')">&nbsp;公告管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_notice" style="display:none">
                <li role="presentation"><a href="#" class="notice_info">公告信息</a></li>
                <li role="presentation"><a href="#" class="notice_add_btn" data-toggle="modal" data-target=".notice_add_modal">公告新增</a></li>
            </ul>
        </li>
    </ul>
    
    <ul class="nav nav-pills nav-stacked dept_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#collapse_reward">
                <span class="glyphicon glyphicon-usd" aria-hidden="true" onclick="showNav('collapse_reward')">&nbsp;薪资管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_reward" style="display:none">
                <li role="presentation"><a href="#" class="reward_info">奖惩信息</a></li>
                <li role="presentation"><a href="#" class="reward_add_btn" data-toggle="modal" data-target=".reward_add_modal">奖惩新增</a></li>
                <li role="presentation"><a href="#" class="objectsalary_info">工资异议</a></li>
            </ul>
        </li>
    </ul>
   
</div><!-- /.panel-group，#hrms_sidebar_left -->
<!-- 侧边导入新增按钮的模态框 -->
 <%@ include file="../employee/employeeAdd.jsp"%>  
 <%@ include file="../notice/noticeAdd.jsp"%>  
 <%@ include file="../position/posAdd.jsp"%>  
 <%@ include file="../recruit/recruitAdd.jsp"%>  
 <%@ include file="../train/trainAdd.jsp"%>  
<script>

	function showNav(obj) {
		var node = document.getElementById(obj);
		if (node.style.display == 'block') {
			node.style.display = 'none'
		} else {
			node.style.display = 'block';
		} 
	}

</script>

<script type="text/javascript">
    //跳转到员工页面
    $(".emp_info").click(function () {
        $(this).attr("href", "getEmpList");
    });
    //跳转到部门页面
    $(".dept_info").click(function () {
        $(this).attr("href", "getDeptList");
    });
    
     //跳转到培训页面
    $(".pos_info").click(function () {
        $(this).attr("href", "getposList");
    });
    
     //跳转到培训页面
    $(".train_info").click(function () {
        $(this).attr("href", "gettrainList");
    });
    
     //跳转到招聘页面
    $(".rec_info").click(function () {
        $(this).attr("href", "getRecList");
    });
    
      //跳转到面试页面
    $(".view_info").click(function () {
        $(this).attr("href", "getInterList");
    });
    
     //跳转到面试页面
    $(".notice_info").click(function () {
        $(this).attr("href", "getNotice");
    });
    
    //跳转到面试页面
    $(".reward_info").click(function () {
        $(this).attr("href", "getRewardList");
    });
    
     //跳转到面试页面
    $(".objectsalary_info").click(function () {
        $(this).attr("href", "getObjSalaryList");
    });
    
    //员工清零这个功能暂未实现
    $(".emp_clearall_btn").click(function () {
        alert("对不起，您暂无权限进行操作！请先获取权限");
    });
    //部门清零这个功能暂未实现
    $(".dept_clearall_btn").click(function () {
        alert("对不起，您暂无权限进行操作！请先获取权限");
    });
    
    //部门清零这个功能暂未实现
    $(".train_clearall_btn").click(function () {
        alert("对不起，您暂无权限进行操作！请先获取权限");
    });
</script>
</body>
</html>
