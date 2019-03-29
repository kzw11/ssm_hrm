<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>

<div class="modal fade recruit_add_modal" id="recruitAdd" role="dialog" aria-labelledby="recruit-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">招聘新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_recruit_form" id="addrecform">
                   <!--  <div class="form-group">
                        <label class="col-sm-2 control-label">公司:</label>
                        <div class="col-sm-4">
                            <input type="text" name="empName" class="form-control" id="add_inputName" placeholder="">
                            <span id="helpBlock_add_inputName" class="help-block"></span>
                        </div>
                    </div> -->
                    
                    <div class="form-group">
					    <label class="col-sm-2 control-label">所属部门</label>
					    <div class="col-sm-4">
					    	<!-- 部门提交部门id即可 -->
					      <select class="form-control" name="deptid" id="departmentss_add" >
					      
					      </select>
					    </div>
	<!-- 写职位的联动 -->
						<label class="col-sm-2 control-label">职位</label>
					    <div class="col-sm-4">
					      <select class="form-control" name="positionid" id="posss_add">
					      
					      </select>
					    </div>
				  	</div>
				  	
				  	<div class="form-group">
                        <label class="col-sm-2 control-label">描述与要求:</label>
                        <div class="col-sm-4">
                            <input type="text" name="describe" class="form-control"  placeholder="" id="describe">
                            <span id="helpBlock_add_inputName" class="help-block"></span>
                        </div>
                    </div>
				  	
				  	
				  	<div class="form-group">
                        <label class="col-sm-2 control-label">招聘人数:</label>
                        <div class="col-sm-4">
                            <input type="text" name="numbs" class="form-control"  placeholder="" id="numbs">
                            <span id="helpBlock_add_inputName" class="help-block"></span>
                        </div>
                    </div>
				  	
				  	 <div class="form-group">
                        <label for="add_inputName" class="col-sm-2 control-label">有效时间:</label>
                        <div class="col-sm-4">
                            <input type="date" name="valuetime" class="form-control" id="valuetime" placeholder="">
                            <span id="helpBlock_add_inputName" class="help-block"></span>
                        </div>
                    </div> 
				  	
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary recruit_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">

    <!-------------------------------------员工新增操作-------------------------------------->
    //=======0 点击 员工新增按钮，发送AJAX请求查询部门列表信息，弹出模态框，
    // 将查询得到的部门列表信息显示在对应模态框中部门信息处。
    $(".recruit_add_modal").click(function () {
	    
	    $("#departmentss_add").empty();
        $.ajax({
            url:"getDeptName",
            type:"GET",
            success:function (result) {
            	
                if (result.code == 100){
                    $.each(result.extend.departmentList, function () {
                        var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                        optionEle.appendTo("#departmentss_add");
                    });
                }
            }
        });

        $(".recruit_add_modal").modal({
            backdrop:static,
            keyboard:true
        });
    });
    
  /*   二级联动通过部门获取部门中所有的职位 */
     $("#departmentss_add").change(function(){
    	$("#posss_add").empty();
    	
    	var deptId = this[this.selectedIndex].value;
    	
    	$.ajax({
            url:"getposbydept?deptId="+deptId,
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    $.each(result.extend.poslist, function () {
                        var optionEle = $("<option></option>").append(this.positionName).attr("value", this.positionId);
                        optionEle.appendTo("#posss_add");
                    });
                }
            }
        });
    	
    }); 
    
  
    //3 保存

    $(".recruit_save_btn").click(function () {
     	var deptid = $("#departmentss_add").val();
     	var posid = $("#posss_add").val();
     	var describe = $("#describe").val();
     	var numbs = $("#numbs").val();
     	var valuetime = $("#valuetime").val();
       
        $.ajax({
            url:"addRecruit",
            type:"POST",
            data:{"deptid":deptid,"posid":posid,"describe":describe,"numbs":numbs,"valuetime":valuetime},
            dataType:"json",
            success:function (result) {
                if (result.code == 100){
                    alert("招聘信息新增成功");
                    $('.recruit_add_modal').modal("hide");
                    //跳往最后一页，由于新增记录，所以要重新查询总页数
                   
                } else {
                    alert("招聘信息新增失败！");
                }
            }

        });

    });



</script>
</body>
</html>
