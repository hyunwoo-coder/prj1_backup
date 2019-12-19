<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여지급내역(직원별)</title>
<script>
	function viewEmpSalInfo() {
		document.salListForm.submit();
	}

</script>

</head>
<body><center>
	<h1>[2019년도 11월분 급여대장]</h1>
	
	지급일 : 2019년 11월 25일
	<form name="salListForm" method="post" action="/group4erp/viewEmpSalInfo.do">
		<table class="tbcss1" name="salEmpList" cellpadding="5" cellspacing="5">
			<tr>
				<th rowspan="2">직책 </th><th rowspan="2">성명</th><th colspan="6">지급내역</th><th colspan="7">공제내역</th><th rowspan="2">실수령액</th>
			</tr>
			<tr>
				<!-- 지급내역 목록 -->
				<td>기본급 </td> <td>식대 </td><td>초과근무수당</td><td>성과수당</td><td>차량유지비</td><td>합계</td>
				<!-- 공제내역 목록-->
				<td>갑근세 </td> <td>주민세 </td><td>고용보험</td><td>건강보험</td><td>국민연금</td><td>기타</td><td>합계</td>
			</tr>
			
			<c:forEach items="${empSalList}" var="empSal" varStatus="loopTagStatus">
				<tr style="cursor:pointer" onClick="viewEmpSalInfo();">
					<td>${empSal.jikup}</td><td>${empSal.emp_name}</td><td>${empSal.salary}</td><td>${sikdae}</td> <td> </td> <td> </td> <td>${car_care}</td> <td>${empSal.real_sal}</td>
				
					<td>${empSal.income}</td><td>${empSal.resident}</td><td>${empSal.emp_insurance}</td><td>${empSal.health_care }</td> <td>${empSal.annuity}</td> <td>.</td><td>${empSal.deduct_sal}</td><td>${empSal.final_sal}</td>
				</tr>
			</c:forEach>
	
		</table>
		<br>
				[1][2][3][4][5][6][7][8][9][10]
	</form>


</center>

</body>
</html>