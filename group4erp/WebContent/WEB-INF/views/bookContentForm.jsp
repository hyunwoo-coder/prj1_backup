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
<form name="bookContentForm" method="post" action="/group4erp/joinProc.do">
	<b>서적 상세정보</b>
		<br>
		<a align=right href="javascript:goClose();">[닫기]</a>
		<table class="tbcss1" width="700" border=1 bordercolor="#000000" cellpadding=5 align=center>
			<tr>
				<th>책번호
				<td colspan=2>9123456789123
				<th>재고위치
				<td colspan=2>서울 가산점
			<tr>
				<th>책 이름
				<td colspan=5>111111-2222222
			<tr>
				<th>카테고리
				<td>사회
				<th>가격
				<td>15000
				<th>쪽수
				<td>250
			<tr>
				<th>저자
				<td>김태현
				<th>판매여부
				<td>O
				<th>판형
				<td>46배판
			<tr>
				<th>출판사
				<td>KOSMO
				<th>출판일
				<td>2019-12-25
				<th rowspan=2>재고수량
				<td rowspan=2>100권
			<tr>
				
				<th colspan=2>출판사 담당 직원
				<td colspan=2>조충래
		</table>
</form>

<input type="button" name="joinBtn" value="저장" onClick="checkLoginInfo();">&nbsp;

</body>
</html>