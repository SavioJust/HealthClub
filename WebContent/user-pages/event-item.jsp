<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="event-item">
	<p>
		<span class="glyphicon glyphicon-hand-right"></span>

		<s:if test="reserved">
			<span class="label label-warning">已预约</span>
		</s:if>
	
	
		<a class="title" data-toggle="modal"
			data-target='#eventModal<s:property value="#status.index"/>'><s:property
				value="title" /></a>

		<!-- 迭代显示所有标签 -->
		<s:iterator var="tag" value="tags">
			<a href="#"> <span class="label label-success"><s:property
						value="#tag" /></span>
			</a>
		</s:iterator>

	</p>
	<p>
		已预约人数：
		<s:property value="currentPeople" />
	</p>
	<p>
		最近时间：
		<s:property value="latestTime" />
	</p>

	<div class="modal fade"
		id='eventModal<s:property value="#status.index"/>'
		aria-labelledby="eventModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="eventModalLabel">活动详情</h4>
				</div>

				<div class="modal-body">
					<p>
						主题：
						<s:property value="title" />
					</p>
					
					<p>
						----<s:property value="detail" />
					</p>
					
					<p>
						已预约人数：
						<s:property value="currentPeople" />
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
							<s:iterator var="item" value="occasions" status="status">
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
						<input type="hidden" name="eventId" value='<s:property value="id"/>'>
						
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

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
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</div>
