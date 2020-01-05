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
		$.ajax({
			
			url : "/group4erp/loginProc.do"
			, type : "post"
			, data : $('[name=login_form]').serialize()
			, success : function(loginCnt){
				
				if(loginCnt==1){
					alert("회원 로그인 성공!");
					location.replace("/group4erp/goMainPage.do");
				}
				else{
					alert("회원 로그인 실패! 관리자에게 문의 바람.");
				}
			}
			, error : function(){
				alert("서버 접속 실패");
			}
		});
				
		
	}

	/*function joinMembership(){
		location.replace("/group4erp/joininsert.do");
	}
	
	function deleteMembership(){
		location.replace("/group4erp/godelete.do");
	}*/

</script>

</head>
<body>
<center><br>
<form name="login_form" method="post" action="/group4erp/loginProc.do">
	<b>IZ Books.co 전사적자원관리시스템</b><br><br><br><br><br>
	<table class="tab" cellpadding=5 cellspacing=5>
		<tr>
			<td>사원번호</td><td><input type="text" name="emp_id"></td>
		</tr>
		<tr>
			<td>비밀번호</td><td><input type="password" name="emp_pwd"></td>
		</tr>	
	</table>
</form>

<input type="button" name="loginBtn" value="로그인" onClick="checkLoginInfo();">&nbsp;
<!-- <input type="button" name="joinBtn" value="사원등록" onClick="joinMembership();">&nbsp;
<input type="button" name="deleteBtn" value="사원삭제" onClick="deleteMembership();"> -->

</body>
</html>