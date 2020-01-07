<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재할 서류 목록입니다.</title>
<script>

	$(document).ready(function() {

	});


	function viewDocument() {
		alert("결재 문서 보기 구현 예정");
	}
		
</script>
</head>
<body>
	<center>
		<h3>결재할 서류 목록</h3><br>
		
		<table class="approvalResList tab" name="approvalResList" cellpadding="5" cellspacing="5">
			<tr>
				<th>순서</th><th>결재 종류</th><th>문서일련번호</th><th>결재요청시간</th><th>비고</th>
			</tr>
			<c:forEach items='${approvalResList}' var="approvalResList" varStatus="loopTagStatus">
				<tr style="cursor:pointer" onClick="viewDocument();">
					<td>${approvalResList.e_works_no}</td>
					<td>${approvalResList.document_no}</td>
					<td>${approvalResList.e_works_req_dt}</td> 
					<td>${approvalResList.approval_state}</td> 
				</tr>	
			</c:forEach>
		
		</table>
		<c:if test="${approvalResList.length==0}">
			<h3>해당 결과가 없습니다.</h3>
		</c:if>
		
		<br><br><br>
		
		<span id="approvalReq"><h3>결재 요청한 서류 목록 [ ${approvalCnt} ]</h3></span>
		<table class="approvalReqList tab" name="approvalReqList" cellpadding="5" cellspacing="5">
			<tr>
				<th>순서</th><th>문서일련번호</th><th>결재요청시간</th><th>상태</th>
			</tr>
			<c:forEach items='${approvalReqList}' var="approvalReqList" varStatus="loopTagStatus">
				<tr style="cursor:pointer" onClick="viewDocument();">
					<td>${approvalReqList.e_works_no}</td>
					<td>${approvalReqList.document_no}</td>
					<td>${approvalReqList.e_works_req_dt}</td> 
					<td>${approvalReqList.approval_state}</td> 
				</tr>	
			</c:forEach>
		
		</table>
		<c:if test="${approvalReqList.size()==0}">
			<h3>해당 결과가 없습니다.</h3>
		</c:if>
		
	</center>
	
</body>
</html>