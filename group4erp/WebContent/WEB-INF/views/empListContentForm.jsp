<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP페이지 처리 방식 선언하기 -->

<!-- 현재 이 JSP페이지 실행 후 생성되는 문서는 HTML이고, 이 문서는 UTF-8 방식으로 인코딩한다 라고 설정함 / 현재 이 JSP페이지는 UTF-8방식으로 인코딩 한다 -->
<!-- UTF-8 인코딩 방식은 한글을 포함 전 세계 모든 문자열을 부호화할수 있는 방법이다. -->
<!DOCTYPE html>
<!-- JSP기술의 한 종류인 [Include Directive]를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<!-- 유일하게 WEB-INF 루트 경로를 쓸수 있다. -->
<%@ include file="/WEB-INF/views/common.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	function goBack(){
		history.go(-1);
	}
	
	function empInfoUp(){
		alert("수정 기능 구현중");
		var tableTd = $('.empContentInfo td:eq(0)');
		tableTd.html('<input type=text value=');
		tableTd.text('value값입니다');
		tableTd.html('>');
		
	}
	function empInfoDel(emp_no){
		alert("삭제 기능 구현중");
		/*
		$.ajax({
			url : "/group4erp/empInfoDelProc.do"
			, type : "post"
			, data : "emp_no="+emp_no
			, success : function(DelCnt){
				alert(999);
				return;
				location.replace("/group4erp/???????.do");
			}
			, error : function(){
				alert("서버 접속 실패");
			}
		});
		*/
	}

</script>
</head>
<body><center>
	<b>직원 상세보기</b>
	<br>
	<table border=0 width=700>
	 	<tr>
	 	<td align=right>
			<a href="javascript:goBack();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[닫기]</a>
	</table>
		<table class="empContentInfo tbcss1" width="600" border=1 bordercolor="#000000" cellpadding=5 align=center>
			<tr>
				<th>이름
				<td>${employeeInfoDTO.emp_name}
				<th>영어이름
				<td>${employeeInfoDTO.emp_eng_name}
				<th colspan=4 width="30%">사원사진
			<tr>
				<th>주민등록번호
				<td colspan=3>${employeeInfoDTO.jumin_num}
				<td rowspan=4 colspan=4 width="30%">${employeeInfoDTO.emp_pic}
			<tr>
				<th>핸드폰번호
				<td colspan=3>${employeeInfoDTO.phone}
			<tr>
				<th>이메일
				<td colspan=3>${employeeInfoDTO.emp_email}
			<tr>
				<th>회사이메일
				<td colspan=3>${employeeInfoDTO.emp_email_office}
			<tr>
				<th>주소
				<td colspan=5>${employeeInfoDTO.emp_addr}
				<th>휴직상태
				<td>${employeeInfoDTO.is_on_leave}
			<tr>
				<th>입사일
				<td colspan=2>${employeeInfoDTO.hire_dt}
				<!--<th>부서번호
				<td>10-->
				<th colspan=2>부서이름
				<td>${employeeInfoDTO.dep_name}
				<th>성별
				<td>${employeeInfoDTO.emp_gender}
			<tr>
				<th>직업형태
				<td>${employeeInfoDTO.worktime_name}
				<th>직급
				<td>${employeeInfoDTO.jikup}
				<th>연봉
				<td colspan=3>${employeeInfoDTO.salary}
			<tr>
				<th>직속상관
				<th>부서이름
				<td>${employeeInfoDTO.mgr_emp_dep_name}
				<th>직급
				<td>${employeeInfoDTO.mgr_emp_jikup}
				<th>이름
				<td colspan=2>${employeeInfoDTO.mgr_emp_name}
		</table>
		<br>
		<input type="button" value=" 수정 " onclick="empInfoUp();">&nbsp;
		<input type="button" value=" 삭제 " onclick="empInfoDel(${emp_no});">&nbsp;
		<input type="button" value="뒤로가기" onclick="goBack();">
		<form method="post" name="empUpDelForm" action="/group4erp/empUpDelProc.do">
			<input type="hidden" name="emp_no" value="${emp_no}">
		</form>
</center>
</body>
</html>