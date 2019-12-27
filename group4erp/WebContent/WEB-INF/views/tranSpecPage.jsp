<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래명세서</title>
</head>
<body><center>
	<h1>거래명세서</h1>
	
	<table class="tranSpecTable tbcss1" name="tranSpecTable" cellpadding="5" cellspacing="5" width="500">
		<tr>
			<td rowspan="5" width="100">공급받는자</td><td width="100">상호</td><td> </td>
		</tr>
		<tr><td>사업자번호</td><td> </td></tr>
		<tr><td>사업자명</td><td></td></tr>
		<tr><td>연락처</td><td></td></tr>
		<tr><td>FAX</td><td></td></tr>		
	</table>
	
	<table class="orderList tbcss1" name="orderList" cellpadding="5" cellspacing="5" width="500">
	
	
	</table>


</center>

</body>
</html>