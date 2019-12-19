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
	
	headerSort("empListForm .empListTable", 0);
	
});

	function goSearch() {
		alert("검색 기능 구현");
	}
	
	function insertNewEmp() {
		alert("신규 사원 추가 기능 구현");
	}
	
</script>
</head>
<body>
<center>
	<h1>[직원 리스트]</h1>
	<form na me="empListForm" method="post" action="/group4erp/viewEmpInfo.do">
	[검색어]<input type="text" name="searchKeyword">&nbsp;&nbsp;<input type="button" value=" 검색 " onClick="goSearch();">
	&nbsp;&nbsp;<input type="button" value="모두검색" onClick="goSearchAll();">
	[총 개수] : ${boardListAllCnt}&nbsp;&nbsp;&nbsp;&nbsp;
	<div id="blankArea"><br></div>
		<table class="empListTable tbcss1" cellpadding="5" cellspacing="5" width="500">		
			<thead>
			<tr>
				<th style="cursor:pointer">사번<th >성명<th>부서<th style="cursor:pointer">직급
			</tr>

			<c:forEach items="${empList}" var="empList" varStatus="loopTagStatus">
			<tr style="cursor:pointer">
				<td>${empList.emp_no}</td><td>${empList.emp_name}</td><td>${empList.dep_name} </td><td>${empList.jikup }</td>		
			</tr>
			
			</c:forEach>

			</thead>
			<tbody>
			<c:forEach items="${requestScope.getEmpBoardList}" var="empList" varStatus="loopTagStatus">
			<tr style="cursor:pointer" onClick="goEmpContentForm(${empList.emp_no});">	
				<td align=center>${empList.emp_no}	
				<td align=center>${empList.emp_name}	
				<td align=center>${empList.dep_name}	
				<td align=center>${empList.jikup}		
			</c:forEach>
			</tbody>
		</table>
		<br>
		<input type="button" value="신규사원등록" onClick="insertNewEmp();">
		<br><br>
		<b>[1][2][3]</b>
	</form>

</center>

</body>
</html>