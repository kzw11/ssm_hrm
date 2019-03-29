<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>

<script type="text/javascript">
   
   $(document).on("click","#pos_edit",function () {
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
                       	
                    	//$("#posName").val(this.positionName);
                        optionEle.appendTo("#add_poss");
                         $(".emp_update_btn").attr("posId", this.positionId);
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
	<div class="modal fade pos-update-modal" tabindex="-1" role="dialog"
		aria-labelledby="emp-update-modal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">职位更改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal update_emp_form">
						
						<div class="form-group">
							<label class="col-sm-2 control-label">部门名:</label>
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
					<div class="form-group">
                        <label class="col-sm-4 control-label">修改后的职位:</label>
                        <div class="col-sm-5">
                            <input type="text" name="posName" class="form-control" id="posName" placeholder="修改后的职位"/>
                            <span id="helpBlock_add_inputName" class="help-block"></span>
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
	    var updatePosId = $(this).attr("posId");
		var posName = $("#posName").val();
		if(posName==""||posName.length==0){
			alert("修改后的名字不能为空！");
			return ;
		}	    
	 	 $.ajax({
            url:"updatePos/"+updatePosId,
            type:"PUT",
            data:{"posName":posName},
            success:function (result) {
                if (result.code==100){
                    alert("职位信息更改成功！");
                    $(".pos-update-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${pageInfo.pageNum};
                    window.location.href="getposList?pageNo="+curPage;
                }else {
                    alert("修改失败！");
                }
            }
        });
	 	
	 });

</script>

</html>
