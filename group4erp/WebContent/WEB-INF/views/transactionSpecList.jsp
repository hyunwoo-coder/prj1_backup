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
					"${corp_tran_cnt}"						//검색 결과 총 행 개수
					,"${corpSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
					,"${corpSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
					,"10"										//페이지 당 보여줄 페이지번호 개수
					,"goSearch();"						//페이지 번호 클릭 후 실행할 자스코드
				)
		);

		inputData('[name=rowCntPerPage]',"${corpSearchDTO.rowCntPerPage}");
		inputData('[name=selectPageNo]',"${corpSearchDTO.selectPageNo}");
		inputData('[name=sort]').val("${corpSearchDTO.sort}");
		
	});

	function viewTranSpec(order_no) {
		alert("주문번호 "+order_no+"로 해당 거래명세서 조회 기능 구현 예정");
	}

	function goSearch() {
		document.corpSearchForm.submit();
	}

</script>
</head>
<body><center>
	<h1>거래 내역</h1><br>
	<label>기준일 : 2019.12.26(목)</label>
	
	<form name="corpSearchForm" method="post" action="/group4erp/viewTranSpecList.do">
	[검색어]<input type="text" name="searchKeyword">&nbsp;&nbsp;<input type="button" value="검색" onClick="goSearch();">

	&nbsp;&nbsp;<input type="button" value="모두검색" onClick="goSearchAll();">
	 <table border=0 width=700>
	 	<tr>
	    	<td align=right>
	        [전체] : ${corp_tran_cnt} 건&nbsp;&nbsp;&nbsp;&nbsp;
	            <select name="rowCntPerPage">
	               <option value="10">10</option>
	               <option value="15">15</option>
	               <option value="20">20</option>
	               <option value="25">25</option>
	               <option value="30">30</option>
	            </select> 행보기
      </table>
     <input type="hidden" name="selectPageNo">
     <input type="hidden" name="sort">
		
	<div>&nbsp; <span class="pagingNumber"></span>&nbsp;</div>
	<table>
		<tr height=10>
			<td></td>
		</tr>
	</table>
</form> 
	<label>금액 단위 : 원</label>
	<table class="transactionSpecTb tbcss1" name="transactionSpecTb" cellpadding="5" cellspacing="5" width="700">
		<tr>
		<c:choose>
			<c:when test="${param.sort=='1 desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('1 asc'); goSearch();  "> ▼ 주문번호</th>
			</c:when>
			<c:when test="${param.sort=='1 asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('1 desc'); goSearch(); "> ▲ 주문번호</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('1 asc'); goSearch();  ">주문번호</th>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${param.sort=='2 desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('2 asc'); goSearch();  "> ▼ 사업자번호</th>
			</c:when>
			<c:when test="${param.sort=='2 asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('2 desc'); goSearch(); "> ▲ 사업자번호</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('2 asc'); goSearch();  ">사업자번호</th>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${param.sort=='3 desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('3 asc'); goSearch();  "> ▼ 상호명</th>
			</c:when>
			<c:when test="${param.sort=='3 asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('3 desc'); goSearch(); "> ▲ 상호명</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('3 asc'); goSearch();  ">상호명</th>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${param.sort=='4 desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('4 asc'); goSearch();  "> ▼ 사업자명</th>
			</c:when>
			<c:when test="${param.sort=='4 asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('4 desc'); goSearch(); "> ▲ 사업자명</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('4 asc'); goSearch();  ">사업자명</th>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${param.sort=='5 desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('5 asc'); goSearch();  "> ▼ 주문수량</th>
			</c:when>
			<c:when test="${param.sort=='5 asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('5 desc'); goSearch(); "> ▲ 주문수량</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('5 asc'); goSearch();  ">주문수량</th>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${param.sort=='6 desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('6 asc'); goSearch();  "> ▼ 단가</th>
			</c:when>
			<c:when test="${param.sort=='6 asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('6 desc'); goSearch(); "> ▲ 단가</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('6 asc'); goSearch();  ">단가</th>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${param.sort=='7 desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('7 asc'); goSearch();  "> ▼ 총액</th>
			</c:when>
			<c:when test="${param.sort=='7 asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('7 desc'); goSearch(); "> ▲ 총액</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('7 asc'); goSearch();  ">총액</th>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${param.sort=='8 desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('8 asc'); goSearch();  "> ▼ 주문일</th>
			</c:when>
			<c:when test="${param.sort=='8 asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('8 desc'); goSearch(); "> ▲ 주문일</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('8 asc'); goSearch();  ">주문일</th>
			</c:otherwise>
		</c:choose>
		
		</tr>
		
			<c:forEach items='${corp_tran_list}' var="tranList" varStatus="loopTagStatus">
			<tr style="cursor:pointer" onClick="viewTranSpec('${tranList.order_books_no}');">
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