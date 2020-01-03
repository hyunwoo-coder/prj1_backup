<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고신청현황</title>
<script>

	$(document).ready(function() {
		headerSort("adApplyTable", 0);

		setTableTrBgColor(
				"adApplyTable",	//테이블 class 값
				"${headerColor}",			//헤더 tr 배경색
				"${oddTrColor}",		//홀수행 배경색
				"${evenTrColor}",	//짝수행 배경색
				"${mouseOverColor}"			//마우스 온 시 배경색
		);
	});

	function reserveAdForm() {
		location.replace("/group4erp/insertAdApply.do");
	}
	
</script>
</head>
<body><center>
	<h1>광고신청현황</h1><br>
	<label> <span id="nowTime"> </span> [현재 광고 정보] : ${adApplyCnt}회 </label>
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
				<td>[상태별]</td><td><input type="checkbox" value="01" name="evnt_stat">대기중
									<input type="checkbox" value="03" name="evnt_stat">심사중
									<input type="checkbox" value="02" name="evnt_stat">진행중
									<input type="checkbox" value="04" name="evnt_stat">종료
				</td>
			</tr>
			<tr>
				<td>[검색어]</td><td><input type="text" name="searchKeyword">&nbsp;&nbsp;<input type="button" value="검색" onClick="goSearch();">&nbsp;&nbsp;
									<input type="button" value="모두검색" onClick="goSearchAll();"></td>
			</tr>
		</table>
		<input type="hidden" name="selectPageNo" >
		<input type="hidden" name="sort" >
	</form>

		
	<input type="button" name="reserveAd" value="광고 신청" onClick="reserveAdForm();" />&nbsp;
	<input type="button" value="삭제" onClick="deleteNotYetEvent();"><br>
	
	<div id="comment" style="color:red;">대기중인 광고 신청만 삭제할 수 있습니다.</div>
	<div id="blankArea">&nbsp;</div>
	
	<table class="adApplyTable tab" name="adApplyTable" cellpadding="5" cellspacing="5">
		<tr>
			
			
		</tr>
		<tr>
			<th></th><th>광고신청번호</th><th>업체번호</th><th>광고타이틀</th><th>등록일</th><th>상태</th>
		</tr>
		<c:forEach items='${adApplyList}' var="adApplyList" varStatus="loopTagStatus">
			<tr style="cursor:pointer" onClick="viewEmpSalInfo(${empSal.emp_no});">
				<td><input type="checkbox" name="deleteAd" onClick="deleteAd('${adApplyList.ad_apply_no}')"></td>
				<td>${adApplyList.ad_apply_no}</td>
				<td>${adApplyList.corp_no}</td>
				<td>${adApplyList.ad_title}</td>
				<td>${adApplyList.reg_dt}</td> 
				<td>${adApplyList.ad_stat}</td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${empty adApplyList}">
		광고신청내역이 없습니다.
	</c:if>
	<br>
	<!-- <input type="button" value="광고신청" onClick="insertAdInfo();"> -->
</center>

	
</body>
</html>