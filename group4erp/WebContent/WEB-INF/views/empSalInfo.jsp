<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여명세서(직원별)</title>
</head>
<body><center>
	
	<h1>${timeDTO.now_year}년도 ${timeDTO.now_month}월달 급여명세서</h1><br>
	직책 : ${salaryInfo.jikup}	&nbsp;&nbsp; 성명 : ${salaryInfo.emp_name} <br>
	<table class="empSalInfo tab" name="empSalInfo" cellpadding="5" cellspacing="5">
		<tr>
			<th rowspan="2">지급일 </th><th colspan="3">지급내역</th><th colspan="5">공제내역</th><th rowspan="2">실수령액</th>
		</tr>
		<tr>
			<!-- 지급내역 목록 -->
			<td>기본급 </td> <td>식대 </td><td>수당</td><td>합계</td>
			<!-- 공제내역 목록-->
			<td>고용보험</td><td>건강보험</td><td>국민연금</td><td>합계</td>
		</tr>
			
		<tr>
			<td>${salaryInfo.salary_dt}</td><td>${salaryInfo.month_sal}</td><td>${salaryInfo.mess_allowance}</td><td>${salaryInfo.bus_trip_bonus}</td><td>${salaryInfo.sum_payable}</td>
				
			<td>${salaryInfo.emp_insurance}</td><td>${salaryInfo.health}</td><td>${salaryInfo.pension}</td> <td>${salaryInfo.deduct} </td> <td>${salaryInfo.real_sal}</td>
		</tr>
	</table>
	
</center>

</body>
</html>