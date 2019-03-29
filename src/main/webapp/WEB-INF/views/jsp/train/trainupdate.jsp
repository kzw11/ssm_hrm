<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Employee Update Page</title>

<script type="text/javascript">
   
   $(document).on("click","#train_edit",function () {
   	$("#add_departments").empty();
   	var trainId = $(this).parent().parent().find("td:eq(0)").text();
    var content = $(this).parent().parent().find("td:eq(1)").text();
    var updateEmpname = $(this).parent().parent().find("td:eq(3)").text();
   var updateposition = $(this).parent().parent().find("td:eq(4)").text();
   var stats = $(this).parent().parent().find("td:eq(2)").text();
   
   $("#trainId").text(trainId);
   $("#content").val(content);
   $("#time").val(stats);
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

       $(".train_update_btn").attr("updatetrainId", trainId);  
   
   });
    
   
    
    </script>

</head>
<body>
	<div class="modal fade train-update-modal" tabindex="-1" role="dialog"
		aria-labelledby="train-update-modal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">培训信息更改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal update_train_form">
						<div class="form-group">
							<label for="update_static_empName" class="col-sm-2 control-label">培训编号:</label>
							<div class="col-sm-8">
								<p class="form-control-static" id="trainId" name="trainId"></p>
							</div>
						</div>
						
						<div class="form-group">
							<label for="update_department" class="col-sm-2 control-label">培训内容:</label>
							<div class="col-sm-4">
								<input type="text" name="content" class="form-control" id="content" placeholder=""/>
                           	    <span id="helpBlock_add_inputName" class="help-block"></span>
							</div>
						</div>
							
						<div class="form-group">
							<label for="update_department" class="col-sm-2 control-label">培训时间:</label>
							<div class="col-sm-4">
								<input type="date" name="time" class="form-control" id="time" placeholder=""/>
                           	    <span id="helpBlock_add_inputName" class="help-block"></span>
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
								<select class="form-control" name="empId" id="add_poss">

								</select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary train_update_btn">保存</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</body>
<script type="text/javascript">
	
	 $(".train_update_btn").click(function () {
	 alert("ok");
	    var updatetrainId = $(this).attr("updatetrainId");
	    var content = $("#content").val();
	    var time = $("#time").val();
	    var departId =$("#add_departments").val();
	    var posiId = $("#add_poss").val();
	   
	 	 $.ajax({
            url:"updateTraininfo/"+updatetrainId,
            type:"PUT",
            data:{"content":content,"time":time,"deptId":departId,"posId":posiId},
          /*   data:$(".update_train_form").serialize(), */
            success:function (result) {
            	alert(result.code);
                if (result.code==100){
                    alert("培训信息更改成功！");
                    $(".train-update-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${pageInfo.pageNum};
                    window.location.href="gettrainList?pageNo="+curPage;
                }else {
                    alert("修改失败，请重试！");
                }
            },
            error:function(jqXHR,msg){
            	alert("服务器相应失败，请稍后重试!");
            }
        });
	 });

</script>

</html>
