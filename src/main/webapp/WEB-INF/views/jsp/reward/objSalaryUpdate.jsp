<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>

<script type="text/javascript">
   
 $(document).on("click","#objsalarydedit",function () {
   	var rewardid = $(this).parent().parent().find("td:eq(0)").text();
    var empName = $(this).parent().parent().find("td:eq(1)").text();
    var rewtime = $(this).parent().parent().find("td:eq(2)").text();
    var reas = $(this).parent().parent().find("td:eq(3)").text();
    var money = $(this).parent().parent().find("td:eq(4)").text();
   	
   		
	   $("#empName").text(empName);
	   $("#money").val(money);
	   $("#rewtime").val(rewtime);
   		$("#reason").val(reas);
//奖惩信息的编辑
		
		
      $(".objsalary_update_btn").attr("rewardid", rewardid);  
      $(".objsalary_update_btn").attr("money", money);  
      $(".objsalary_update_btn").attr("rewtime",rewtime);  
      $(".objsalary_update_btn").attr("reas", reas);  
   
   });

    </script>

</head>
<body>
	<div class="modal fade objSalary-update-modal" tabindex="-1" role="dialog"
		aria-labelledby="objSalary-update-modal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">工资异议信息详情</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal update_emp_form">
						<div class="form-group">
							<label for="update_static_empName" class="col-sm-2 control-label">姓名:</label>
							<div class="col-sm-8">
								<p class="form-control-static" id="empName" name="username"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="update_department" class="col-sm-2 control-label">金额:</label>
							<div class="col-sm-4">
								<input type="text" name="money" class="form-control" id="money" placeholder=""/>
                           	    <span id="helpBlock_add_inputName" class="help-block"></span>
							</div>
						</div>
						
						<div class="form-group">
							<label for="update_department" class="col-sm-2 control-label">时间:</label>
							<div class="col-sm-4">
								<input type="text" name="" class="form-control" id="rewtime" placeholder=""/>
							</div>
						</div>
						
						<div class="form-group">
							<label for="update_department" class="col-sm-2 control-label">原因:</label>
							<div class="col-sm-4">
								<input type="text" name="reason" class="form-control" id="reason" placeholder=""/>
							</div>
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success objsalary_update_btn">修改</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</body>
<script type="text/javascript">
	
   $(".objsalary_update_btn").click(function () {
   
	    var money = $("#money").val();
	    var rewtime = $("#rewtime").val();
	    var reas = $("#reason").val();
	    var rewardid = $(this).attr("rewardid");
	 	 $.ajax({
            url:"updateObjSalary/"+rewardid,
            type:"PUT",
            data:{"rewardid":rewardid,"money":money,"rewtime":rewtime,"reas":reas},
            success:function (result) {
                if (result.code==100){
                    alert("审批成功！");
                    $(".objSalary-update-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${pageInfo.pageNum};
                    window.location.href="getObjSalaryList?pageNo="+curPage;
                }else {
                    alert("审批失败！");
                }
            }
        });
	 	
	 });

</script>

</html>
