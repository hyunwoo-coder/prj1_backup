<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출장 신청 리스트</title>
<script>
	function goSearch(){
		var  searchKey = $("#selectSearch").val();
		var  keyword = $("#searchKeyword").val();
		$("#searchKey").val(searchKey);
		$("#keyword").val(keyword);

		$("#searchForm").submit()
	}
	function goBusinessTripForm(){
		location.replace("/group4erp/businessTripForm.do");
		}

	function goAllSearch(){
		$("#searchForm").submit()
	}
</script>
</head>
<body>
<center>
	<h1>[출장 리스트]</h1>
	<form id="searchForm" method="post" action="/group4erp/businessTripList.do">
		<input type= "hidden" name="searchKey" id="searchKey" >
		<input type= "hidden" name="keyword" id="keyword">
	</form>
	<form name="getBusinessTripListSearchForm" method="post" action="/group4erp/viewEmpList.do">
		검색조건<select id = "selectSearch">
					<option value="jikup">직급</option>
					<option value="emp_name">성명</option>
					<option value="dep_name">부서</option>
					<option value="destination">출장지</option>
					<option value="mgr_name">담당자 성함</option>
				</select>
		<input type="text" id="searchKeyword">&nbsp;&nbsp;<input type="button" value=" 검색 " onClick="goSearch();">
	
	&nbsp;&nbsp;<input type="button" value="모두검색" onClick="goAllSearch();">
	 <table border=0 width=700>
	 	<tr>
	    	<td align=right>
	        [총 개수] : ${getBusinessTripListCnt}&nbsp;&nbsp;&nbsp;&nbsp;
	            <select name="rowCntPerPage">
	               <option value="10">10</option>
	               <option value="15">15</option>
	               <option value="20">20</option>
	               <option value="25">25</option>
	               <option value="30">30</option>
	            </select> 행보기
      </table>
      <input type="hidden" name="selectPageNo">
	</form>
	
	<!-- <form na me="empListForm" method="post" action="/group4erp/viewEmpInfo.do"> -->
	
	<div id="blankArea"><br></div>
		<table class="businessTripListTable tbcss1" cellpadding="5" cellspacing="5" width="700">		
			<thead>
			<tr>
				<th>NO</th>
				<th>직급</th>
				<th>성명</th>
				<th>부서</th>
				<th>출장지</th>
				<th>출장사유</th>
				<th>출발시각</th>
				<th>복귀 예정 시각</th>
				<th>담당자 성함</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${businessTripList}" var="businessList" varStatus="loopTagStatus">
			<%-- <tr style="cursor:pointer" onClick="gobusinessTripContentForm(${businessList.emp_no});"> --%>
				<td align=center>${businessList.rownum}</td>	
				<td align=center>${businessList.jikup}</td>
				<td align=center>${businessList.emp_name}</td>
				<td align=center>${businessList.dep_name}</td>
				<td align=center>${businessList.destination}</td>
				<td align=center>${businessList.work_outside_reason}</td>
				<td align=center>${businessList.outside_start_time}</td>
				<td align=center>${businessList.outside_end_time}</td>
				<td align=center>
					<c:choose>
						<c:when test="${businessList.mgr_name ne ' '}">
							${businessList.mgr_name}
						</c:when>
						<c:otherwise>
								-
						</c:otherwise>				
					</c:choose>
				</td>
			</tr>		
			</c:forEach>
			</tbody>
		</table>
		<br>
		<input type="button" value="등록" onClick="gobusinessTripForm();">
		<br><br>
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
	<!-- </form>  -->

</center>

</body>
</html>