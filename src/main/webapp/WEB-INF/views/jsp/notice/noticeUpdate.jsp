<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>

<script type="text/javascript">
   
   $(document).on("click","#notice_edit",function () {
   	var noticeid = $(this).parent().parent().find("td:eq(0)").text();
    var updateEmpname = $(this).parent().parent().find("td:eq(3)").text();
       //2 根据id或name查询出对应员工信息进行回显；
        $.ajax({
            url:"getNoticeById/"+noticeid,
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    var emp = result.extend.notice;
                     $("#themes").val(emp.title);
                     $("#contents").val(emp.content); 
                }
            }

        });

   		
       $(".notice_update_btn").attr("noticeid", noticeid);  
   
   });
    
    </script>

</head>
<body>
	<div class="modal fade notice-update-modal" tabindex="-1" role="dialog" aria-labelledby="notice-update-modal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                <h4 class="modal-title">编辑公告</h4>
	            </div>
            <div class="modal-body">
                <form class="form-horizontal update_notice_form" id="updatenoticeform">
                  <div class="form-group">
                        <label class="col-sm-2 control-label">公告主题:</label>
                        <div class="col-sm-5">
                            <input type="text" name="title" class="form-control" id="themes" placeholder=""/>
                            <span id="helpBlock_add_inputName" class="help-block"></span>
                        </div>
                    </div>
				  	<div class="form-group">
                        <label class="col-sm-2 control-label">内容:</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" rows="4" name="content"  placeholder="公告内容" id="contents"></textarea>
                            <span id="helpBlock_add_inputName" class="help-block"></span>
                        </div>
                    </div>
				  	
                </form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary notice_update_btn">修改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</body>
<script type="text/javascript">
	
	 $(".notice_update_btn").click(function () {
	    var noticeid = $(this).attr("noticeid");
	    
	 	  $.ajax({
            url:"updateNotice/"+noticeid,
            type:"PUT",
            data:$(".update_notice_form").serialize(),
            success:function (result) {
                if (result.code==100){
                    alert("通知更改成功！");
                    $(".notice-update-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${pageInfo.pageNum};
                    window.location.href="getNotice?pageNo="+curPage;
                }else {
                    alert(result.extend.notice_update_error);
                }
            }
        });
	 	 
	 });

</script>

</html>
