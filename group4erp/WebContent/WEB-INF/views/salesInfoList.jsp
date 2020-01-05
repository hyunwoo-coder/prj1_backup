<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매현황</title>

<script>

	$(document).ready(function() {
		$("#orderListTable").hide();
	});

	function showOrderList() {
		$("#orderListTable").show();
	}

	function hideOrderList() {
		$("#orderListTable").hide();
	}

</script>
</head>
<body><center>
	<h1>판매현황</h1><br>
	--일반 고객 주문 현황--
	<table border="0" cellpadding="5" cellspacing="5">
		<tr>
			<td>[온라인]</td><td>${onlineOrderCnt}건 </td> <td>총 예상 수입액</td><td> ${tot_revenue}원 </td>
		</tr>
		<tr>
			<td>[오프라인]</td><td> 0건</td> <td>총 예상 수입액</td> <td>0원</td>
		</tr>
	</table>
	<input type="button" value="세부내역보기" onClick="showOrderList();">&nbsp;
	<input type="button" value="세부내역숨기기" onClick="hideOrderList();"><br> 
	<br><br>
	
	<div id="orderListTable">
	<table class="onLineSaleTable tab" name="onLineSaleTable" cellpadding="5" cellspacing="5">
		<tr>
			<th>주문번호</th><th>ID</th><th>배송 주소</th><th>ISBN</th><th>가격</th><th>주문수량</th><th>총액</th><th>고객 요구사항</th><th>회원 여부</th><th>주문일</th>
		</tr>
		<c:forEach items='${onlineOrderList}' var="onlineOrderList" varStatus="loopTagStatus">
			<tr  align="center">
				<td>${onlineOrderList.order_no}</td>
				<td>${onlineOrderList.order_id}</td>
				<td>${onlineOrderList.order_delivery_addr}</td>
				<td>${onlineOrderList.isbn13}</td>
				<td>${onlineOrderList.book_price}원</td>
				<td>${onlineOrderList.book_qty}</td>
				<td>${onlineOrderList.tot_cost}원</td>
				<td>${onlineOrderList.cus_requirement}</td>
				<td>${onlineOrderList.is_member}</td>
				<td>${onlineOrderList.order_dt}</td>
		
		</c:forEach>
		<tr>
			<td colspan="7" align="right">총 예상 수입 : ${tot_revenue}원</td>
		</tr>
	</table>
	</div>
	<br><br>

	[사업자 고객 주문 현황]<br>
	<table border="0" cellpadding="5" cellspacing="5">
		<tr>
			<td>[온라인]</td><td>${onlineOrderCnt}건 </td> <td>총 예상 수입액</td><td> ${tot_revenue}원 </td>
		</tr>
		<tr>
			<td>[오프라인]</td><td> 0건</td> <td>총 예상 수입액</td> <td>0원</td>
		</tr>
	</table>
</center>

</body>
</html>