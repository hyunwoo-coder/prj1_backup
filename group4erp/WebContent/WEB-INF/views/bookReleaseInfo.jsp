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
<body><center>
		<form name="bookReleaseSearch" method="post" action="/group4erp/">
		<table width="700" border=1 bordercolor="#000000" cellpadding=5 align=center>
			<tr>
			<th>출판사
			<td>
				<select name="publisher">
					<option value="출판사1">출판사1</option>
					<option value="출판사2">출판사2</option>
					<option value="출판사3">출판사3</option>
					<option value="출판사4">출판사4</option>
					<option value="출판사5">출판사5</option>
				</select>
			<tr>
			<th>판형
			<td>
				<input type="checkbox" name="publisher" value="판형1">판형1
				<input type="checkbox" name="publisher" value="판형1">판형1
				<input type="checkbox" name="publisher" value="판형1">판형1
				<input type="checkbox" name="publisher" value="판형1">판형1
				<input type="checkbox" name="publisher" value="판형1">판형1
			<tr>
			<th>키워드
			<td><input type="text" name="keyword1">
		</table>
		</form>

		<br><br><br>
		<table width="700" border=1 bordercolor="#000000" cellpadding=5 align=center>
			<tr>
				<th>책번호<th>책이름<th>출판사<th>출고갯수
			<tr>
				<td>1111-2222-3<td>rkskekfkak<td>booksbook<td>100권
		</table>


		<script>
			
			
			
		</script>
	</body>
</html>