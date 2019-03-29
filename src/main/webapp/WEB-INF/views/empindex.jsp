<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="人力资源管理平台" />
<title>人力资源管理平台</title>
<link type="text/css" rel="stylesheet" href="<%=basePath%>res/css/css.css" />
 <link href="<%=basePath%>res/fullcalendar/fullcalendar.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="<%=basePath%>res/js/jquery-1.12.4.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="<%=basePath%>res/fullcalendar/fullcalendar.js"></script>
  <script src="<%=basePath%>res/fullcalendar/gcal.js"></script>
</head>
<body>



	<div class="header">
		<div class="top">
			<img class="logo" src="<%=basePath%>res/images/logo.jpg" />
			<ul class="nav">
				<li class="seleli"><a href="#">首页</a></li>
				<li><a href="#">个人中心</a></li>
				<li><a href="#">绩效管理</a></li>
				<li><a href="#">人事管理</a></li>
				<li><a href="#">薪酬管理</a></li>
			</ul>
		</div>
	</div>

	<div class="container">
		<div class="leftbar">
			<div class="lm01">
				<img class="peptx" src="<%=basePath%>res/images/tximg.jpg" />
				<div class="pepdet">
					<p class="pepname">${emp.empName }</p>
					<p>部门:${emp.dept.deptName }</p>
					<p>职位:${emp.position.positionName }</p>
				</div>
				<div class="clear"></div>
			</div>

			<div class="lm02">
				<div class="title">
					<img class="icon" src="<%=basePath%>res/images/dataicon.jpg" />
					<h2>日历</h2>
				</div>
				<div class="detail" id="calendar">
					<%-- <img class="" src="<%=basePath%>res/images/kj_01.jpg" /> --%>
					
				</div>
			</div>
			<%--
    <div class="lm03">
      <div class="title"><img style="padding-right:5px;" class="icon" src="<%=basePath%>res/images/weaicon.jpg" />
        <h2>天气</h2>
      </div>
      <div class="detail"> <img class="" src="<%=basePath%>res/images/kj_02.jpg" /> </div>
    </div> --%>
		</div>

		<div class="mainbody">
			<div class="currmenu">
				<ul class="rig_nav">
					<li class="rig_seleli"><a href="#">当前</a><span> x </span></li>
					<li><a href="#">个人中心</a></li>
					<li><a href="#">绩效管理</a></li>
					<li><a href="#">绩效计划制定</a></li>
				</ul>
			</div>
			<div class="adtip">
				<div class="tip">
					<p class="goom">早上好，${emp.empName }！</p>
					<p>
						您目前有<span>0</span>条待办，<span>1</span>条考勤异常，<span>0</span>条通知！
					</p>
				</div>
				<div class="adv">
					<p>公司统一公告在这边展示</p>
					<span> x </span>
				</div>
			</div>
			<div>上下班打卡</div>
			<div class="rig_link">
				<ul>
					<li><a href="#"><img
							src="<%=basePath%>res/images/img_01.jpg" alt="上班打卡" title=""
							id="startwork"></a></li>
					<li><a href="#"><img
							src="<%=basePath%>res/images/img_02.jpg" alt="" title=""
							id="endwork"></a></li>
					<%-- <li><a href="#"><img src="<%=basePath%>res/images/img_03.jpg" alt="" title=""></a></li>
        <li><a href="#"><img src="<%=basePath%>res/images/img_04.jpg" alt="" title=""></a></li> --%>
				</ul>
			</div>
			<div class="rig_lm01">
				<div class="title">
					<img src="<%=basePath%>res/images/listicon.jpg" class="icon"
						style="padding-top:13px;">
					<h2>通知</h2>
					<span class="red_numb">2</span>
				</div>
				<div class="detail">
					<div class="dat01">
						<span class="datti"><span>20</span> <br /> <span
							class="jan">jan</span></span> <span class="sqdeta"><img
							src="<%=basePath%>res/images/bs_03.jpg">
							您想王晓磊提交的换班申请已经通过，交换班次时间为2018-10-29 09:00-18:00，请按时上班！</span>
						<p class="linkbut">
							<a href="#">加入日历</a><a href="#">查看</a><a href="#">知道了</a>
						</p>
					</div>
					<div class="dat02">
						<span class="datti"><span>20</span> <br /> <span
							class="jan">jan</span></span> <span class="sqdeta"><img
							src="<%=basePath%>res/images/bs_04.jpg"> 您提交的请假申请未审批通过</span>
						<p class="linkbut">
							<a href="#">查看</a><a href="#">知道了</a>
						</p>
					</div>
				</div>
			</div>

			<%-- <div class="rig_lm02">
      <div class="title"><img src="<%=basePath%>res/images/listicon.jpg" class="icon" style="padding-top:13px;">
        <h2>绩效打分进度</h2>
      </div>
      <div class="detail">
        <div class="det_inner">
          <div class="jd"><img src="<%=basePath%>res/images/jd.jpg" alt="" title=""></div>
          <div class="bs">
            <p><img src="<%=basePath%>res/images/bs_01.jpg" alt="" title=""> 已完成打分</p>
            <p><img src="<%=basePath%>res/images/bs_02.jpg" alt="" title=""> 未完成打分和异常打分</p>
          </div>
          <div class="scordeti">
            <ul>
              <li>
                <p class="ywc">1120</p>
                <h3>已完成打分人数</h3>
              </li>
              <li>
                <p class="wwc">11</p>
                <h3>未打分人数</h3>
              </li>
              <li>
                <p class="ycd">2</p>
                <h3>异常打分人数</h3>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div> --%>

			<div class="rig_lm03">
				<div class="title">
					<img src="<%=basePath%>res/images/listicon.jpg" class="icon"
						style="padding-top:13px;">
					<h2>待办事项</h2>
				</div>
				<div class="detail">
					<div class="inner03">
						<div id="tabCot_product" class="zhutitab">

							<div class="tabContainer">
								<ul class="tabHead" id="tabCot_product-li-currentBtn-">
									<li class="currentBtn"><a href="javascript:void(0)"
										title="出勤考核" rel="1">出勤考核</a><!-- <span class="grey_numb">12</span> --></li>
									<li><a href="javascript:void(0)" title="人事考核" rel="2">部门基友</a>
									<!-- <span class="red_numb">2</span> --></li>
									<li><a href="javascript:void(0)" title="公司部门" rel="3">公司部门</a><!-- <span
										class="red_numb">5</span> --></li>
									<li><a href="javascript:void(0)" title="公司职位" rel="4">公司职位</a><!-- <span
										class="red_numb">5</span></li> -->
									<li><a href="javascript:void(0)" title="公司培训" rel="5">公司培训</a>
									<!-- <span class="red_numb">5</span></li> -->
									<li><a href="javascript:void(0)" title="我的奖惩" rel="6">奖惩</a><!-- <span
										class="red_numb">5</span></li> -->
									<li><a href="javascript:void(0)" title="我的奖惩" rel="7">薪资</a><!-- <span
										class="red_numb">5</span></li> -->
										
								</ul>
								<p class="shent">
									<span>Show entries: </span> <input style="width:30px;"
										type="text" value="10"> <img
										src="<%=basePath%>res/images/sz.jpg" class="icon" style="">
								</p>
								<div class="clear"></div>
							</div>

							<div id="tabCot_product_1" class="tabCot">
								<table class="tabindex" width="100%" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<th width="10%" bgcolor="#f8f8f8" scope="col"><div
												align="center">编号</div></th>
										<th width="21%" bgcolor="#f8f8f8" scope="col"><span
											class="titlab"><div align="center">上班打卡时间</span><span
											class="xila"></span></th>
										<th width="22%" bgcolor="#f8f8f8" scope="col"><span
											class="titlab"><div align="center">下班打卡时间</span><span
											class="xila"></span></th>
										<th width="21%" bgcolor="#f8f8f8" scope="col"><div
												align="center">
												状态</span><span class="xila"></span></th>
										<th width="7%" bgcolor="#f8f8f8" scope="col"><span
											class="titlab"><div align="center">是否迟到</span><span
											class="xila"></span></th>
										<th width="7%" bgcolor="#f8f8f8" scope="col"><span
											class="titlab"><div align="center">是否缺席</span><span
											class="xila"></span></th>
										<th width="19%" bgcolor="#f8f8f8" scope="col">操作</th>
									</tr>

									<c:forEach items="${checklist }" var="check">
										<tr>
											<td bgcolor="#FFFFFF"><div align="center">${check.id }</td>
											<td bgcolor="#FFFFFF"><fmt:formatDate
													pattern="yyyy-MM-dd HH:mm:ss" value="${check.starttime}" /></td>
											<td bgcolor="#FFFFFF"><fmt:formatDate
													pattern="yyyy-MM-dd HH:mm:ss" value="${check.endtime}" /></td>
											<td bgcolor="#FFFFFF"><div align="center">${check.status }</td>
											<td class="yccol" bgcolor="#FFFFFF">${check.islate==0?"迟到":"正常出勤" }</td>
											<td class="yccol" bgcolor="#FFFFFF">${check.isabsent==0?"缺勤":"正常出勤" }</td>
											<td class="czcol" bgcolor="#FFFFFF"><a href="#">提醒处理</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
												href="#">查看</a></td>
										</tr>

									</c:forEach>

								</table>

								<div class="fanye">
									<p class="fytip">Showing 1 to 10 of 12 entries</p>
									<div class="yem">
										<ul>
											<li><a href="#">First</a></li>
											<li><a href="#">&lt;</a></li>
											<li class="sellify"><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">&gt;</a></li>
											<li><a href="#">Last</a></li>
										</ul>
									</div>
								</div>

							</div>

							<div id="tabCot_product_2" class="tabCot" style="display: none;">

								<table class="tabindex" width="100%" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<th width="10%" bgcolor="#f8f8f8" scope="col"><div
												align="center">员工编号</div></th>
										<th width="16%" bgcolor="#f8f8f8" scope="col"><div align="center">员工姓名</span><span
											class="xila"></span></th>
										<th width="16%" bgcolor="#f8f8f8" scope="col"><div
												align="center">
												员工状态</span><span class="xila"></span></th>
										<th width="17%" bgcolor="#f8f8f8" scope="col"><div align="center">员工职位</span><span
											class="xila"></span></th>
										<th width="19%" bgcolor="#f8f8f8" scope="col">操作</th>
									</tr>

									<c:forEach items="${empbydeptid }" var="emp">
										<tr>
											<td bgcolor="#FFFFFF"><div align="center">${emp.empId }</td>
											<td bgcolor="#FFFFFF"><div align="center">${emp.empName}</td>
											<td bgcolor="#FFFFFF"><div align="center">${emp.status==0?"在职":"离职"}</td>
											<td bgcolor="#FFFFFF"><div align="center">${emp.position.positionName}</td>
											<td class="czcol" bgcolor="#FFFFFF"><a href="#">提醒处理</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
												href="#">查看信息</a></td>
										</tr>
									</c:forEach>

								</table>

							</div>
							<!-- 公司部门 -->
							<div id="tabCot_product_3" class="tabCot" style="display: none;">

								<table class="tabindex" width="100%" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<th width="10%" bgcolor="#f8f8f8" scope="col"><div
												align="center">部门编号</div></th>
										<th width="21%" bgcolor="#f8f8f8" scope="col"><div align="center">部门名称</span><span
											class="xila"></span></th>
										<th width="21%" bgcolor="#f8f8f8" scope="col"><div
												align="center">
												部门老大</span><span class="xila"></span></th>
										
										<th width="19%" bgcolor="#f8f8f8" scope="col">操作</th>
									</tr>

									<c:forEach items="${deptlist }" var="dept">
										<tr>
											<td bgcolor="#FFFFFF"><div align="center">${dept.deptId }</td>
											<td bgcolor="#FFFFFF"><div align="center">${dept.deptName}</td>
											<td bgcolor="#FFFFFF"><div align="center">${dept.emp.empName}</td>
											<td class="czcol" bgcolor="#FFFFFF"><a href="#">提醒处理</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
												href="#">查看信息</a></td>
										</tr>
									</c:forEach>

								</table>

							</div>

						<!-- 公司职位 -->
							<div id="tabCot_product_4" class="tabCot" style="display: none;">

								<table class="tabindex" width="100%" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<th width="10%" bgcolor="#f8f8f8" scope="col"><div
												align="center">职位编号</div></th>
										<th width="21%" bgcolor="#f8f8f8" scope="col"><div align="center">职位名称</span><span
											class="xila"></span></th>
										<th width="21%" bgcolor="#f8f8f8" scope="col"><div
												align="center">
												创建时间</span><span class="xila"></span></th>
										<th width="21%" bgcolor="#f8f8f8" scope="col"><div
												align="center">
												所属部门</span><span class="xila"></span></th>
										<th width="19%" bgcolor="#f8f8f8" scope="col"><div align="center">操作</th>
									</tr>

									<c:forEach items="${poslist }" var="pos">
										<tr>
											<td bgcolor="#FFFFFF"><div align="center">${pos.positionId }</td>
											<td bgcolor="#FFFFFF"><div align="center">${pos.positionName}</td>
											<td bgcolor="#FFFFFF"><div align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${pos.creatTime}"/></td>
											<td bgcolor="#FFFFFF"><div align="center">${pos.dept.deptName}</td>
											<td class="czcol" bgcolor="#FFFFFF"><a href="#">提醒处理</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
												href="#">查看信息</a></td>
										</tr>
									</c:forEach>

								</table>
								
							</div>

							<!-- 公司培训 -->
							<div id="tabCot_product_5" class="tabCot" style="display: none;">

								<table class="tabindex" width="100%" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<th width="10%" bgcolor="#f8f8f8" scope="col"><div
												align="center">培训编号</div></th>
										<th width="16%" bgcolor="#f8f8f8" scope="col"><div align="center">培训内容</span><span
											class="xila"></span></th>
										<th width="16%" bgcolor="#f8f8f8" scope="col"><div
												align="center">
												培训时间</span><span class="xila"></span></th>
										<th width="16%" bgcolor="#f8f8f8" scope="col"><div
												align="center">
												所属部门</span><span class="xila"></span></th>
													<th width="21%" bgcolor="#f8f8f8" scope="col"><div
												align="center">
												职位</span><span class="xila"></span></th>
										<th width="19%" bgcolor="#f8f8f8" scope="col">操作</th>
									</tr>

									<c:forEach items="${alltrain }" var="pos">
										<tr>
											<td bgcolor="#FFFFFF"><div align="center">${pos.trainId }</td>
											<td bgcolor="#FFFFFF"><div align="center">${pos.content}</td>
											<td bgcolor="#FFFFFF"><div align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${pos.time}"/></td>
									
											<td bgcolor="#FFFFFF"><div align="center">${pos.dept.deptName}</td>
											<td bgcolor="#FFFFFF"><div align="center">${pos.position.positionName}</td>
											<td class="czcol" bgcolor="#FFFFFF"><a href="#" id="join_train" edid-train="${pos.trainId }" edid-content="${pos.content}" >报名参加</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
												href="#">查看信息</a></td>
										</tr>
									</c:forEach>

								</table>
								
							</div>
							
							<!-- 公司部门 -->
							<div id="tabCot_product_7" class="tabCot" style="display: none;">

								<table class="tabindex" width="100%" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<th width="10%" bgcolor="#f8f8f8" scope="col"><div
												align="center">编号</div></th>
										<th width="11%" bgcolor="#f8f8f8" scope="col"><div align="center">时间</span><span
											class="xila"></span></th>
										<th width="11%" bgcolor="#f8f8f8" scope="col"><div
												align="center">
												基本工资</span><span class="xila"></span></th>
										<th width="11%" bgcolor="#f8f8f8" scope="col"><div
												align="center">
												绩效</span><span class="xila"></span></th>
										<th width="11%" bgcolor="#f8f8f8" scope="col"><div
												align="center">
												社保</span><span class="xila"></span></th>
										<th width="11%" bgcolor="#f8f8f8" scope="col"><div
												align="center">
												奖惩</span><span class="xila"></span></th>
										<!-- <th width="11%" bgcolor="#f8f8f8" scope="col"><div
												align="center">
												是否有异议</span><span class="xila"></span></th> -->
										<th width="11%" bgcolor="#f8f8f8" scope="col"><div
												align="center">
												是否处理</span><span class="xila"></span></th>
										<th width="16%" bgcolor="#f8f8f8" scope="col">操作</th>
									</tr>

									<c:forEach items="${salarylist }" var="salary">
										<tr>
											<td bgcolor="#FFFFFF"><div align="center">${salary.id }</td>
											<td bgcolor="#FFFFFF"><div align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${salary.time}"/></td>
											<td bgcolor="#FFFFFF"><div align="center">${salary.base }</td>
											<td bgcolor="#FFFFFF"><div align="center">${salary.achievement }</td>
											<td bgcolor="#FFFFFF"><div align="center">${salary.socialsec }</td>
											<td bgcolor="#FFFFFF"><div align="center">${salary.rewardPunish.money }</td>
											<%-- <td bgcolor="#FFFFFF"><div align="center">${salary.disgree==0?"无异议":"有异议"}</td> --%>
											<td bgcolor="#FFFFFF"><div align="center">${salary.ishandle==0?"已处理":"没处理"}</td>
											<td class="czcol" bgcolor="#FFFFFF"><a href="toobjectionSalary" data-toggle="modal" data-target=".salarydisagree-add-modal" id="salarydisagree">工资异议</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
												href="#">查看信息</a></td>
										</tr>
									</c:forEach>

								</table> 

							</div>
							
							
						<div id="tabCot_product_6" class="tabCot" style="display: none;">

								<table class="tabindex" width="100%" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<th width="10%" bgcolor="#f8f8f8" scope="col"><div
												align="center">编号</div></th>
										<th width="21%" bgcolor="#f8f8f8" scope="col"><div align="center">金额</span><span
											class="xila"></span></th>
										<th width="21%" bgcolor="#f8f8f8" scope="col"><div
												align="center">
												时间</span><span class="xila"></span></th>
										<th width="21%" bgcolor="#f8f8f8" scope="col"><div
												align="center">
												原因</span><span class="xila"></span></th>
										<th width="19%" bgcolor="#f8f8f8" scope="col"><div align="center">操作</th>
									</tr>

									<c:forEach items="${rplist }" var="rp">
										<tr>
											<td bgcolor="#FFFFFF"><div align="center">${rp.id }</td>
											<td bgcolor="#FFFFFF"><div align="center">${rp.money}</td>
											<td bgcolor="#FFFFFF"><div align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${rp.time}"/></td>
											<td bgcolor="#FFFFFF"><div align="center">${rp.reason}</td>
											<td class="czcol" bgcolor="#FFFFFF"><a href="#">提醒处理</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
												href="#">查看信息</a></td>
										</tr>
									</c:forEach>

								</table>
								
							</div>

							<script language="JavaScript" type="text/javascript"
								src="<%=basePath%>res/js/tab.js"></script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer"></div>
	
	<%-- <%@ include file="./jsp/salarydisagreePage.jsp"%> --%>
	
