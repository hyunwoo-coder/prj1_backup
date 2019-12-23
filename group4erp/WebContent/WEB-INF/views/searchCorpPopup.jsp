<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 검색</title>

<script>

	$(document).ready(function() {
		//alert("팝업창 테스트");
		//location.replace("/group4erp/viewSearchCorp.do");
	});

	function selectCorp(corp_no) {
		$('[name=corp_no]').val(corp_no);
		
		document.searchCorpForm.submit();
	}
		
</script>

</head>
<body><center>
	<h1>업체 선택</h1>
	<form name="searchCorpForm" method="post" action="/group4erp/selectCorp.do">
	<input type="text" name="searchKeyword">&nbsp;<input type="button" value="검색" onClick="searchCorp();">
		<table class="corpListPopup tbcss1" name="corpListPopup" cellpadding="5" cellspacing="5">
			<tr>
				<th>사업자번호</th><th>사업자명</th>
			</tr>
			
			<c:forEach items='${corpList}' var="corpList" varStatus="loopTagStatus">
				<tr style="cursor:pointer" onClick="selectCorp('${corpList.corp_no}');">
					<td>${corpList.corp_no}</td>
					<td>${corpList.corp_name}</td>
				</tr>
			</c:forEach>
		</table>
		<input type="hidden" name="corp_no">
	</form>
</body>
</center>
</html>