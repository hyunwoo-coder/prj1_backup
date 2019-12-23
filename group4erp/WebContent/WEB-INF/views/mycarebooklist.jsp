<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담당 상품 조회</title>
<script>
</script>
</head>
<body>
	<center>
	<form name="mycarebooklist" method="post" action="/group4erp/goMyCareBookList.do">
		<table class="mycarebookTable tbcss2" border=0 cellspacing=0 cellpadding=5 width=700>
			<tr>
				<th>책번호<th>책 이름<th>카테고리<th>출판사<th>가격<th>수량<th>재고위치
			<tr>
			<%-- 
				<c:forEach items="${requestScope.MyCareBookList}" var="book" varStatus="loopTagStatus">
				<td align=center>${MyCareBookList.ISBN13}
				<td align=center>${MyCareBookList.book_name}
				<td align=center>${MyCareBookList.cat_name}
				<td align=center>${MyCareBookList.publisher}
				<td align=center>${MyCareBookList.book_price}
				<td align=center>${MyCareBookList.book_pages}
				<td align=center>${MyCareBookList.editor}
				</c:forEach>
				 --%>
		</table>
	</form>
	
</body>
</html>