</body>
<script type="text/javascript">

	$("#startwork").click(function() {

		alert("ok");

		$.ajax({
			url : "startwork",
			type : "GET",
			success : function(result) {
				if (result.code == 100) {
					alert("上班打卡成功！");
					window.location.reload();
				} else {
					alert(result.extend.startwork_error);

				}
			}
		});

	});


	$("#endwork").click(function() {

		alert("endwork");
		$.ajax({
			url : "endwork",
			type : "GET",
			success : function(result) {
				if (result.code == 100) {
					alert("下打卡成功！");
					window.location.reload();
				} else {
					alert(result.extend.startwork_error);
				}
			}
		});


	});
</script>

<script>

	$(document).on("click","#join_train",function(){
		var trainId = $(this).attr("edid-train");
		var traincontent = $(this).attr("edid-content");
		
		 if (confirm("确认报名参加【" + traincontent+ "】的培训吗？")){
		 
		 	 $.ajax({
		 		url:"jointrain/"+trainId,
		 		type:"PUT",
		 		success:function(result){
		 			if(result.code==100){
		 				alert("参加成功！");
		 				window.location.reload();
		 			}else{
		 				alert("参加失败，请重新尝试！");
		 			}
		 		}
		 	
		 	}); 
		 }
		
	});


</script>

