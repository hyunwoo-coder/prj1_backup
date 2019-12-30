<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원별 휴가현황</title>
	<script>

		$(document).ready(function(){
			
			$(".pagingNumber").html(
				getPagingNumber(
					"${getDayOffListCnt}"					//검색 결과 총 행 개수
					,"${hrListSearchDTO.selectPageNo}"		//선택된 현재 페이지 번호
					,"${hrListSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
					,"10"									//페이지 당 보여줄 페이지번호 개수
					,"goSearch();"							//페이지 번호 클릭 후 실행할 자스 코드
				)
			);
		});
	
		function goSearch(){
			document.empDayOffList.submit();
		}	
		
	</script>
</head>
<body><center>
	<h1>[직원 휴가 현황]</h1><br>
	 기준일 : 2019년 12월 24일(getTime 함수 사용 예정)
	 
	<form name="empDayOffList" method="post" action="/group4erp/viewEmpDayOffList.do">
		
		<table class="tbcss1" name="dayOffList" cellpadding="5" cellspacing="5" width="500">
			<thead>
				<tr>
					<th bgcolor="gray" style="cursor:pointer">소속 부서
					<th bgcolor="gray" style="cursor:pointer">직급
					<th bgcolor="gray" style="cursor:pointer">성명
					<th bgcolor="gray" style="cursor:pointer">휴가 종류
					<th bgcolor="gray" style="cursor:pointer">복귀 예정일
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${requestScope.getDayOffList}" var="dayoff" varStatus="loopTagStatus">
					<tr style="cursor:pointer">
						<%-- <td align=center>
							${boardListAllCnt - 
								(boardSearchDTO.selectPageNo*boardSearchDTO.rowCntPerPage-boardSearchDTO.rowCntPerPage+1+loopTagStatus.index)+1} --%>
						<td align=center> ${dayoff.dep_name}
						<td align=center> ${dayoff.jikup}
						<td align=center> ${dayoff.emp_name}
						<td align=center> ${dayoff.dayoff_name}
						<td align=center> ${dayoff.end_day_off}
					</tr>
				</c:forEach>
			</tbody>
		
		
		</table>
		
		<table><tr height=10><td></table>
		<input type="hidden" name="selectPageNo">
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
		<br><br><br>
		<c:if test="${empty getDayOffList}">
			금일은 휴가자가 없습니다.
		</c:if>
	
	</form>

</center>
</body>
</html>