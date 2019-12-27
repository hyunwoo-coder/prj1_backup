<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래명세서</title>

<script>

	function printPage() {

		alert("거래명세서 인쇄 기능 구현 예정");
	}

</script>

</head>
<body><center>
	<h1>거래명세서</h1>
	
	<table class="tranSpecTable tbcss1" name="tranSpecTable" cellpadding="5" cellspacing="5" width="500">

		<c:forEach items="${tranSpecList}" var="tranSpecList" varStatus="loopTagStatus">
			<tr>
				<td rowspan="5" width="100">공급받는자</td><td width="100">상호</td><td>${tranSpecList.corp_name} </td>
			</tr>
				<tr><td>사업자번호</td><td>${tranSpecList.corp_no} </td></tr>
				<tr><td>사업자명</td><td>${tranSpecList.ceo_name}</td></tr>
				<tr><td>연락처</td><td>${tranSpecList.corp_tel}</td></tr>
				<tr><td>FAX</td><td>${tranSpecList.corp_fax}</td></tr>
				
				<tr><td>거래일시</td><td colspan="2">${tranSpecList.order_dt}</td></tr>
				<tr><td>품명</td><td colspan="2">${tranSpecList.book_name} &nbsp;(isbn : ${tranSpecList.isbn13})</td></tr>	
				<tr><td>수량</td><td colspan="2">${tranSpecList.books_qty} 권</td></tr>
				<tr><td>단가</td><td colspan="2">${tranSpecList.book_price} 원</td></tr>
				<tr><td>공급가액</td><td colspan="2">${tranSpecList.tot_cost} 원</td></tr>	
				<%-- <tr><td>부가세액</td><td colspan="2">${tranSpecList.tax} 원</td></tr> --%>			
			</c:forEach>
			
	</table>
	<br>
	<input type="button" value="인쇄" onClick="printPage();">


</center>

</body>
</html>