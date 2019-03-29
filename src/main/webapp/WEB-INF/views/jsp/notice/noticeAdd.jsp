<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Recruit Add Page</title>
</head>
<body>

<div class="modal fade notice_add_modal" id="noticeAdd" role="dialog" aria-labelledby="recruit-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">发布公告</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_recruit_form" id="addrecform">
                  <div class="form-group">
                        <label class="col-sm-2 control-label">公告主题:</label>
                        <div class="col-sm-5">
                            <input type="text" name="empName" class="form-control" id="title" placeholder="公告主题">
                            <span id="helpBlock_add_inputName" class="help-block"></span>
                        </div>
                    </div>
                    
                    
				  	
				  	<div class="form-group">
                        <label class="col-sm-2 control-label">内容:</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" rows="4" name="content"  placeholder="公告内容" id="content"></textarea>
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
    $(".notice_add_modal").click(function () {
	    
	    //$("#department_add").empty();
       

        $(".notice_add_modal").modal({
            backdrop:static,
            keyboard:true
        });
    });
    
    //3 保存

    $(".recruit_save_btn").click(function () {
     	var title = $("#title").val();
     	var content = $("#content").val();
       
        $.ajax({
            url:"addNotice",
            type:"POST",
            data:{"title":title,"content":content},
            dataType:"json",
            success:function (result) {
                if (result.code == 100){
                    alert("公告发布成功");
                    $('.notice_add_modal').modal("hide");
                   window.location.reload();
                } else {
                    alert("公告发布失败！");
                }
            }

        });

    });



</script>
</body>
</html>
