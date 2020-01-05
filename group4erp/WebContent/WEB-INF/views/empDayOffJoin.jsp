<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 전사적자원관리 시스템 </title>
<script>



</script>

</head>
<body>
<cneter>
<b>[01월 휴가 신청]</b>
	<br>
	<table>
		<tr>
			<td>1. 2020년 01월 휴가 신청 입니다
		<tr>
			<td>2. 올해 OOO님의 남은 연가는 OO일 입니다.
		<tr>
			<td>3. 이번달 휴가 신청자는 OO명 입니다.
		<tr>
			<td>4. 한달에 나갈수 있는 휴가 일수는 4일이 최대이며
		<tr>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;4일 초과시 부서장의 승인이 있어야합니다.
	</table>
   <form name = "newRegForm" method="post" action="#">
         <table cellpadding=5 class="tbcss1">
            <tr>
               <th bgcolor=#DBDBDB >사원명
               <td><input type="text" name="emp_name" class="emp_name" size="10" maxlength=20>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>휴가종류
               <td>
					<select name="dayoff_code">
						<option value="">---------
						<option value="01">연차
						<option value="02">월차
						<option value="03">생리
						<option value="04">출산
						<option value="05">반차
						<option value="06">보상
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >휴가 기간
               <td><input type="text" name="start_dayoff" class="start_dayoff" size="20" maxlength=20>
			   &nbsp;~&nbsp;<input type="text" name="end_dayoff" class="end_dayoff" size="20" maxlength=20>
            </tr>

         </table>
   </form>

<input type="button" name="joinBtn" value="신청" onClick="checkLoginInfo();">&nbsp;

</body>
</html>