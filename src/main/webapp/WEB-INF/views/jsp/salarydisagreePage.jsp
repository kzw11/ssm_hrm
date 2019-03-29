<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Employee Add Page</title>
     <link rel="stylesheet" type="text/css" href="<%=basePath%>res/bootstrap/css/bootstrap.min.css">
</head>
<body>

<div class="modal fade salarydisagree-add-modal" id="salarydisagree" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">工资异议</h4>
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


<script type="text/javascript">

    <!-------------------------------------员工新增操作-------------------------------------->
    //=======0 点击 员工新增按钮，发送AJAX请求查询部门列表信息，弹出模态框，
    // 将查询得到的部门列表信息显示在对应模态框中部门信息处。
    $(".emp_add_btn").click(function () {
	    $("#add_department").empty();
        $.ajax({
            url:"getDeptName",
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    $.each(result.extend.departmentList, function () {
                        var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                        optionEle.appendTo("#add_department");
                    });
                }
            }
        });

        $('.emp-add-modal').modal({
            backdrop:static,
            keyboard:true
        });
    });
    
  /*   二级联动通过部门获取部门中所有的职位 */
    $("#add_department").change(function(){
    	$("#add_pos").empty();
    	
    	var deptId = this[this.selectedIndex].value;
    	
    	$.ajax({
            url:"getposbydept?deptId="+deptId,
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    $.each(result.extend.poslist, function () {
                        var optionEle = $("<option></option>").append(this.positionName).attr("value", this.positionId);
                        optionEle.appendTo("#add_pos");
                    });
                }
            }
        });
    	
    });
    
    //=========1 当鼠标从姓名输入框移开的时候，判断姓名输入框内的姓名是否重复 ============
    $("#add_inputName").change(function () {
        var empName = $("#add_inputName").val();
        $.ajax({
            url:"checkusername",
            type:"GET",
            data:"username="+empName,
            success:function (result) {
                if (result== "success"){
                    $("#add_inputName").parent().parent().removeClass("has-error");
                    $("#add_inputName").parent().parent().addClass("has-success");
                    $("#helpBlock_add_inputName").text("用户名可用！");
                    $(".emp_save_btn").attr("btn_name_exists", "success");
                }else {
                    $("#add_inputName").parent().parent().removeClass("has-success");
                    $("#add_inputName").parent().parent().addClass("has-error");
                    $("#helpBlock_add_inputName").text(result.extendInfo.name_reg_error);
                    $(".emp_save_btn").attr("btn_name_exists", "error");
                }
            }
        });
    });

    //3 保存

    $(".emp_save_btn").click(function () {

        //1 获取到第3步：$(".emp_save_btn").attr("btn_name_exists", "success");中btn_name_exists的值
        // btn_name_exists = error，就是姓名重复
        if($(".emp_save_btn").attr("btn_name_exists") == "error"){
            return false;
        }
        
        $.ajax({
            url:"addEmp",
            type:"POST",
            data:$(".add_emp_form").serialize(),
            success:function (result) {
                if (result.code == 100){
                    alert("员工新增成功");
                    $('.emp-add-modal').modal("hide");
                    //跳往最后一页，由于新增记录，所以要重新查询总页数
                   /*  $.ajax({
                        url:"/hrms/emp/getTotalPages",
                        type:"GET",
                        success:function (result) {
                            var totalPage = result.extendInfo.totalPages;
                            window.location.href="/hrms/emp/getEmpList?pageNo="+totalPage;
                        }
                    }) */
                } else {
                    alert("员工新增失败！");
                }
            }

        });

    });



</script>
</body>
</html>
