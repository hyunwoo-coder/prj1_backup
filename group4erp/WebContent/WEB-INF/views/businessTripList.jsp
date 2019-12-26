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

		setTableBgColor(
				"businessTripListTable"								//테이블 class값
				, "${headerColor}"									//해더 tr 배경색
				, "${oddTrColor}"									//홀수행 배경색
				, "${evenColor}"									//짝수행 배경색
				, "${mouseOverColor}"								//마우스 온 시 배경색
		);


		$('[name=selectPageNo]').val("${businessTripSearchDTO.selectPageNo}");
		$('[name=rowCntPerPage]').val("${businessTripSearchDTO.rowCntPerPage}");


		
		//inputData('[name=rowCntPerPage]',"${businessTripSearchDTO.rowCntPerPage}");
		//inputData('[name=selectPageNo]',"${businessTripSearchDTO.selectPageNo}");

		//alert("${businessTripSearchDTO.selectPageNo}");
		
	});

	
	
	function goSearch(){
		//alert("tdtdtd");
		var  searchKey = $("#selectSearch").val();
		var  keyword = $("#searchKeyword").val();
		$("#searchKey").val(searchKey);
		$("#keyword").val(keyword);


		//inputData('[name=selectPageNo]',"${boardSearchDTO.selectPageNo}");
		
		/* $("#searchForm").submit() */

		doucumnet.getBusinessTripListSearchForm.submit();
	}
	function goAllSearch(){
		$("#searchForm").submit()
	}
	
	function goBusinessTripForm(){
		location.replace("/group4erp/businessTripForm.do");
	}







	function getPagingNumber(
			totRowCnt               // 검색 결과 총 행 개수
			, selectPageNo_str         // 선택된 현재 페이지 번호
			, rowCntPerPage_str     // 페이지 당 출력행의 개수
			, pageNoCntPerPage_str  // 페이지 당 출력번호 개수
			, jsCodeAfterClick      // 페이지 번호 클릭후 실행할 자스 코드
		) {
			//--------------------------------------------------------------
			// name=nowPage을 가진 hidden 태그없으면 경고하고 중지하는 자바스크립트 소스 생성해 저장
			alert("test");
			//--------------------------------------------------------------
			if( $('[name=selectPageNo]').length==0 ){
				alert("name=selectPageNo 을 가진 hidden 태그가 있어야 getPagingNumber(~) 함수 호출이 가능함.');" );
				return;
			}
			var arr = [];
			try{
				if( totRowCnt==0 ){	return ""; }	
				if( jsCodeAfterClick==null || jsCodeAfterClick.length==0){
					alert("getPagingNumber(~) 함수의 5번째 인자는 존재하는 함수명이 와야 합니다");
					return "";
				}			
				//--------------------------------------------------------------
				// 페이징 처리 관련 데이터 얻기
				//--------------------------------------------------------------
				if( selectPageNo_str==null || selectPageNo_str.length==0 ) { 
					selectPageNo_str="1";  // 선택한 현재 페이지 번호 저장
				} 
				if( rowCntPerPage_str==null || rowCntPerPage_str.length==0 ) { 
					rowCntPerPage_str="10";  // 선택한 현재 페이지 번호 저장
				}
				if( pageNoCntPerPage_str==null || pageNoCntPerPage_str.length==0 ) { 
					pageNoCntPerPage_str="10";  // 선택한 현재 페이지 번호 저장
				}
				//---
				var selectPageNo = parseInt(selectPageNo_str, 10);
				var rowCntPerPage = parseInt(rowCntPerPage_str,10);
				var pageNoCntPerPage = parseInt(pageNoCntPerPage_str,10);
				if( rowCntPerPage<=0 || pageNoCntPerPage<=0 ) { return; }
				//--------------------------------------------------------------
				//최대 페이지 번호 얻기
				//--------------------------------------------------------------
				var maxPageNo=Math.ceil( totRowCnt/rowCntPerPage );   
					if( maxPageNo<selectPageNo ) { selectPageNo = 1; }

				//--------------------------------------------------------------
				// 선택된 페이지번호에 따라 출력할 [시작 페이지 번호], [끝 페이지 번호] 얻기
				//--------------------------------------------------------------
				var startPageNo = Math.floor((selectPageNo-1)/pageNoCntPerPage)*pageNoCntPerPage+1;  // 시작 페이지 번호
				var endPageNo = startPageNo+pageNoCntPerPage-1;                                      // 끝 페이지 번호
					if( endPageNo>maxPageNo ) { endPageNo=maxPageNo; }
					/*//--------------------------------------------------------------
					// <참고>위 코딩은 아래 코딩으로 대체 가능
					//--------------------------------------------------------------
					var startPageNo = 1;
					var endPageNo = pageNoCntPerPage;
					while( true ){
						if( selectPageNo <= endPageNo ){ startPageNo = endPageNo - pageNoCntPerPage + 1; break; }
						endPageNo = endPageNo + pageNoCntPerPage;
					}*/

				//---
				var cursor = " style='cursor:pointer' ";
				//arr.push( "<table border=0 cellpadding=3 style='font-size:13'  align=center> <tr>" );
				//--------------------------------------------------------------
				// [처음] [이전] 출력하는 자바스크립트 소스 생성해 저장
				//--------------------------------------------------------------
				//arr.push( "<td align=right width=110> " );
				if( startPageNo>pageNoCntPerPage ) {
					arr.push( "<span "+cursor+" onclick=\"$('[name=selectPageNo]').val('1');"
									+jsCodeAfterClick+";\">[처음]</span>" );
					arr.push( "<span "+cursor+" onclick=\"$('[name=selectPageNo]').val('"
						+(startPageNo-1)+"');"+jsCodeAfterClick+";\">[이전]</span>   " );
				}
				//--------------------------------------------------------------
				// 페이지 번호 출력하는 자바스크립트 소스 생성해 저장
				//--------------------------------------------------------------
				//arr.push( "<td align=center>  " );
				for( var i=startPageNo ; i<=endPageNo; ++i ){
					if(i>maxPageNo) {break;}
					if(i==selectPageNo || maxPageNo==1 ) {
						arr.push( "<b>"+i +"</b> " );
					}else{
						arr.push( "<span "+cursor+" onclick=\"$('[name=selectPageNo]').val('"
									+(i)+"');"+jsCodeAfterClick+";\">["+i+"]</span> " );
					}
				}
				//--------------------------------------------------------------
				// [다음] [마지막] 출력하는 자바스크립트 소스 생성해 저장
				//--------------------------------------------------------------
				//arr.push( "<td align=left width=110>  " );
				if( endPageNo<maxPageNo ) {
					arr.push( "   <span "+cursor+" onclick=\"$('[name=selectPageNo]').val('"
								+(endPageNo+1)+"');"+jsCodeAfterClick+";\">[다음]</span>" );
					arr.push( "<span "+cursor+" onclick=\"$('[name=selectPageNo]').val('"
								+(maxPageNo)+"');"+jsCodeAfterClick+";\">[마지막]</span>" );
				}
				//arr.push( "</table>" );
				return arr.join( "" );
			}catch(ex){
				alert("getPagingNumber(~) 메소드 호출 시 예외발생!");
				return "";
			}
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
	
	<form name="getBusinessTripListSearchForm" method="post" action="/group4erp/businessTripList.do">
	
	<input type="hidden" name="selectPageNo"> 
      <input type="hidden" name="rowCntPerPage">
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
	        [총 개수] : ${businessTripListAllCnt}&nbsp;&nbsp;&nbsp;&nbsp;
	            <select name="rowCntPerPage">
	               <option value=10>10</option>
	               <option value=15>15</option>
	               <option value=20>20</option>
	               <option value=25>25</option>
	               <option value=30>30</option>
	            </select> 행보기
      </table>
      
	</form>
	<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
	
	<!-- <form na me="empListForm" method="post" action="/group4erp/viewEmpInfo.do"> -->
	
	<div id="blankArea"><br></div>
		<table class="businessTripListTable tbcss1" name="businessTripListTable" cellpadding="5" cellspacing="5" width="1000">		
			<thead>
			<tr>
				<th>NO</th>
				<th width="100">직급</th>
				<th width="60">성명</th>
				<th width="70">부서</th>
				<th width="100">출장지</th>
				<th width="120">출장사유</th>
				<th width="150">출발시각</th>
				<th width="150">복귀 예정 시각</th>
				<th width="80">담당자 성함</th>
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
		<input type="button" value="등록" onClick="goBusinessTripForm();">
		<br><br>
	<!-- </form>  -->

</center>

</body>
</html>