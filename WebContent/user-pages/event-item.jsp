<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="event-item">
	<p>
		<span class="glyphicon glyphicon-hand-right"></span>

		<s:if test="reserved">
			<span class="label label-warning">已预约</span>
		</s:if>
	
	
		<a href="user/get-event-info?eventID=<s:property value="id"/>"><s:property
				value="title" /></a></p>
		<p>
		标签：
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


</div>
