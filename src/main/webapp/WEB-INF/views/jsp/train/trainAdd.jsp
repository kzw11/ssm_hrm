<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<script type="text/javascript">
   
   $(document).on("click","#train_add",function () {
   	$("#dept_added").empty();
   
        //2 部门回显列表；
        $.ajax({
            url:"getDeptName",
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    $.each(result.extend.departmentList, function () {
                    	var optEle =  optEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    	
                        optEle.appendTo("#dept_added");
                        
                    });
                }
            }

        });
        
         /*   二级联动通过部门获取部门中所有的职位 */
    $("#dept_added").change(function(){
    	$("#position_added").empty();
    	var deptId = this[this.selectedIndex].value;
    	
    	$.ajax({
            url:"getposbydept?deptId="+deptId,
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    $.each(result.extend.poslist, function () {
                        var optionEle = $("<option></option>").append(this.positionName).attr("value", this.positionId);
                        optionEle.appendTo("#position_added");
                    });
                }
            }
        });
    	
      });
   });
    
   
    
    </script>

</head>
<body>
	<div class="modal fade train-add-modal" tabindex="-1" role="dialog"
		aria-labelledby="train-add-modal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">培训信息新增</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal add_trains_form">
						
						<div class="form-group">
							<label for="update_department" class="col-sm-2 control-label">培训内容:</label>
							<div class="col-sm-4">
								<input type="text" name="content" class="form-control" id="trainscontent" placeholder="培训内容"/>
                           	    <span id="helpBlock_add_inputName" class="help-block"></span>
							</div>
						</div>
							
						<div class="form-group">
							<label for="update_department" class="col-sm-2 control-label">培训时间:</label>
							<div class="col-sm-5">
								<input type="datetime-local" name="time" class="form-control" id="traintimes" placeholder=""/>
                           	    <span id="helpBlock_add_inputName" class="help-block"></span>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">所属部门</label>
							<div class="col-sm-4">
								<!-- 部门提交部门id即可 -->
								<select class="form-control" name="deptId" id="dept_added">

								</select>
							</div>

							<label class="col-sm-2 control-label">职位</label>
							<div class="col-sm-4">
								<select class="form-control" name="empId" id="position_added">

								</select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="add_trainbtn" class="btn btn-primary train_add_btn">保存</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</body>
<script type="text/javascript">
	
	 $("#add_trainbtn").click(function () {
	 alert("ok");
	    var content = $("#trainscontent").val();
	    var time = $("#traintimes").val();
	    var departId =$("#dept_added").val();
	    var posiId = $("#position_added").val(); 
	   var creattime = time.replace("T", " ");
	 	 $.ajax({
            url:"addTrain",
            type:"POST", 
            data:{"content":content,"time":creattime,"deptId":departId,"posId":posiId},
            success:function (result) {
                if (result.code==100){
                    alert("培训信息新增成功！");
                    $(".train-add-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${pageInfo.pageNum};
                    window.location.href="gettrainList?pageNo="+curPage;
                }else {
                    alert("新增失败，请重试！");
                }
            },
            error:function(jqXHR,msg){
            	alert("服务器相应失败，请稍后重试!");
            }
        });
	 });

</script>

</html>
