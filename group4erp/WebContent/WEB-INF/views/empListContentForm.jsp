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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>Insert title here</title>
<style>
	.line{
			border-collapse: collapse;
			padding:5px;
			border-top:0px;
			border-bottom:5px solid black;
			border-left:0px;
			border-right:0px;
			font-size:11pt;
			font-family: 'Noto Sans KR', sans-serif;



		}
</style>
<script>

	var hire_default = "${employeeInfoDTO.hire_dt}"
	$(document).ready(function(){
		
		inputData("[name=dep_name]", "${employeeInfoUpDTO.dep_name}");
		inputData("[name=jikup]", "${employeeInfoUpDTO.jikup}");
		inputData("[name=worktime_name]", "${employeeInfoUpDTO.worktime_name}");
		
		
		$("#hire_dt").datepicker({ 
		    dateFormat: 'yy-mm-dd'
		    ,defaultDate : hire_default
			,onSelect: function() { 
				var dateObject = $(this).datepicker('getDate');
		    }
		    ,beforeShowDay:$.datepicker.noWeekends 
		});

		$("#resign_date").datepicker({ 
		    dateFormat: 'yy-mm-dd'
		    ,defaultDate : 'today'
			,onSelect: function() { 
				var dateObject = $(this).datepicker('getDate');
		    }
		    ,beforeShowDay:$.datepicker.noWeekends 
		});

	});

	function goBack(){
		history.go(-1);
	}
	
	function empInfoUp(){
		alert( $("[name=empContentUp]").serialize() );

		$.ajax({
			url : "/group4erp/empInfoUpProc.do"
			, type : "post"
			, data : $("[name=empContentUp]").serialize()
			, success : function(data){
				alert("수정성공");
			}
			, error : function(){
				alert("서버 접속 실패");
			}
		});
		
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
		
	<form name="empContentUp" method="post" action="/group4erp/      .do">
		<table class="line" width="850">
			<tr>
				<td>&nbsp;&nbsp;<b>직원정보</b></td>
			</tr>
		</table>
		
		<table class="empContentInfo tab2" width="850" border=1 bordercolor="#000000" cellpadding=5 align=center>
			<tr>
				<td rowspan="7" colspan="2" width="20%">
					<img src="${ctRootImage}/emp_0003.jpg" width="100%" height="150">
				<!-- <img src="../image/emp_0002.jpg"> --></td>
				<td bgcolor="#EEEEEE" width="12%">성명</td>
				<td width="28%"><input type="text" name="emp_name" value="${employeeInfoUpDTO.emp_name}"></td>
				<td bgcolor="#EEEEEE" width="12%">영어명</td>
				<td width="28%"><input type="text" name="emp_eng_name" value="${employeeInfoUpDTO.emp_eng_name}"></td>
			</tr>
			<tr>
				<td bgcolor="#EEEEEE">사번</td>
				<td><input type="text" name="emp_no" value="${employeeInfoUpDTO.emp_no}"></td>
				<td bgcolor="#EEEEEE">성별</td>
				<td>
					<c:if test="${employeeInfoUpDTO.emp_gender=='여'}">
						<input type="radio" name="emp_gender" value="여" checked>여
						<input type="radio" name="emp_gender" value="남">남
					</c:if>
					<c:if test="${employeeInfoUpDTO.emp_gender=='남'}">
						<input type="radio" name="emp_gender" value="여">여
						<input type="radio" name="emp_gender" value="남" checked>남
					</c:if>
				</td>
			</tr>
			<tr>			
				<td bgcolor="#EEEEEE">주민번호</td>
				<td><input type="text" name="jumin_num" value="${employeeInfoUpDTO.jumin_num}"></td>
				<td bgcolor="#EEEEEE">전화번호</td>
				<td><input type="text" name="phone" value="${employeeInfoUpDTO.phone}"></td>
			</tr>
			<tr>
				<td bgcolor="#EEEEEE" rowspan="2">회사이메일</td>
				<td rowspan="2"><input type="text" name="emp_email_office" size="25" value="${employeeInfoUpDTO.emp_email_office}"></td>
				<td bgcolor="#EEEEEE" rowspan="2">이메일</td>
				<td rowspan="2"><input type="text" name="emp_email" size="25" value="${employeeInfoUpDTO.emp_email}"></td>
			<tr></tr>
			<tr>
				<td bgcolor="#EEEEEE" rowspan="2">주소</td>
				<td colspan="3" rowspan="2"><input type="text" name="emp_addr" size="73" value="${employeeInfoUpDTO.emp_addr}"></td>
			<tr></tr>
		</table>
		<br>
		
		
		<table class="line" width="850">
			<tr>
				<td>&nbsp;&nbsp;<b>채용정보</b></td>
			</tr>
		</table>
		<table table class="empContentInfo tab2" width="850" border=1 bordercolor="#000000" cellpadding=5 align=center>
			<tr>
				<td bgcolor="#EEEEEE">부서</td>
				<td colspan="2">
					<select name="dep_name">
							<option value="총무부">총무부</option>
							<option value="기획부">기획부</option>
							<option value="영업부">영업부</option>
							<option value="마케팅부">마케팅부</option>
							<option value="사업부">사업부</option>
							<option value="인사부">인사부</option>
					</select>
				</td>
				<td bgcolor="#EEEEEE">채용형태</td>
				<td colspan="2">
					<select name="worktime_name">
						<option value="정규직">정규직</option>
						<option value="파견직">파견직</option>
						<option value="기간제 근로자">기간제 근로자</option>
						<option value="파트타임">파트타임</option>
						<option value="인턴">인턴</option>
					</select>
				</td>
			</tr>
			<tr>
				<td bgcolor="#EEEEEE">직급</td>
				<td colspan="2">
					<select name="jikup">
						<option value="대표이사">대표이사</option>
						<option value="전무이사">전무이사</option>
						<option value="상무이사">상무이사</option>
						<option value="부장">부장</option>
						<option value="차장">차장</option>
						<option value="과장">과장</option>
						<option value="대리">대리</option>
						<option value="주임">주임</option>
						<option value="사원">사원</option>
						<option value="기타">기타</option>
					</select>
				</td>
				<td bgcolor="#EEEEEE">연봉</td>
				<td colspan="2"><input type="text" name="salary" value="${employeeInfoUpDTO.salary}"></td>
			</tr>
			<tr>
				<td bgcolor="#EEEEEE">입사일</td>
				<td colspan="2"><input type="text" name="hire_dt" id="hire_dt" value="${employeeInfoUpDTO.hire_dt}" disabled></td>
				<td bgcolor="#EEEEEE">퇴사일</td>
				<td colspan="2"><input type="text" name="resign_date" id="resign_date" value="${employeeInfoUpDTO.resign_date}"></td>
			</tr>
			<tr>
				<td bgcolor="#EEEEEE">휴직상태</td>
				<td colspan="4">
					<c:if test="${employeeInfoUpDTO.is_on_leave=='F'}">
						재직중
					</c:if>
					<c:if test="${employeeInfoUpDTO.is_on_leave=='T'}">
						휴직중
					</c:if>
				<%-- <input type="text" name="is_on_leave" value="${employeeInfoDTO.is_on_leave}"></td> --%>
			</tr>
		</table>

		
		<br>
	
		<table class="line" width="850">
			<tr>
				<td>&nbsp;&nbsp;<b>직속상관정보</b></td>
			</tr>
		</table>
		<table table class="empContentInfo tab2" width="850" border=1 bordercolor="#000000" cellpadding=5 align=center>
			<tr>
				<td bgcolor="#EEEEEE" width="10%">이름</td>
				<td width="23%"><input type="text" name="mgr_emp_name" value="${employeeInfoUpDTO.mgr_emp_name}"></td>
				<td bgcolor="#EEEEEE" width="13%">부서</td>
				<td width="20%"><input type="text" name="mgr_emp_dep_name" value="${employeeInfoUpDTO.mgr_emp_dep_name}"></td>
				<td bgcolor="#EEEEEE" width="10%">직급</td>
				<td width="23%"><input type="text" name="mgr_emp_jikup" value="${employeeInfoUpDTO.mgr_emp_jikup}"></td>
			</tr>
		</table>
		<input type="hidden" name="emp_no" value="${emp_no}">
	</form>
		
		
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