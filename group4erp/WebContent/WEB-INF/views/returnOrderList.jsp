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

		inputData('[name=rowCntPerPage]',"${returnSearchDTO.rowCntPerPage}");
		inputData('[name=selectPageNo]',"${returnSearchDTO.selectPageNo}");
		inputData('[name=sort]').val("${returnSearchDTO.sort}");
		
	});


	function goSearch() {

		var keyword = $("[name=returnSearchForm] [name=searchKeyword]").val();
		keyword = $.trim(keyword);
		$("[name=returnSearchForm] [name=searchKeyword]").val(keyword);
		
		document.returnSearchForm.submit();
	}

	function goSearchAll() {
		document.returnSearchForm.reset();

		$('[name=returnSearchForm] [name=selectPageNo]').val("1");
		$('[name=returnSearchForm] [name=rowCntPerPage]').val("15");
		goSearch();
	}
	
</script>
</head>
<body><center>
	<h1 class="fontBold">반품 현황</h1>
	
	<form name="returnSearchForm" method="post" action="/group4erp/goReturnOrderList.do">
	<table class="tab" name="tab1" cellpadding="5" cellspacing="5">
		<tr>
			<td>[검색어]</td><td><input type="text" name="searchKeyword">&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td>[사유별]</td><td><input type="checkbox" value="01" name="return_cd">파손
									<input type="checkbox" value="03" name="return_cd">변심
									<input type="checkbox" value="02" name="return_cd">오배송
									<input type="checkbox" value="04" name="return_cd">제작사 요청
									<input type="checkbox" value="05" name="return_cd">기타</td>
		</tr>
	</table>
	<br>
	<input type="button" value="검색" onClick="goSearch();">&nbsp;&nbsp;
	<input type="button" value="모두검색" onClick="goSearchAll();">
	 <table border=0 width=700>
	 	<tr>
	    	<td align=right>
	        [전체] : ${returnOrderCnt}개&nbsp;&nbsp;&nbsp;&nbsp;
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
	

	<table class="returnOrderTable tab" name="returnOrderTable" cellpadding="5" cellspacing="5">
		<tr>
		<c:choose>
			<c:when test="${param.sort=='1 desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('1 asc'); goSearch();  "> ▲ 반품접수번호</th>
			</c:when>
			<c:when test="${param.sort=='1 asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('1 desc'); goSearch(); "> ▼ 반품접수번호</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('1 asc'); goSearch();  ">반품접수번호</th>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${param.sort=='2 desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('2 asc'); goSearch();  "> ▲ 주문번호</th>
			</c:when>
			<c:when test="${param.sort=='2 asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('2 desc'); goSearch(); "> ▼ 주문번호</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('2 asc'); goSearch();  ">주문번호</th>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${param.sort=='3 desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('3 asc'); goSearch();  "> ▲ isbn</th>
			</c:when>
			<c:when test="${param.sort=='3 asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('3 desc'); goSearch(); "> ▼ isbn</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('3 asc'); goSearch();  ">isbn</th>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${param.sort=='4 desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('4 asc'); goSearch();  "> ▲ 반품사유</th>
			</c:when>
			<c:when test="${param.sort=='4 asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('4 desc'); goSearch(); "> ▼ 반품사유</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('4 asc'); goSearch();  ">반품사유</th>
			</c:otherwise>
		</c:choose>

		</tr>
		<c:forEach items='${returnOrderList}' var="reOrder" varStatus="loopTagStatus">
			<tr style="cursor:pointer" ">
				<td align="center">${reOrder.return_sales_no}</td>
				<td align="center">${reOrder.order_no}</td>
				<td align="center">${reOrder.isbn13}</td>
				<td align="center">${reOrder.return_cause}</td>
			</tr>
		</c:forEach>
	</table>

</center>

</body>
</html>