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
		

		$('[name=rowCntPerPage]').change(function(){
			goSearch();
		});
	
		$(".pagingNumber").html(
			getPagingNumber(
				"${eventCnt}"						//검색 결과 총 행 개수
				,"${eventSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
				,"${eventSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
				,"10"										//페이지 당 보여줄 페이지번호 개수
				,"goSearch();"						//페이지 번호 클릭 후 실행할 자스코드
			)
		);

		inputData('[name=rowCntPerPage]',"${eventSearchDTO.rowCntPerPage}");
		inputData('[name=selectPageNo]',"${eventSearchDTO.selectPageNo}");
		inputData("[name=searchKeyword]", "${eventSearchDTO.searchKeyword}");

		<c:forEach items="${eventSearchDTO.evnt_category}" var="evnt_category">
			inputData("[name=evnt_category]", "${evnt_category}");
		</c:forEach>
		<c:forEach items="${eventSearchDTO.evnt_stat}" var="evnt_stat">
			inputData("[name=evnt_stat]", "${evnt_stat}");
		</c:forEach>
		
	});

	function reserveEvent() {
		//alert("이벤트 신청 페이지");
		location.replace("/group4erp/eventScheduling.do");
	}

	function goSearch() {
		//alert("검색 시작");
		//location.replace("/group4erp/viewEventList.do");
		
		
		document.searchEvntForm.submit();
	}

	</script>
</head>
<body><center>

	<h1>이벤트 현황</h1>
	<label> << 2019.12.24(화) >> [이벤트 총 횟수] : ${eventCnt}회 </label>
					<select name="rowCntPerPage">
						<option value="10">10
						<option value="15">15
						<option value="20">20
						<option value="25">25
						<option value="30">30
					</select>행보기 <br><br>
	
	<form name="searchEvntForm" method="post" action="/group4erp/viewEventList.do">
		<table name="searchEvntTable">
			<tr>
				<td>[검색어]</td><td><input type="text" name="searchKeyword">&nbsp;&nbsp;<input type="button" value="검색" onClick="goSearch();">&nbsp;&nbsp;<input type="button" value="모두검색" onClick="goSearchAll();"></td>
			</tr>
			<tr> <!-- DB 연동할 것 -->
				<td>[종류별]</td><td><input type="checkbox" value="01" name="evnt_category">매대판매
								<input type="checkbox" value="02" name="evnt_category">야외판매
								<input type="checkbox" value="03" name="evnt_category">할인전
								<input type="checkbox" value="04" name="evnt_category">기부행사
								<input type="checkbox" value="05" name="evnt_category">온라인 설문조사
								<input type="checkbox" value="06" name="evnt_category">저자강연회
								<input type="checkbox" value="07" name="evnt_category">선착순증정
				</td>
			</tr>
			<tr>
				<td>[상태별]</td><td><input type="checkbox" value="01" name="evnt_stat">대기중
									<input type="checkbox" value="03" name="evnt_stat">심사중
									<input type="checkbox" value="02" name="evnt_stat">진행중
									<input type="checkbox" value="04" name="evnt_stat">종료
				</td>
			</tr>
		</table>
		<input type="hidden" name="selectPageNo" >
	</form>
	
	<div>&nbsp; <span class="pagingNumber"></span>&nbsp;</div>
	<table>
		<tr height=10>
			<td></td>
		</tr>
	</table>
	
	<form name="eventScheduleForm" method="post" action="/group4erp/reserveEvent.do">
		<table class="eventListTable tbcss2" name="eventListTable" cellpadding="5" cellspacing="5" width="800">
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