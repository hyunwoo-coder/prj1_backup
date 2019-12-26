 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script>
     

	 function goBusinessTripList(){
		location.replace("/group4erp/businessTripList.do");
	 }
	 
	 function reset(){
			document.businessTripForm.reset();
	 }
</script>	
	
<meta charset="UTF-8">
<title>출장신청&보고</title>
</head>
<body>
	<form name="businessTripForm" method="post" action="/group4erp/businessTripForm.do">
	<b>출장 신청서</b>
	<table class="tbcss1" name=work_outside_info cellpadding="5" cellspacing="5" width="700">
		<tr>
			<th colspan="">출장희망일</th>
				<td>
					<select id = "outside_start_time">
						<c:forEach var="i" begin="1990" end="2019">
    						<option	value="${i}" />${i}</option>
						</c:forEach>
					</select>
					-
					<select id = "outside_start_time">
						<c:forEach var="i" begin="1990" end="2019">
    						<option	value="${i}" />${i}</option>
						</c:forEach>
					</select>
					-
					<select id = "outside_start_time">
						<c:forEach var="i" begin="1990" end="2019">
    						<option	value="${i}" />${i}</option>
						</c:forEach>
					</select>
					~
					<input type="text" name="outside_end_time" id="outside_end_time">
					&nbsp;&nbsp;&nbsp;
				</td>
		</tr>
		
		<tr>
			<th>목적지</th>
				<td>
					<input type="text" size="100" name="destination">
				</td>
		</tr>
		
		<tr>
			<th>출장 사유</th>
				<td >
				<textarea name="work_outside_reason"  cols="50" rows="10" id="work_outside_reason" maxlanght="500"></textarea>
				</td>
		</tr>
	</table>
	<table>
	</table>
		<input type="button" calss="approval" value="결재" onClick="checkForm()">
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="초기화" onClick="reset()">
		
		<input type="button" value="목록보기" onClick="goBusinessTripList()">
	</form>
</body>
</html>