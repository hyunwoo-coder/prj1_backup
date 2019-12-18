<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 ERP 메인 페이지</title>
</head>
<body><center>

<table border="0" cellpadding=5 cellspacing=0 width="95%" >
	<tr height="50">
		<td align="center"><%@ include file ="/WEB-INF/views/headerMenu.jsp" %></td>
	</tr>
	<tr valign=top>
		<td align="center" height="500"><br><br>
			<c:if test="${subMenu.equals('eventReserve') }">
				<%@ include file="/WEB-INF/views/eventScheduleForm.jsp" %>
			</c:if>
			
			<c:if test="${subMenu.equals('viewInventoryList') }">
				<%@ include file="/WEB-INF/views/book_inven_search.jsp" %>
			</c:if>
		</td>
	</tr>
	<tr height="50">
		<td align="center"><%@ include file ="/WEB-INF/views/footer.jsp" %></td>
	</tr>

</table>
</center>
</body>
</html>