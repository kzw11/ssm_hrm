<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Add Page</title>
</head>
<body>

<div class="modal fade emp-add-modal" tabindex="-1" role="dialog" aria-labelledby="emp-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_emp_form">
                
                    <div class="form-group">
                        <label for="add_inputName" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-4">
                            <input type="text" name="empName" class="form-control" id="add_inputName" placeholder="如：张三">
                            <span id="helpBlock_add_inputName" class="help-block"></span>
                        </div>
                    </div>
                    
                     <div class="form-group">
                        <label for="update_department" class="col-sm-2 control-label">员工状态</label>
                        <div class="col-sm-4">
                            <div class="checkbox">
                                <select class="form-control" name="status" id="status">
                                     <option value="0">在职</option>
                                     <option value="1">离职</option>
                                     <option value="2">试用</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
					    <label class="col-sm-2 control-label">所属部门</label>
					    <div class="col-sm-4">
					    	<!-- 部门提交部门id即可 -->
					      <select class="form-control" name="deptId" id="add_department" >
					      
					      </select>
					    </div>
	<!-- 写职位的联动 -->
						<label class="col-sm-2 control-label">职位</label>
					    <div class="col-sm-4">
					      <select class="form-control" name="positionId" id="add_pos">
					      
					      </select>
					    </div>
				  	</div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary emp_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


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
                if (result.code== 100){
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
                            window.location.href="getEmpList?pageNo="+totalPage;
                        }
                    }) */
                } else {
                    $("#add_inputName").val("");
                    alert(result.extend.addempMsg);
                    $('.emp-add-modal').modal("hide");
                }
            }

        });

    });



</script>
</body>
</html>
