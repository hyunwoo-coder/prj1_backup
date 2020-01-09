<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여명세서(직원별)</title>
<script>
	$(document).ready(function() {

		setTableTrBgColor(
				"empSalInfo",	//테이블 class 값
				"${headerColor}",			//헤더 tr 배경색
				"${oddTrColor}",		//홀수행 배경색
				"${evenTrColor}",	//짝수행 배경색
				"${mouseOverColor}"			//마우스 온 시 배경색
		);
	});
		
</script>
</head>
<body><center>
	
	<h1>[급여 지급 내역]</h1><br>
	직책 : ${jikup}	&nbsp;&nbsp; 성명 :${emp_name}  <br>
	<table class="empSalInfo tab" name="empSalInfo" cellpadding="5" cellspacing="5" width="60%">
		<tr align="center">
			<th rowspan="2">지급일 </th><th colspan="3">지급내역</th><th colspan="5">공제내역</th><th rowspan="2">실수령액</th>
		</tr>
		<tr align="center">
			<!-- 지급내역 목록 -->
			<td>기본급 </td> <td>식대 </td><td>보너스</td><td>합계</td>
			<!-- 공제내역 목록-->
			<td>고용보험</td><td>건강보험</td><td>국민연금</td><td>합계</td>
		</tr>
			
	
		<c:forEach items='${myPayCheckList}' var="myPayCheckList" varStatus="loopTagStatus">
			<tr align="center">	
				<td>${myPayCheckList.salary_dt}</td>
				<td>${myPayCheckList.month_sal}</td>
				<td>${myPayCheckList.mess_allowance}</td>
				<td>
					<c:if test="${myPayCheckList.bus_trip_bonus eq null}">
					0
					</c:if>
					
					<c:if test="${!(myPayCheckList.bus_trip_bonus eq null)}">
					${myPayCheckList.bus_trip_bonus}
					</c:if>
				</td>
				<td>${myPayCheckList.sum_payable}</td>
				
				<td>${myPayCheckList.emp_insurance}</td>
				<td>${myPayCheckList.health}</td>
				<td>${myPayCheckList.pension}</td> 
				<td>${myPayCheckList.deduct} </td>
				<td>${myPayCheckList.real_sal}</td>
			</tr>
		
		 </c:forEach>
			
	</table>
	<h5>귀하의 노고에 감사드립니다.</h5>
</center>

</body>
</html>