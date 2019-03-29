<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Employee Update Page</title>

<script type="text/javascript">
   
   $(document).on("click","#empee_edit",function () {
   	$("#add_departments").empty();
   	var updateEmpId = $(this).parent().parent().find("td:eq(0)").text();
    var updateEmpname = $(this).parent().parent().find("td:eq(3)").text();
   var updateposition = $(this).parent().parent().find("td:eq(4)").text();
   var stats = $(this).parent().parent().find("td:eq(2)").text();
       //2 根据id或name查询出对应员工信息进行回显；
        $.ajax({
            url:"getEmpById/"+updateEmpId,
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    var emp = result.extend.employee;
                    $("#update_static_empName").text(emp.empName);
                    $("#status").val(emp.status);
                    	
                    	if(emp.status==0){
                    		$("#status").attr("selected",true);
                    	}else if(this.status==1){
                    		$("#status").attr("selected",true);
                    	}else{
                    	$("#status").attr("selected",true);
                    	}
                }
            }

        });

   		
   
        //2 部门回显列表；
        $.ajax({
            url:"getDeptName",
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    $.each(result.extend.departmentList, function () {
                    	var optEle =  optEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    	if(this.deptName==updateEmpname){
                    		optEle.attr("selected",true);
                    	}
                        optEle.appendTo("#add_departments");
                        
                    });
                }
            }

        });
        
         /*   二级联动通过部门获取部门中所有的职位 */
    $("#add_departments").change(function(){
    	$("#add_poss").empty();
    	var deptId = this[this.selectedIndex].value;
    	
    	$.ajax({
            url:"getposbydept?deptId="+deptId,
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    $.each(result.extend.poslist, function () {
                        var optionEle = $("<option></option>").append(this.positionName).attr("value", this.positionId);
                       	if(this.positionName==updateposition){
                    		optEle.attr("selected",true);
                    	}
                        optionEle.appendTo("#add_poss");
                    });
                }
            }
        });
    	
    });

       $(".emp_update_btn").attr("updateEmpId", updateEmpId);  
   
   });
    
   
    
    </script>

</head>
<body>
	<div class="modal fade emp-update-modal" tabindex="-1" role="dialog"
		aria-labelledby="emp-update-modal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">员工更改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal update_emp_form">
						<div class="form-group">
							<label for="update_static_empName" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-8">
								<p class="form-control-static" id="update_static_empName" name="empName"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="update_department" class="col-sm-2 control-label">员工状态</label>
							<div class="col-sm-4">
								<div class="checkbox">
									<select class="form-control" name="status" id="statuss">
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
								<select class="form-control" name="deptId" id="add_departments">

								</select>
							</div>

							<label class="col-sm-2 control-label">职位</label>
							<div class="col-sm-4">
								<select class="form-control" name="positionId" id="add_poss">

								</select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary emp_update_btn">保存</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</body>
<script type="text/javascript">
	
	 $(".emp_update_btn").click(function () {
	    var updateEmpId = $(this).attr("updateEmpId");
	 	 $.ajax({
            url:"updateEmp/"+updateEmpId,
            type:"PUT",
            data:$(".update_emp_form").serialize(),
            success:function (result) {
                if (result.code==100){
                    alert("员工更改成功！");
                    $(".emp-update-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${pageInfo.pageNum};
                    window.location.href="getEmpList?pageNo="+curPage;
                }else {
                    alert(result.extend.emp_update_error);
                }
            }
        });
	 	
	 });

</script>

</html>
