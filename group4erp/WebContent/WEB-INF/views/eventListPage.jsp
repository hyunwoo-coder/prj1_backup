<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 행사 신청</title>
<script>

	function checkForm() {

		document.eventScheduleForm.submit();

	}

	</script>
</head>
<body><center>

	<h1>이벤트 현황</h1><br>
	<< 2019.12.24(화) >>
	<form name="eventScheduleForm" method="post" action="/group4erp/reserveEvent.do">
		<table class="tbcss2" cellpadding="5" cellspacing="5" width="700">
			<tr>
				<th>이벤트 번호</th><th>이벤트 종류</th><th>타이틀</th><th>시작일</th><th>종료일</th><th>상태</th>
			</tr>
			<tr>
			<c:forEach items="${eventList}" var="eventList" varStatus="loopTagStatus">
				<tr style="cursor:pointer" onClick="viewEventInfoForm(${empList.emp_no});">	
				<td align=center>${eventList.evnt_no}</td>	<!-- <input type="hidden" value="${dep_no}">  -->
				<td align=center>${eventList.evnt_category}</td>
				<td align=center>${eventList.evnt_title}</td>
				<td align=center>${eventList.evnt_start_dt}</td>
				<td align=center>${eventList.evnt_end_dt}</td>
				<td align=center>${eventList.evnt_stat}</td>
			</tr>		
			</c:forEach>
		</table><br>
	<input type="button" value="이벤트 신청" onnClick="reserveEvent();">
	</form>

	
</center>
</body>
</html>