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

				<!-- 资料修改模态框 -->
				<div>
					<h4 class="modal-title" id="eventModalLabel">资料修改</h4>
					<!-- 压入User -->
					<s:push value="#session.user">

						<form class="form-horizontal" method="post"
							action="user/modify-info">

							<div class="modal-body">

								<div class="form-group">
									<label class="col-md-3 control-label">会员名</label>
									<div class="col-md-6">
										<input type="text" class="form-control"
											name="modifiedUser.newUserName"
											value='<s:property value="name"/>'>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 control-label">原密码</label>
									<div class="col-md-6">
										<input type="text" class="form-control"
											name="modifiedUser.oldPassword">
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 control-label">新密码</label>
									<div class="col-md-6">
										<input type="text" class="form-control"
											name="modifiedUser.newPassword">
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 control-label">新密码确认</label>
									<div class="col-md-6">
										<input type="text" class="form-control"
											name="modifiedUser.confirmPassword">
									</div>
								</div>
							</div>

							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">确认修改</button>
							</div>
						</form>

					</s:push>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
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
