<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여지급내역(직원별)</title>
<script>

	$(document).ready(function(){
	
		headerSort("salListTable", 0);

		setTableTrBgColor(
				"salListTable",	//테이블 class 값
				"${headerColor}",			//헤더 tr 배경색
				"${oddTrColor}",		//홀수행 배경색
				"${evenTrColor}",	//짝수행 배경색
				"${mouseOverColor}"			//마우스 온 시 배경색
			);
			
		
	
		$('[name=rowCntPerPage]').change(function(){
			goSearch();
		});
		
		$(".pagingNumber").html(
				getPagingNumber(
					"${emp_tot_cnt}"						//검색 결과 총 행 개수
					,"${salListSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
					,"${salListSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
					,"10"										//페이지 당 보여줄 페이지번호 개수
					,"goSearch();"						//페이지 번호 클릭 후 실행할 자스코드
				)
			);
	
		inputData('[name=rowCntPerPage]',"${salListSearchDTO.rowCntPerPage}");
		inputData('[name=selectPageNo]',"${salListSearchDTO.selectPageNo}");
	});

	function goSearch() {
		document.empSalSearchForm.submit();
	}

	function viewEmpSalInfo(emp_no) {

		document.salListForm.submit();
	}

	function goApproval() {
		alert("결재");
	}

	function goChart() {
		location.replace("/group4erp/viewEmpAvgSalChart.do");
	}

</script>

</head>
<body><center>
	<h1>${timeDTO.now_year}년도&nbsp;${timeDTO.now_month-1}월분 급여대장</h1>
	
	지급일 : ${timeDTO.now_year}년 ${timeDTO.now_month-1}월 25일	&nbsp;&nbsp;단위 [만원]
	
	<form name="empSalSearchForm" method="post" action="/group4erp/viewSalList.do">
	[검색어]<input type="text" name="searchKeyword">&nbsp;&nbsp;<input type="button" value="검색" onClick="goSearch();">

	&nbsp;&nbsp;<input type="button" value="모두검색" onClick="goSearchAll();">
	 <table border=0 width=700>
	 	<tr>
	    	<td align=right>
	        [총원] : ${emp_tot_cnt} 명&nbsp;&nbsp;&nbsp;&nbsp;
	            <select name="rowCntPerPage">
	               <option value="10">10</option>
	               <option value="15">15</option>
	               <option value="20">20</option>
	               <option value="25">25</option>
	               <option value="30">30</option>
	            </select> 행보기
      </table>
     <input type="hidden" name="selectPageNo">
    </form>
      
	<div id="blankArea"><br></div>
	
		<table class="salListTable tbcss1" name="salListTable" cellpadding="5" cellspacing="5">			
			<tr>
				<th rowspan="2">직책 </th><th rowspan="2">성명</th><th colspan="6">지급내역</th><th colspan="7">공제내역</th><th rowspan="2">실수령액</th>
			</tr>
			
			<tr>
				<!-- 지급내역 목록 -->
				<td>기본급 </td> <td>식대 </td><td>초과근무수당</td><td>성과수당</td><td>차량유지비</td><td>합계</td>
				<!-- 공제내역 목록-->
				<td>갑근세 </td> <td>주민세 </td><td>고용보험</td><td>건강보험</td><td>국민연금</td><td>기타</td><td>합계</td>
			</tr>
			
			<c:forEach items='${empSalList}' var="empSal" varStatus="loopTagStatus">
				<tr style="cursor:pointer" onClick="viewEmpSalInfo(${empSal.emp_no});">
					<td>${empSal.jikup}</td><td>${empSal.emp_name}</td><td>${empSal.salary}</td><td>${sikdae}</td> <td> </td> <td> </td> <td>${car_care}</td> <td>${empSal.real_sal}</td><td>${empSal.income}</td><td>${empSal.resident}</td><td>${empSal.emp_insurance}</td><td>${empSal.health_care }</td> <td>${empSal.annuity}</td> <td>.</td><td>${empSal.deduct_sal}</td><td>${empSal.final_sal}</td>
				</tr>
			</c:forEach>
	
		</table>
		<br>
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div><br>
				
		<input type="button" value="결재" onClick="goApproval();">
		<input type="button" value="차트보기" onClick="goChart();">
			
</center>

</body>
</html>