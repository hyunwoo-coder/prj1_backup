<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 관리</title>
<script>

	$(document).ready(function(){
	
		headerSort("corpListTable", 0);

		setTableTrBgColor(
				"corpListTable",	//테이블 class 값
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
					"${corpListCnt}"						//검색 결과 총 행 개수
					,"${corpSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
					,"${corpSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
					,"10"										//페이지 당 보여줄 페이지번호 개수
					,"goSearch();"						//페이지 번호 클릭 후 실행할 자스코드
				)
			);

		inputData('[name=rowCntPerPage]',"${corpSearchDTO.rowCntPerPage}");
		inputData('[name=selectPageNo]',"${corpSearchDTO.selectPageNo}");
		inputData('[name=sort]').val("${corpSearchDTO.sort}");

		//$('[name=sort]').val("${corpSearchDTO.sort}");
	});


	function goSearch() {
		document.corpSearchForm.submit();
	}

	function goSearchAll() {
		document.corpSearchForm.reset();

		$('[name=corpSearchForm] [name=selectPageNo]').val("1");
		$('[name=corpSearchForm] [name=rowCntPerPage]').val("15");
		goSearch();
	}

	function insertCorp() {
		//alert("거래처 추가");
		location.replace("/group4erp/goInsertCorpPage.do");
	}

	function deleteCorp() {
		alert("거래처 삭제 기능 구현 예정")
	}
	
</script>


</head>
<body><center>
	<h1>거래처 현황</h1>
<form name="corpSearchForm" method="post" action="/group4erp/viewCorpList.do">
	[검색어]<input type="text" name="searchKeyword">&nbsp;&nbsp;<input type="button" value="검색" onClick="goSearch();">
	
	&nbsp;&nbsp;<input type="button" value="모두검색" onClick="goSearchAll();">
	 <table border=0 width=700>
	 	<tr>
	    	<td align=right>
	        [전체] : ${corpListCnt}개&nbsp;&nbsp;&nbsp;&nbsp;
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

<table class="corpListTable tbcss1" name="corpListTable" cellpadding="5" cellspacing="5" width="100%">
	<tr>
		<th></th>
		<c:choose>
			<c:when test="${param.sort=='corp_no desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_no asc'); goSearch();  "> ▲ 사업자번호</th>
			</c:when>
			<c:when test="${param.sort=='corp_no asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_no desc'); goSearch(); "> ▼ 사업자번호</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_no asc'); goSearch();  ">사업자번호</th>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${param.sort=='corp_name desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_name asc'); goSearch(); "> ▲ 거래처명</th>
			</c:when>
			<c:when test="${param.sort=='corp_name asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_name desc'); goSearch(); "> ▼ 거래처명</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_name asc'); goSearch(); ">거래처명</th>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${param.sort=='ceo_name desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('ceo_name asc'); goSearch(); "> ▲ 사업자명</th>
			</c:when>
			<c:when test="${param.sort=='ceo_name asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('ceo_name desc'); goSearch(); "> ▼ 사업자명</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('ceo_name asc'); goSearch(); ">사업자명</th>
			</c:otherwise>
		
		</c:choose>
		
		<c:choose>
			<c:when test="${param.sort=='corp_business_area desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_business_area asc'); goSearch(); "> ▲ 사업분야</th>
			</c:when>
			<c:when test="${param.sort=='corp_business_area asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_business_area desc'); goSearch(); "> ▼ 사업분야</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_business_area asc'); goSearch(); ">사업분야</th>
			</c:otherwise>
		
		</c:choose>
		
		<c:choose>
			<c:when test="${param.sort=='corp_addr desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_addr asc'); goSearch(); "> ▲ 소재지</th>
			</c:when>
			<c:when test="${param.sort=='corp_addr asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_addr desc'); goSearch(); "> ▼ 소재지</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_addr asc'); goSearch(); ">소재지</th>
			</c:otherwise>
		
		</c:choose>
		
		<c:choose>
			<c:when test="${param.sort=='corp_tel desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_tel asc'); goSearch(); "> ▲ 연락처</th>
			</c:when>
			<c:when test="${param.sort=='corp_tel asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_tel desc'); goSearch(); "> ▼ 연락처</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_tel asc'); goSearch(); ">연락처</th>
			</c:otherwise>
		
		</c:choose>
		
		<c:choose>
			<c:when test="${param.sort=='corp_fax desc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_fax asc'); goSearch(); "> ▲ FAX</th>
			</c:when>
			<c:when test="${param.sort=='corp_fax asc'}">
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_fax desc'); goSearch(); "> ▼ FAX</th>
			</c:when>			
			<c:otherwise>
				<th style="cursor:pointer" onClick="$('[name=sort]').val('corp_fax asc'); goSearch(); ">FAX</th>
			</c:otherwise>
		
		</c:choose>
		
	</tr>
	<c:forEach items='${corpList}' var="corpList" varStatus="loopTagStatus">
				<tr style="cursor:pointer" onClick="viewCorpInfo(${empSal.emp_no});">
					<td><input type="checkbox" value="${corpList.corp_no}"></td>
					<td>${corpList.corp_no}</td>
					<td>${corpList.corp_name}</td>
					<td>${corpList.ceo_name}</td>
					<td>${corpList.corp_business_area}</td> 
					<td>${corpList.corp_addr}</td> 
					<td>${corpList.corp_tel} </td> 
					<td>${corpList.corp_fax} </td> 
				</tr>
			</c:forEach>
</table>
<br>
<input type="button" value="거래처 추가" onClick="insertCorp();">
<input type="button" value="거래처 삭제" onClick="deleteCorp();">

</center>



</body>
</html>