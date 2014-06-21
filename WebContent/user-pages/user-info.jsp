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
<link rel="stylesheet" href="css/user.css">


<title>Health Club</title>

<style type="text/css">
#card-panel-group {
	margin-top: 50px;
}

/* 用于切换面板内的字体*/
.tab-content {
	font-size: 1.3em;
}

/* 激活面板 */
.panel {
	background-color: transparent;
}

.popover-title,.popover-content {
	color: black;
	font-size: 18px;
}

#active-panel {
	margin-bottom: 20px;
}

#recover-btn {
	color: white;
	background-color: #5CB85C;
	border-color: #5CB85C;
	margin-left: 15px;
}
</style>
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

					<div class="col-md-10">

						<!-- 输出返回信息 -->
						<s:if test="hasFieldErrors()">
							<s:iterator value="fieldErrors">
								<s:property value="value[0]" />
							</s:iterator>
						</s:if>

						<!-- 面板本体 -->
						<div class="info-tab">


							<div id="myTabContent" class="tab-content">
								<!-- 会员子面板 -->
								<div id="normal-card-info">
									<p class="nav nav-tabs info-tab-header">&diams;会员信息</p>
									<s:push value="#session.user">
										<s:if test="stringState=='未激活'">
											<s:include value="activate-membership.jsp">
												<s:param name="type">
													<s:property value="stringType" />
												</s:param>
											</s:include>
										</s:if>

										<p>
											&bull;
											<s:property value="stringType" />
											会员编号：
											<s:property value="code" />


										</p>
										<p>
											&bull;
											<s:property value="stringType" />
											会员名：
											<s:property value="name" />

											<a class="btn btn-default" href="user/user-info-edit">资料修改</a>

										</p>
										<p>
											&bull; 账户状态：
											<s:property value="stringState" />


											<!-- 如果状态是未激活那么就不应该有续费按钮 -->
											<s:if test="stringState=='已欠费'">
												<a id="recover-btn" class="btn btn-default"
													data-toggle="modal" data-target="#recoverModal">续费</a>
											</s:if>

										</p>


										<!-- 顾客详情列表 -->
										<div class="table-responsive">
											&bull; 顾客详细信息：
											<table class="table">
												<thead>
													<tr>
														<th></th>
														<th>姓名</th>
														<th>年龄</th>
														<th>性别</th>
														<th>居住地</th>
													</tr>
												</thead>
												<tbody>
													<!-- 迭代显示详细信息  -->
													<s:iterator var="detail" value="details" status="status">
														<tr>
															<td><span class="glyphicon glyphicon-user" /></td>
															<td><s:property value="#detail.realName" /></td>
															<td><s:property value="#detail.age" /></td>
															<td><s:property value="#detail.stringSex" /></td>
															<td><s:property value="#detail.livingPlace" /></td>
														</tr>
													</s:iterator>
												</tbody>
											</table>
										</div>

										<s:if test="stringState=='正常'">
											<form action="user/cancel-membership" method="post">
												<input type="hidden" value='<s:property value="id"/>' />
												<button class="btn btn-default" type="submit">会员注销
												</button>
											</form>
										</s:if>


									</s:push>
								</div>

								<!-- 活动记录子面板 -->

								<div id="event-history">
									<p class="nav nav-tabs info-tab-header">历史活动</p>
									<!-- 迭代显示所有内容 -->
									<s:iterator var="item" value="#request['closedEvents']"
										status="status">
										<s:include value="event-item-history.jsp"></s:include>
									</s:iterator>

								</div>

								<!-- 缴费记录子面板 -->
								<div id="payment-history">
									<p class="nav nav-tabs info-tab-header">缴费信息</p>
									<table class="table table-responsive">
										<thead>
											<tr>
												<th>编号</th>
												<th>付费时间</th>
												<th>金额</th>
											</tr>
										</thead>
										<tbody>
											<s:iterator var="item" value="#session.user.payments"
												status="status">
												<tr>
													<!-- 迭代显示所有内容 -->

													<td><s:property value="#status.index+1" /></td>
													<s:push value="#item">
														<td><s:property value="stringTime" /></td>
														<td><s:property value="amount" /></td>
													</s:push>

												</tr>
											</s:iterator>
										</tbody>
									</table>
								</div>

							</div>
						</div>
						<!-- 面板本体 End -->

					</div>

					<div class="col-md-2"></div>


					<!-- 缴费支援面板 -->
					<s:include value="recover-membership.jsp">
						<s:param name="modalId">recoverModal</s:param>
						<s:param name="type">个人</s:param>
					</s:include>

				</div>
			</div>
		</div>
	</div>


	<!--<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"
		type="text/javascript"></script>
	<script
		src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"
		type="text/javascript"></script>-->

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>


	<script type="text/javascript">
		$("#info-flag").attr("class", "active");
		$("#popover").popover();
	</script>

</body>
</html>
