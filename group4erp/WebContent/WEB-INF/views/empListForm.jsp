<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 리스트</title>
<script>

$(document).ready(function(){
	
	
	headerSort("empListTable", 0);
	
	$('[name=rowCntPerPage]').change(function(){
		goSearch();
	});
	
	$(".pagingNumber").html(
			getPagingNumber(
				"${getEmpBoardListCnt}"						//검색 결과 총 행 개수
				,"${hrListSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
				,"${hrListSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
				,"10"										//페이지 당 보여줄 페이지번호 개수
				,"goSearch();"						//페이지 번호 클릭 후 실행할 자스코드
			)
		);
	
	inputData('[name=rowCntPerPage]',"${hrListSearchDTO.rowCntPerPage}");
	inputData('[name=selectPageNo]',"${hrListSearchDTO.selectPageNo}");
});

	function goSearch() {
		document.empListSearchForm.submit();
	}
	
	function insertNewEmp() {
		alert("신규 사원 추가 기능 구현");
	}
	
</script>
</head>
<body>
<center>
	<h1>[직원 리스트]</h1>
	<form name="empListSearchForm" method="post" action="/group4erp/viewEmpList.do">
	[검색어]<input type="text" name="searchKeyword">&nbsp;&nbsp;<input type="button" value=" 검색 " onClick="goSearch();">
	&nbsp;&nbsp;<input type="button" value="모두검색" onClick="goSearchAll();">
	 <table border=0 width=700>
	 	<tr>
	    	<td align=right>
	        [총 개수] : ${getEmpBoardListCnt}&nbsp;&nbsp;&nbsp;&nbsp;
	            <select name="rowCntPerPage">
	               <option value="10">10</option>
	               <option value="15">15</option>
	               <option value="20">20</option>
	               <option value="25">25</option>
	               <option value="30">30</option>
	            </select> 행보기
      </table>
      <input type="hidden" name="selectPageNo">
	</form>
	
	<!-- <form na me="empListForm" method="post" action="/group4erp/viewEmpInfo.do"> -->
	
	<div id="blankArea"><br></div>
		<table class="empListTable tbcss1" cellpadding="5" cellspacing="5" width="500">		
			<thead>
			<tr>
				<th style="cursor:pointer">사번<th>성명<th>부서<th style="cursor:pointer">직급
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${requestScope.getEmpBoardList}" var="empList" varStatus="loopTagStatus">
			<tr style="cursor:pointer" onClick="goEmpContentForm(${empList.emp_no});">	
				<td align=center>${empList.emp_no}<input type="hidden" value="${dep_no}">
				<td align=center>${empList.emp_name}
				<td align=center>${empList.dep_name}
				<td align=center>${empList.jikup}
			</tr>		
			</c:forEach>
			</tbody>
		</table>
		<br>
		<input type="button" value="신규사원등록" onClick="insertNewEmp();">
		<br><br>
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
	<!-- </form>  -->

</center>

</body>
</html>