<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 행사 신청</title>
<script>

	$(document).ready(function(){
	
		headerSort("eventListTable", 0);

		setTableTrBgColor(
				"eventListTable",	//테이블 class 값
				"${headerColor}",			//헤더 tr 배경색
				"${oddTrColor}",		//홀수행 배경색
				"${evenTrColor}",	//짝수행 배경색
				"${mouseOverColor}"			//마우스 온 시 배경색
		);
		

		/*	$('[name=rowCntPerPage]').change(function(){
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
		inputData('[name=selectPageNo]',"${salListSearchDTO.selectPageNo}");*/
	});

	function reserveEvent() {
		//alert("이벤트 신청 페이지");
		location.replace("/group4erp/eventScheduling.do");
	}

	</script>
</head>
<body><center>

	<h1>이벤트 현황</h1><br>
	<< 2019.12.24(화) >> [이벤트 총 횟수] : ${eventCnt}회&nbsp;&nbsp;&nbsp;&nbsp;<br>
	
	<form name="searchEvntForm" method="post" action="/group4erp/searchEvntInfo.do">
	
		[검색어]<input type="text" name="searchKeyword">&nbsp;&nbsp;<input type="button" value="검색" onClick="goSearch();">
		&nbsp;&nbsp;<input type="button" value="모두검색" onClick="goSearchAll();"><br>
		[종류별]<input type="checkbox" value="01">매대판매
	
	</form>
	
	<form name="eventScheduleForm" method="post" action="/group4erp/reserveEvent.do">
		<table class="eventListTable tbcss2" name="eventListTable" cellpadding="5" cellspacing="5" width="700">
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
	
	</form>
	<input type="button" value="이벤트 신청" onClick="reserveEvent();">
	
</center>
</body>
</html>