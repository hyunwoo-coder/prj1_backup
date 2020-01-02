<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 전사적자원관리 시스템 </title>
<script>

	function goClose(){
		history.go(-1);
	}

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
				<td colspan=2>${bookInfo.isbn13}
				<th>재고위치
				<td colspan=2>${bookInfo.branch_name}
			<tr>
				<th>책 이름
				<td colspan=5>${bookInfo.book_name}
			<tr>
				<th>카테고리
				<td>${bookInfo.cat_name}
				<th>가격
				<td>${bookInfo.book_price}
				<th>쪽수
				<td>${bookInfo.book_pages}
			<tr>
				<th>저자
				<td>${bookInfo.writer}
				<th>판매여부
				<td>${bookInfo.is_print}
				<th>판형
				<td>${bookInfo.size_name}
			<tr>
				<th>출판사
				<td>${bookInfo.publisher}
				<th>출판일
				<td>${bookInfo.published_dt}
				<th rowspan=2>재고수량
				<td rowspan=2>${bookInfo.isbn_cnt}
			<tr>
				
				<th colspan=2>출판사 담당 직원
				<td colspan=2>${bookInfo.editor}
		</table>
</form>

</body>
</html>