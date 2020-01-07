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
	
	<form name="corpSearchForm" method="post" action="/group4erp/viewCorpList.do">
	[검색어]&nbsp;<input type="text" name="searchKeyword">&nbsp;&nbsp;<input type="button" value="검색" onClick="goSearch();">
	
	&nbsp;&nbsp;<input type="button" value="모두검색" onClick="goSearchAll();">
	 <table border=0>
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