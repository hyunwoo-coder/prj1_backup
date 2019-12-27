<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태 조회</title>
<script>
	$(document).ready(function(){
		$('[name=rowCntPerPage]').change(function(){
			goWorkStateListSearch();
		});
		$('[name=searchEmpNo]').change(function(){
			goWorkStateListSearch();
		});
		
		$(".pagingNumber").html(
				getPagingNumber(
					"${workDaysListAllCnt}"						//검색 결과 총 행 개수
					,"${myWorkSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
					,"${myWorkSearchDTO.rowCntPerPage}"			//페이지 당 출력행의 개수
					,"10"										//페이지 당 보여줄 페이지번호 개수
					,"goWorkStateListSearch();"								//페이지 번호 클릭 후 실행할 자스코드
				)
			);
		inputData("[name=selectPageNo]", "${myWorkSearchDTO.selectPageNo}");
		inputData("[name=rowCntPerPage]", "${myWorkSearchDTO.rowCntPerPage}");
		inputData("[name=searchEmpNo]", "${myWorkSearchDTO.searchEmpNo}");
	});
	function goWorkStateListSearch(){
		document.workStateListSearch.submit();
		/* 
		$.ajax({
			url : "/group4erp/goMyWorkTime.do"
			, type : "post"
			, data : document.mycarebooklist.submit()
		});
		 */
	}
</script>

</head>
<body><center>
	<h1>[근태 조회]</h1><br>
	<form name="workStateListSearch" method="post" action="/group4erp/goMyWorkTime.do">
		<table border=0 width=70% align=center>
			<select name="searchEmpNo">
				<option value="0">전체
				<c:forEach items="${requestScope.searchEmpNo}" var="searchEmpNo" varStatus="loopTagStatus">
				<option value="${searchEmpNo.emp_no}">${searchEmpNo.emp_no}
				</c:forEach>
			</select>
		</table>
		<table border=0 width=70%>
			<tr>
				<td align=right>
					[총 개수] : ${workDaysListAllCnt}&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="rowCntPerPage">
						<option value="10">10
						<option value="15">15
						<option value="20">20
						<option value="25">25
						<option value="30">30
					</select> 행보기
		</table>
		<input type="hidden" name="selectPageNo">
	</form>
	<form name="workDaysMng" method="post" action="/group4erp/workDaysList.do">
		<table class="tbcss1" name="workDayStateList" cellpadding="5" cellspacing="5" width=70%>
			<thead>
				<tr>
					<th>직원번호
					<th>이름
					<th>부서
					<th>직급
					<th>출근일수
					<th>결근일수
					<th>조퇴일수
					<th>외근일수
					<th>지각일수
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${requestScope.getWorkDaysList}" var="getWorkDaysList" varStatus="loopTagStatus">
					<tr>
						<td align=center>${getWorkDaysList.EMP_NO}
						<td align=center>${getWorkDaysList.emp_name}
						<td align=center>${getWorkDaysList.dep_name}
						<td align=center>${getWorkDaysList.jikup}
						<td align=center>${getWorkDaysList.days_attended}일
						<td align=center>${getWorkDaysList.days_absent}일
						<td align=center>${getWorkDaysList.days_leaving_early}일
						<td align=center>${getWorkDaysList.days_outduty}일
						<td align=center>${getWorkDaysList.days_late}일
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<table><tr height=10><td></table>
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
	</form>

</center>
</body>
</html>