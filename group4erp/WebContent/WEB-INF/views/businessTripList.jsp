<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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


		
	

		//alert("${businessTripSearchDTO.rowCntPerPage}");
		
		$('.businessTripListTable thead:eq(0) tr:eq(0) th').click(function(){
					var thisThObj = $(this);
					var ascdesc = "";
					thisThObj.siblings().each(function(){
						var txt = $(this).text();
						txt = $.trim(txt);
						txt = txt.replace("▲","");
						txt = txt.replace("▼","");
						$(this).text(txt);
		});
	
					var txt = thisThObj.text();
					if(txt.indexOf("▲") >= 0){
						txt = txt.replace("▲" , "▼");
						ascdesc = "desc";
					}
					else if(txt.indexOf("▼") >= 0){
						txt = txt.replace("▼" , "▲");
						ascdesc = "asc";
					}
					else{
						txt = txt + "▲";
						ascdesc = "asc";
					}
					thisThObj.text(txt);

					var thindexno = thisThObj.index();

					$("#thindexno").val(thindexno);
					$("#ascdesc").val(ascdesc);
					
					//alert(thindexno);
					//alert(ascdesc);
					
					//alert("${businessTripSearchDTO.thindexno}");
					//alert("${businessTripSearchDTO.ascdesc}");
					
					goSearch()
	});
});

	
	
	function goSearch(){
		//alert("tdtdtd");
		var  searchKey = $("#selectSearch").val();
		var  keyword = $("#searchKeyword").val();

		$("#searchKey").val(searchKey);
		$("#keyword").val(keyword);


		//inputData('[name=selectPageNo]',"${boardSearchDTO.selectPageNo}");
		
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
					<option value="mgr_name">담당자 성함</option>
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
     
        <input type="hidden" name="searchKey" id="searchKey" >
		<input type="hidden" name="keyword" id="keyword">
		<input type="hidden" name="selectPageNo"> 
        <input type="hidden" name="rowCntPerPage">
        <input type="hidden" name="thindexno" id="thindexno">
        <input type="hidden" name="ascdesc" id="ascdesc">
        
	</form>
	<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
	
	<div id="blankArea"><br></div>
		<table class="businessTripListTable tab" name="businessTripListTable" cellpadding="5" cellspacing="5" width="1000">		
			<thead>
				<tr>
					<th style="cursor:pointer">NO</th>
					<th width="100" style="cursor:pointer">직급</th>
					<th width="60"  style="cursor:pointer">성명</th>
					<th width="70"  style="cursor:pointer">부서</th>
					<th width="100" style="cursor:pointer">출장지</th>
					<th width="120" style="cursor:pointer">출장사유</th>
					<th width="150" style="cursor:pointer">출발 날짜</th>
					<th width="150" style="cursor:pointer">복귀 예정 날짜</th>
					<th width="80"  style="cursor:pointer">담당자 성함</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${businessTripList}" var="businessList" varStatus="loopTagStatus">
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
			</tr>		
			</c:forEach>
			</tbody>
		</table>
		<br>
		<input type="button" value="등록" onClick="goBusinessTripForm();">
		<br><br>
	<!-- </form>  -->

</center>

</body>
</html>