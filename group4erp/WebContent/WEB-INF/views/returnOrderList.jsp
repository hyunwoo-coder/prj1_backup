<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반품 현황</title>
<script>

$(document).ready(function(){
	
	headerSort("returnOrderTable", 0);

	setTableTrBgColor(
			"returnOrderTable",	//테이블 class 값
			"${headerColor}",			//헤더 tr 배경색
			"${oddTrColor}",		//홀수행 배경색
			"${evenTrColor}",	//짝수행 배경색
			"${mouseOverColor}"			//마우스 온 시 배경색
		);
		
	});
	
</script>
</head>
<body><center>
	<h1>반품 현황</h1>
	<< 2019년 12월 24일(화) >>
	<table class="returnOrderTable tbcss1" name="returnOrderTable" cellpadding="5" cellspacing="5">
		<tr>
			<th>반품접수번호</th><th>주문번호</th><th>isbn</th><th>반품사유</th>
		</tr>
		<c:forEach items='${returnOrderList}' var="reOrder" varStatus="loopTagStatus">
			<tr style="cursor:pointer" ">
				<td>${reOrder.return_sales_no}</td>
				<td>${reOrder.order_no}</td>
				<td>${reOrder.isbn13}</td>
				<td>${reOrder.return_cause}</td>
			</tr>
		</c:forEach>
	</table>

</center>

</body>
</html>