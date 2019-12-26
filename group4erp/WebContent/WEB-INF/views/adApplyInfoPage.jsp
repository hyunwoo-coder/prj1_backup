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

	function insertAdInfo() {
		location.replace("/group4erp/insertAdApply.do");
	}
	
</script>
</head>
<body><center>
	<h1>광고신청현황</h1><br>
	
	<table class="adApplyTable tbcss1" name="adApplyTable" cellpadding="5" cellspacing="5">
		<tr>
			<th>광고신청번호</th><th>업체번호</th><th>광고타이틀</th><th>등록일</th><th>상태</th>
		</tr>
		<c:forEach items='${adApplyList}' var="adApplyList" varStatus="loopTagStatus">
			<tr style="cursor:pointer" onClick="viewEmpSalInfo(${empSal.emp_no});">
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