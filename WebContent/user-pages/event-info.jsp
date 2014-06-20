<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<base href="${pageContext.request.contextPath}/">

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/general.css">
<link rel="stylesheet" href="css/banner.css">
<link rel="stylesheet" href="css/event.css">

<style type="text/css">
.modal-body {
	font-size: 1.3em;
}
</style>
<title>Health Club</title>
</head>

<body>

	<s:include value="navbar.jsp" />

	<!-- 页面主体 -->
	<div class="container">
		<div class="row">
			<!-- 左侧栏 -->
			<div class="col-md-3">

				<s:include value="sidenav.jsp" />

			</div>
			<!-- 左侧栏End -->


			<!-- 右侧主体 -->
			<div class="col-md-9">
				<!-- 广告 -->
				<div class="row">
					<div class="banner">
						<p class="banner-word">自分の限界をしりたいのか？</p>
					</div>
				</div>

				<!-- 正文 -->
				<div class="row">
					<div class="page-header">

						<p class="page-title">&diams;活动信息</p>
					</div>
					<div class="modal-body">
						<p>
							主题：
							<s:property value="#request.event.title" />
						</p>

						<p>
							----
							<s:property value="#request.event.detail" />
						</p>

						<p>
							已预约人数：
							<s:property value="#request.event.currentPeople" />
						</p>

						<table class="table">
							<thead>
								<tr>
									<th>场次</th>
									<th>时间</th>
									<th>教练</th>
									<th>地点</th>
								</tr>
							</thead>

							<tbody>
								<s:iterator var="item" value="#request.event.occasions"
									status="status">
									<tr>
										<td><s:property value="#status.index+1" /></td>
										<td><s:property value="#item.stringTime" /></td>
										<!-- <td>Coach Place Holder</td>  -->

										<td><s:property value="#item.coach.name" /></td>

										<td><s:property value="#item.place.place" /></td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<form action="user/reserve-event" method="post">
							<input type="hidden" name="eventId"
								value='<s:property value="#request.event.id"/>'>

							<s:if test="reserved">
								<button type="submit" class="btn btn-primary">取消预约</button>
								<input type="hidden" name="toReserve" value="false">
							</s:if>

							<s:else>
								<button type="submit" class="btn btn-primary">预约</button>
								<input type="hidden" name="toReserve" value="true">
							</s:else>
						</form>

					</div>
				</div>

			</div>
		</div>
	</div>


	<!--<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>-->

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>



</body>
</html>