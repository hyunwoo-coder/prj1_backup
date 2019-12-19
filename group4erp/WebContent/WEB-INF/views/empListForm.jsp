<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 리스트</title>
<script>

	function goSearch() {
		alert("검색 기능 구현");
	}
	
	function insertNewEmp() {
		alert("신규 사원 추가 기능 구현");
	}
	
</script>
</head>
<body><center>
	<h1>[직원 리스트]</h1>
	<form name="empListForm" method="post" action="/group4erp/viewEmpInfo.do">
	[검색어]<input type="text" name="searchKeyword"> <input type="button" value="검색" onClick="goSearch();" >
	<div id="blankArea"><br></div>
		<table class="tbcss1" name="empList" cellpadding="5" cellspacing="5" width="500">		
			<tr>
				<th>사번</th><th>성명</th><th>부서</th><th>직급</th>
			</tr>
			<tr style="cursor:pointer">
				<td>001</td><td>김사장</td><td>    </td><td>대표이사</td>		
			</tr>
			<tr>
				<td>025</td><td>조충래</td><td>기획부</td><td>대리</td>
			</tr>
		
		</table>
		<br>
		<input type="button" value="신규사원등록" onClick="insertNewEmp();">
		<br><br>
		<b>[1][2][3]</b>
	</form>

</center>

</body>
</html>