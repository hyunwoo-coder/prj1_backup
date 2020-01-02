<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출장 신청 리스트</title>
<script>
	$(document).ready(function(){

		$('[name=rowCntPerPage]').change(function(){
			goSearch();
		});
		
		//alert("${businessTripSearchDTO.selectPageNo}");
		
		/* alert($("[name=getBusinessTripListSearchForm] [name=selectPageNo]").val());
		alert($("[name=getBusinessTripListSearchForm] [name=rowCntPerPage]").val()); */
		//페이징 처리 관련 HTML 소스를 class=pagingNumber 가진 태그 안에 삽입하기
		$(".pagingNumber").html(
				getPagingNumber(
				"${businessTripListAllCnt}"						//검색 결과 총 행 개수
				,"${businessTripSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
				,"${businessTripSearchDTO.rowCntPerPage}"			//페이지 당 출력행의 개수
				,"15"										//페이지 당 보여줄 페이지번호 개수
				,"goSearch();"								//페이지 번호 클릭 후 실행할 자스코드
			)
		);

		//$'[name=selectPageNo]').val("${businessTripSearchDTO.selectPageNo}");
		//$('[name=rowCntPerPage]').val("${businessTripSearchDTO.rowCntPerPage}");
		inputData('[name=rowCntPerPage]',"${businessTripSearchDTO.rowCntPerPage}");
		inputData('[name=selectPageNo]',"${businessTripSearchDTO.selectPageNo}");
		inputData('#selectSearch',"${businessTripSearchDTO.searchKey}");
		inputData('#searchKeyword',"${businessTripSearchDTO.keyword}");
		inputData('#sort',"${businessTripSearchDTO.sort}");
	

		//alert("${businessTripSearchDTO.rowCntPerPage}");
});

	
	
	function goSearch(){
		var  searchKey = $("#selectSearch").val();
		var  keyword = $("#searchKeyword").val();
		
		$("#searchKey").val(searchKey);
		$("#keyword").val(keyword);
		
		$("#searchForm").submit()

		document.getBusinessTripListSearchForm.submit();
	}
	function goAllSearch(){
		document.getBusinessTripListSearchForm.reset();
		//$("#searchForm").submit()
		$('[name=getBusinessTripListSearchForm] [name=rowCntPerPage]').val('10');
		$('[name=getBusinessTripListSearchForm] [name=selectPageNo]').val('1');
		goSearch();
	}
	
	function goBusinessTripForm(){
		location.replace("/group4erp/businessTripForm.do");
	}

	function goBusinessTripContentsForm(work_outside_seq){
		//var selectPageNo = $('[name=boardListForm] [name=selectPageNo]').val();
		//var rowCntPerPage = $('[name=boardListForm] [name=rowCntPerPage]').val();
		//location.replace("/z_spring/boardContentForm.do?b_no="+b_no+"&selectPageNo="+selectPageNo+"&rowCntPerPage="+rowCntPerPage)
		//위 코딩과 아래 코딩은 동일한 값을 넘긴다.
		//상세보기 화면으로 이동할때 가져갈 파라미터값을 만든다.
		var str = "work_outside_seq="+work_outside_seq+"&"+$('[name=getBusinessTripListSearchForm]').serialize();
		/*
		$(".xxx").remove();
		$("body").prepend("<div class=xxx><hr>"+str+"<hr></div>");
		return;
		*/
		location.replace("/group4erp/businessTripContentsForm.do?"+str )
	}
			
	
</script>

