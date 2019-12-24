<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고신청현황</title>
</head>
<body><center>
	<h1>광고신청현황</h1><br>
	
	<table class="adApplyTable tbcss1" name="adApplyTable" cellpadding="5" cellspacing="5">
		<tr>
			<th>광고신청번호</th><th>업체명</th><th>광고타이틀</th><th>등록일</th><th>상태</th>
		</tr>
	
	</table>
	<c:if test="${empty getDayOffList}">
		광고신청내역이 없습니다.
	</c:if>

</center>

	
</body>
</html>