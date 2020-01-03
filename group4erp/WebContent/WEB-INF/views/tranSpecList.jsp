<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래명세서 발급 내역</title>
</head>
<body><center>
	<h1>거래명세서 발급 내역</h1>
	<table class="tranSpecIssueList tab" name="tranSpecIssueList" cellpadding="5" cellspacing="5">
		<tr>
			<th>발급번호</th><th>사업자번호</th><th>상호명</th><th>사업자명</th><th>발급일시</th>
			<c:forEach items='${tranSpecIssueList}' var="tranSpecIssueList" varStatus="loopTagStatus">
				<tr style="cursor:pointer">
					<td>${tranSpecIssueList.issue_no}</td>
					<td>${tranSpecIssueList.corp_no}</td>
					<td>${tranSpecIssueList.corp_name}</td>
					<td>${tranSpecIssueList.ceo_name}</td>
					<td>${tranSpecIssueList.issue_dt}</td>				
				</tr>
			</c:forEach>
			
		</tr>
	
	</table>
</center>

</body>
</html>