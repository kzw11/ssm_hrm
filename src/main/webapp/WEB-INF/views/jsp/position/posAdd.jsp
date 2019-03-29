<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>

<script type="text/javascript">
   
   $(document).on("click","#pos_add",function () {
   	$("#add_dept").empty();
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
                    	
                        optEle.appendTo("#add_dept");
                       
                    });
                }
            }

        });
         
       $("#add_dept").change(function(){
    	
    	var deptId = this[this.selectedIndex].value;
    	$(".pos_add_btn").attr("updatedeptId",deptId);//给保存按钮附上部门ID
    	
   	 });
    
   
   });
    
    </script>

</head>
<body>
	<div class="modal fade pos-add-modal" tabindex="-1" role="dialog"
		aria-labelledby="pos-add-modal">
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
								<select class="form-control" name="deptId" id="add_dept">

								</select>
							</div>
						</div>
						
					<div class="form-group">
                        <label class="col-sm-2 control-label">新增职位:</label>
                        <div class="col-sm-5">
                            <input type="text" name="posName" class="form-control" id="addposName" placeholder="添加的职位名"/>
                            <span id="helpBlock_add_inputName" class="help-block"></span>
                        </div>
                    </div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="btn_addpos" class="btn btn-primary pos_add_btn">保存</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</body>
<script type="text/javascript">
	$(document).on("click","#btn_addpos",function () {
	// $(".pos_add_btn").click(function () {
	    var adddeptId = $(this).attr("updatedeptId");
		var addposName = $("#addposName").val();
		if(addposName==""||addposName.length==0){
			alert("新增加的部门名字不能为空！");
			return ;
		}	    
	 	 $.ajax({
            url:"addPos/"+adddeptId,
            type:"PUT",
            data:{"addposName":addposName},
            success:function (result) {
                if (result.code==100){
                    alert("职位信息添加成功！");
                    $(".pos-add-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${pageInfo.pageNum};
                    window.location.href="getposList?pageNo="+curPage;
                }else {
                    alert("添加失败！");
                }
            }
        });
	 	
	 });

</script>

</html>