</head>
<body>
<center>
	<h1>[출장 리스트]</h1>
	<form name="getBusinessTripListSearchForm" method="post" action="/group4erp/businessTripList.do">
		
        
		검색조건<select id = "selectSearch">
					<option value="jikup">직급</option>
					<option value="emp_name">성명</option>
					<option value="dep_name">부서</option>
					<option value="destination">출장지</option>
					<option value="outside_start_time">출발 날짜</option>
					<option value="outside_end_time">복귀 날짜</option>
					<option value="mgr_name">직속 상관</option>
					<option value="travel_payment">결제 여부</option>
				</select>
		<input type="text" id="searchKeyword">&nbsp;&nbsp;<input type="button" value=" 검색 " onClick="goSearch();">
	
	&nbsp;&nbsp;<input type="button" value="모두검색" onClick="goAllSearch();">
	 <table border=0 width=700>
	 	<tr>
	    	<td align=right>
	        [총 개수] : ${businessTripListAllCnt}&nbsp;&nbsp;&nbsp;&nbsp;
	            <select name="rowCntPerPage">
	               <option value=10>10</option>
	               <option value=15>15</option>
	               <option value=20>20</option>
	               <option value=25>25</option>
	               <option value=30>30</option>
	            </select> 행보기
      </table>
     
        <input type="text" name="searchKey" id="searchKey" >
		<input type="hidden" name="keyword" id="keyword">
		<input type="hidden" name="selectPageNo"> 
        <input type="hidden" name="rowCntPerPage">
        <input type="hidden" name="sort" id="sort">
        <!-- <input type="hidden" name="work_outside_seq" id="work_outside_seq"> -->
        
	</form>
	<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
	
	<div id="blankArea"><br></div>
		<table class="businessTripListTable tbcss1" name="businessTripListTable" cellpadding="5" cellspacing="5">		
			<thead>
				<tr>
					<th>번호</th>
						
					<c:choose>
						<c:when test="${param.sort=='11 desc'}">
							<th style="cursor:pointer" onClick="$('[name=sort]').val('11 asc'); goSearch();"> ▼ 직급</th>
						</c:when>
						<c:when test="${param.sort=='11 asc'}">
							<th style="cursor:pointer" onClick="$('[name=sort]').val('11 desc'); goSearch();"> ▲ 직급</th>
						</c:when>			
						<c:otherwise>
							<th style="cursor:pointer" onClick="$('[name=sort]').val('11 asc'); goSearch();">직급</th>
						</c:otherwise>
				    </c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='3 desc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('3 asc'); goSearch();">▼성명</th>
						</c:when>
						<c:when test="${param.sort=='3 asc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('3 desc'); goSearch();">▲성명</th>
						</c:when>
						<c:otherwise>
							<th style="cursor:pointer" onclick="$('[name=sort]').val('3 asc'); goSearch();">성명</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>	
						<c:when test="${param.sort=='4 desc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('4 asc'); goSearch();">▼부서명</th>
						</c:when>
						<c:when test="${param.sort=='4 asc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('4 desc'); goSearch();">▲부서명</th>
						</c:when>
						<c:otherwise>
							<th style="cursor:pointer" onclick="$('[name=sort]').val('4 asc'); goSearch();">부서명</th>
						</c:otherwise>
					</c:choose>	
					
					<c:choose>
						<c:when test="${param.sort=='5 desc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('5 asc'); goSearch();">▼출장지</th>
						</c:when>
						<c:when test="${param.sort=='5 asc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('5 desc'); goSearch();">▲출장지</th>
						</c:when>
						<c:otherwise>
							<th style="cursor:pointer" onclick="$('[name=sort]').val('5 asc'); goSearch();">출장지</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='6 desc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('6 asc'); goSearch();">▼출장사유</th>
						</c:when>
						<c:when test="${param.sort=='6 asc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('6 desc'); goSearch();">▲출장사유</th>
						</c:when>
						<c:otherwise>
							<th style="cursor:pointer" onclick="$('[name=sort]').val('6 asc'); goSearch();">출장사유</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='7 desc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('7 asc'); goSearch();">▼출발 날짜</th>
						</c:when>
						<c:when test="${param.sort=='7 asc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('7 desc'); goSearch();">▲출발 날짜</th>
						</c:when>
						<c:otherwise>
							<th style="cursor:pointer" onclick="$('[name=sort]').val('7 asc'); goSearch();">출발 날짜</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='8 desc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('8 asc'); goSearch();">▼복귀 예정 날짜</th>
						</c:when>
						<c:when test="${param.sort=='8 asc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('8 desc'); goSearch()">▲복귀 예정 날짜</th>
						</c:when>
						<c:otherwise>
							<th style="cursor:pointer" onclick="$('[name=sort]').val('8 asc'); goSearch();">복귀 예정 날짜</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='9  desc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('9  asc'); goSearch();">▼담당자 성함</th>
						</c:when>
						<c:when test="${param.sort=='9  asc'}">
							<th style="cursor:pointer" onclick="$('[name=sort]').val('9  desc'); goSearch();">▲담당자 성함</th>
						</c:when>
						<c:otherwise>
							<th style="cursor:pointer" onclick="$('[name=sort]').val('9  asc'); goSearch();">담당자 성함</th>
						</c:otherwise>
					</c:choose>
					
					<th>결제 여부</th>
				</tr>
			</thead>
			<tbody>
			
			<c:forEach items="${businessTripList}" var="businessList" varStatus="loopTagStatus">
			<%-- <tr style="cursor:pointer" onClick="goBusinessTripContentsForm(${work_outside_seq});"> --%>
					<td align=center>${businessList.RNUM}</td>	
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
					<td>
					<c:choose>
							<c:when test="${businessList.travel_payment eq 'Y'}">
								승인
							</c:when>
							<c:when test="${businessList.travel_payment eq 'N'}">
								기각
							</c:when>
							<c:otherwise>
								대기중
							</c:otherwise>				
						</c:choose>
					</td>
			</tr>		
			</c:forEach>
			</tbody>
		</table>
		<br>
		<input type="button" value="등록" onClick="goBusinessTripForm();">	
		<br><br>
		
		
<c:if test=" ${boardListAllCnt==0}">
   		검색 결과가 없습니다
   		
</c:if>

</center>

</body>
</html>