<script>
        $(function() {
            // Easy pie charts
            var calendar = $('#calendar').fullCalendar({
			header: {
				left: 'prev,next',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
            selectable: true,
            selectHelper: true,
            select: function(start, end, allDay) {
                var title = prompt('Event Title:');
                if (title) {
                    calendar.fullCalendar('renderEvent',
                        {
                            title: title,
                            start: start,
                            end: end,
                            allDay: allDay
                        },
                        true // make the event "stick"
                    );
                }
                calendar.fullCalendar('unselect');
            },
            droppable: true, // this allows things to be dropped onto the calendar !!!
            drop: function(date, allDay) { // this function is called when something is dropped
            
                // retrieve the dropped element's stored Event Object
                var originalEventObject = $(this).data('eventObject');
                
                // we need to copy it, so that multiple events don't have a reference to the same object
                var copiedEventObject = $.extend({}, originalEventObject);
                
                // assign it the date that was reported
                copiedEventObject.start = date;
                copiedEventObject.allDay = allDay;
                
                // render the event on the calendar
                // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
                
                // is the "remove after drop" checkbox checked?
                if ($('#drop-remove').is(':checked')) {
                    // if so, remove the element from the "Draggable Events" list
                    $(this).remove();
                }
                
            },
			editable: true,
			// US Holidays
			//events: 'http://www.google.com/calendar/feeds/usa__en%40holiday.calendar.google.com/public/basic'
			
			});
        });

</script>
</html>