<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 전사적자원관리 시스템 </title>
<script>
	function checkLoginInfo() {
		document.login_form.submit();
	}

	function joinMembership(){
		location.replace("/group4erp/joininsert.do");
	}
	
	function deleteMembership(){
		location.replace("/group4erp/godelete.do");
	}
</script>

</head>
<body>
<cneter>
<form name="login_form" method="post" action="/group4erp/loginProc.do">
	<b>KOSMO YES4조 전사적자원관리시스템</b><br>
	<table class="tbcss1" cellpadding=5 cellspacing=0>
		<tr>
			<td>사원번호</td><td><input type="text" name="emp_id"></td>
		</tr>
		<tr>
			<td>비밀번호</td><td><input type="text" name="emp_pwd"></td>
		</tr>	
	</table>
</form>

<input type="button" name="loginBtn" value="로그인" onClick="checkLoginInfo();">&nbsp;
<input type="button" name="joinBtn" value="사원등록" onClick="joinMembership();">&nbsp;
<input type="button" name="deleteBtn" value="사원삭제" onClick="deleteMembership();">

</body>
</html>