<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 내역 리스트</title>
<script>
	$(document).ready(function() {
		headerSort("transactionSpecTb", 0);

		setTableTrBgColor(
				"transactionSpecTb",	//테이블 class 값
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
					"${corp_tran_Cnt}"						//검색 결과 총 행 개수
					,"${corpSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
					,"${corpSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
					,"10"										//페이지 당 보여줄 페이지번호 개수
					,"goSearch();"						//페이지 번호 클릭 후 실행할 자스코드
				)
			);

		inputData('[name=rowCntPerPage]',"${corpSearchDTO.rowCntPerPage}");
		inputData('[name=selectPageNo]',"${corpSearchDTO.selectPageNo}");


	});

</script>
</head>
<body><center>
	<h1>거래 내역</h1><br>
	<label>기준일 : 2019.12.26(목)</label>
	<table class="transactionSpecTb tbcss1" name="transactionSpecTb" cellpadding="5" cellspacing="5">
		<tr>
			<th>주문번호</th><th>사업자 번호</th><th>상호명</th><th>사업자명</th><th>주문수량</th><th>단가</th><th>총액</th><th>주문일</th>
		</tr>
		
			<c:forEach items='${corp_tran_list}' var="tranList" varStatus="loopTagStatus">
			<tr style="cursor:pointer">
				<td>${tranList.order_books_no}</td>
				<td>${tranList.corp_no}</td>
				<td>${tranList.corp_name}</td>
				<td>${tranList.ceo_name}</td>
				<td>${tranList.books_qty}</td>
				<td>${tranList.book_price}</td>
				<td>${tranList.tot_cost}</td>
				<td>${tranList.order_dt}</td>
			</tr>
		</c:forEach>
		
	</table>

</center>

</body>
</html>