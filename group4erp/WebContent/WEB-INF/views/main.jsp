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
			
			<!-- 재고현황목록 -->
			<c:if test="${subMenu.equals('viewInventoryList') }">
				<%@ include file="/WEB-INF/views/book_inven_search.jsp" %>
			</c:if>
			
			
			<!-- 직원현황조회 -->
			<c:if test="${subMenu.equals('viewEmpList') }">
				<%@ include file="/WEB-INF/views/empListForm.jsp" %>
			</c:if>
			
			<!-- 급여지급현황(인사팀 조회 & 직원 전체 목록) -->
			<c:if test="${subMenu.equals('viewSalList') }">
				<%@ include file="/WEB-INF/views/salListForm.jsp" %>
			</c:if>
			
			<!-- 급여지급현황(인사팀 조회 & 직원별 상세정보) -->
			<c:if test="${subMenu.equals('viewEmpSalInfo') }">
				<%@ include file="/WEB-INF/views/empSalInfo.jsp" %>
			</c:if>
			
			<!-- 직원 근무 현황 -->
			<c:if test="${subMenu.equals('viewEmpWorkStateList') }">
				<%@ include file="/WEB-INF/views/empWorkingStateList.jsp" %>
			</c:if>
			
			<!-- 직원 휴가 현황 -->
			<c:if test="${subMenu.equals('viewDayOffList') }">
				<%@ include file="/WEB-INF/views/empDayOffList.jsp" %>
			</c:if>
			
			
			<!-- 매출정보 조회 -->
			<c:if test="${subMenu.equals('viewSalesReport') }">
				<%@ include file="/WEB-INF/views/salesReportForm.jsp" %>
			</c:if>
			
			<!-- 담당 상품 조회 -->
			<c:if test="${subMenu.equals('viewMyCareBookList') }">
				<%@ include file="/WEB-INF/views/mycarebooklist.jsp" %>
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