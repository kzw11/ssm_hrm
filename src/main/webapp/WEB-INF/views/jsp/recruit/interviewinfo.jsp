<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Employee Update Page</title>

<script type="text/javascript">
   
   $(document).on("click","#viewinfo",function () {
   
   	var interviewid = $(this).parent().parent().find("td:eq(0)").text();
    var updateEmpname = $(this).parent().parent().find("td:eq(1)").text();
    var delivertime2 = $(this).parent().parent().find("td:eq(2)").text();
    var isinterview2 = $(this).parent().parent().find("td:eq(3)").text();
    var isval = $(this).parent().parent().find("td:eq(5)").text();
   	
	   
	   $("#username").text(updateEmpname);
	   $("#delivertime").text(delivertime2);
	   $("#isinterview").text(isinterview2);
   

      $(".interview_ageree_btn").attr("interviewid", interviewid);  
      $(".interview_ageree_btn").attr("isinterview", isinterview2);  
      $(".interview_ageree_btn").attr("isval", isval);  
      $(".interview_ageree_btn").attr("empname", updateEmpname);  
   
   });
    
   
    
    </script>

</head>
<body>
	<div class="modal fade view-update-modal" tabindex="-1" role="dialog"
		aria-labelledby="emp-update-modal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">面试信息详情</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal update_emp_form">
						<div class="form-group">
							<label for="update_static_empName" class="col-sm-2 control-label">应聘者:</label>
							<div class="col-sm-8">
								<p class="form-control-static" id="username" name="username"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="update_department" class="col-sm-2 control-label">投递时间</label>
							<div class="col-sm-4">
								<p class="form-control-static" id="delivertime" name="delivertime"></p>
							</div>
						</div>
						
						<div class="form-group">
							<label for="update_department" class="col-sm-2 control-label">面试状态</label>
							<div class="col-sm-4">
								<p class="form-control-static" id="isinterview" name="isinterview"></p>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success interview_ageree_btn">录用</button>
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
	
	 $(".interview_ageree_btn").click(function () {
	    var interviewId = $(this).attr("interviewid");
	    var isinterview = $(this).attr("isinterview");
	    var isval = $(this).attr("isval");
	    var empName = $(this).attr("empname");
	    if(isinterview=="未面试"){
	    	alert(empName+" 还没有面试，还不能录用！");
	    	$(".view-update-modal").modal("hide");
	    	return ;
	    }
	    if(isval=="录用"){
	    	alert(empName+" 已经录用了！");
	    	$(".view-update-modal").modal("hide");
	    	return ;
	    }
	 	 $.ajax({
            url:"updateoffer/"+interviewId,
            type:"PUT",
            success:function (result) {
                if (result.code==100){
                    alert("员工录取成功！");
                    $(".view-update-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${pageInfo.pageNum};
                    window.location.href="getInterList?pageNo="+curPage;
                }else {
                    alert(result.extend.emp_update_error);
                }
            }
        });
	 	
	 });

</script>

</html>
