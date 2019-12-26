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
	
	//headerSort("empListTable", 0);
	
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
	inputData('[name=searchKeyword]',"${hrListSearchDTO.searchKeyword}");
});

	function goSearch() {
		document.empListSearchForm.submit();
	}
	function goSearchAll() {
		document.empListSearchForm.reset();
		document.empListSearchForm.submit();
	}
	function insertNewEmp() {
		alert("신규 사원 추가 기능 구현");
	}
	function goEmpContentForm(emp_no){
		
		//alert("emp_no="+emp_no);
		//return;
		
		var str = "emp_no="+emp_no
		
		location.href="/group4erp/viewEmpContentForm.do?"+str;
		/*
		$.ajax({
			url : "/group4erp/empViewContantProc.do"
			, type : "post"
			, data : "emp_no="+emp_no
			, success : function(upDelCnt){
				alert(999);
				return;
				location.replace("/group4erp/???????.do");
			}
			, error : function(){
				alert("서버 접속 실패");
			}
		});
		*/
		//location.replace("......");
	}
	
</script>
</head>
<body>
<center>
	<h1>[직원 리스트]</h1>

	<form name="empListForm" method="post" action="/group4erp/viewEmpInfo.do">
	[검색어]<input type="text" name="searchKeyword">&nbsp;&nbsp;<input type="button" value="검색" onClick="goSearch();">

	<!-- <form name="empListSearchForm" method="post" action="/group4erp/viewEmpList.do">
	[검색어]<input type="text" name="searchKeyword">&nbsp;&nbsp;<input type="button" value=" 검색 " onClick="goSearch();"> -->

	&nbsp;&nbsp;<input type="button" value="모두검색" onClick="goSearchAll();">
	 <table border=0 width=700>
	 	<tr>
	    	<td align=right>
	        [총 직원수] : ${getEmpBoardListCnt} 명&nbsp;&nbsp;&nbsp;&nbsp;
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
	
	<form na me="empListForm" method="post" action="/group4erp/viewEmpInfo.do">
	
	<div id="blankArea"><br></div>
		<table class="empListTable tbcss1" cellpadding="5" cellspacing="5" width="500">		
			<thead>
			<tr>
				<th>사번</th>
				<th>성명</th>
				<th>부서</th>
				<th>직급</th>
			</thead>
			<tbody>
			<c:forEach items="${requestScope.getEmpBoardList}" var="empList" varStatus="loopTagStatus">
			<tr style="cursor:pointer" onClick="goEmpContentForm(${empList.emp_no});">	
				<td align=center>${empList.emp_no}</td>	<!-- <input type="hidden" value="${dep_no}">  -->
				<td align=center>${empList.emp_name}</td>
				<td align=center>${empList.dep_name}</td>
				<td align=center>${empList.jikup}</td>
			</tr>		
			</c:forEach>
			</tbody>
		</table>
		<br>
		<input type="button" value="신규사원등록" onClick="insertNewEmp();">
		<br><br>
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
	</form>


	<!-- 
	<c:if test="EmployeeDTO.getEmp_no()!=null">
	<div class="empListContant">
		<a href="javascript:goClose();">[닫기]</a>
		<table class="tbcss1" width="600" border=1 bordercolor="#000000" cellpadding=5 align=center>
			<tr>
				<th>이름
				<td>가나다
				<th>영어이름
				<td>rkskek
				<th colspan=4 width="30%">사원사진
			<tr>
				<th>주민등록번호
				<td colspan=3>111111-2222222
				<td rowspan=4 colspan=4 width="30%">no image
			<tr>
				<th>핸드폰번호
				<td colspan=3>010-1234-5678
			<tr>
				<th>이메일
				<td colspan=3>naver11@naver.com
			<tr>
				<th>회사이메일
				<td colspan=3>company11@company.com
			<tr>
				<th>주소
				<td colspan=5>전라북도 장수군 장수읍  개정농원길 20-43
				<th>휴직상태
				<td>X
			<tr>
				<th>입사일
				<td colspan=2>2019-12-25 수요일
				
				<th colspan=2>부서이름
				<td>총무과
				<th>성별
				<td>남
			<tr>
				<th>직업형태
				<td>정규직
				<th>직급
				<td>사원
				<th>연봉
				<td colspan=3>30,000,000
			<tr>
				<th>직속상관
				<th>부서이름
				<td>총무과
				<th>직급
				<td>대표이사
				<th>이름
				<td colspan=2>라마바
		</table>
	</div>
	</c:if>
	 -->
</center>

</body>
</html>