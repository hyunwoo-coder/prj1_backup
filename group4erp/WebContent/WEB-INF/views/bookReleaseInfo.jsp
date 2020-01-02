<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>출고 현황 </title>
<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}

 input[type="date"]::-webkit-calendar-picker-indicator,
 input[type="date"]::-webkit-inner-spin-button {
     display: none;
     appearance: none;
 }
 
 input[type="date"]::-webkit-calendar-picker-indicator {
   color: rgba(0, 0, 0, 0); /* 숨긴다 */
   opacity: 1;
   display: block;
   background: url(https://mywildalberta.ca/images/GFX-MWA-Parks-Reservations.png) no-repeat; /* 대체할 아이콘 */
   width: 20px;
   height: 20px;
   border-width: thin;
}
</style>
<script>

$(document).ready(function(){  
	
	
	$("#datepicker1").datepicker({
		
	    onSelect: function() { 
	        var dateObject = $(this).datepicker('getDate');
	    }
	});
	$("#datepicker2").datepicker({
	    onSelect: function() { 
	        var dateObject = $(this).datepicker('getDate');
	    }
	});
	
	 $('[name=rowCntPerPage]').change(function(){
		 goSearchRelease();
	 });
	   
	   
	 $(".pagingNumber").html(
			 getPagingNumber(
					 "${releaseListCnt}"                  //검색 결과 총 행 개수
	            	,"${invenSearchDTO.selectPageNo}"         //선택된 현재 페이지 번호
	            	,"${invenSearchDTO.rowCntPerPage}"      //페이지 당 출력행의 개수
	            	,"10"                              //페이지 당 보여줄 페이지번호 개수
	            	,"goSearchRelease();"                  //페이지 번호 클릭 후 실행할 자스코드
	            	)
	         );
	   
	 setTableTrBgColor(
				"releaseListTable"								//테이블 class값
				, "${headerColor}"									//해더 tr 배경색
				, "${oddTrColor}"									//홀수행 배경색
				, "${evenColor}"									//짝수행 배경색
				, "${mouseOverColor}"								//마우스 온 시 배경색
	);
	 inputData('[name=rowCntPerPage]',"${invenSearchDTO.rowCntPerPage}");
	 inputData('[name=selectPageNo]',"${invenSearchDTO.selectPageNo}");
	 inputData('[name=searchPublisher]',"${invenSearchDTO.searchPublisher}");
	 inputData('[name=keyword1]',"${invenSearchDTO.keyword1}");
	 <c:forEach items="${invenSearchDTO.inventory_loc}" var="loc">
		inputData( "[name=inventory_loc]", "${loc}" );
	 </c:forEach>
});

	function goSearchRelease(){
		//alert("검색 기능 구현중");
		//alert( $("[name=bookReleaseSearch]").serialize() );
		//return;
		
		//alert($('[name=dateFrom]').val());
		//return;
		
		document.bookReleaseSearch.submit();
	}

	function goAllSearchRelease(){
		//alert("모두검색 기능 구현중");
		document.bookReleaseSearch.reset();
		goSearchRelease();
	}
	
	function goReleaseContentForm(all_order_no){
		//alert("all_order_no="+all_order_no);
		//return;
		var str = "all_order_no="+all_order_no;
		location.href="/group4erp/goReleaseContentForm.do?"+str;
	}
	
	function searchToday(){
		
		$('[name=searchToday]').val('y');
		goSearchRelease();
	}

	
	function goReleaseUp(all_order_no){
		
		var str = "all_order_no="+all_order_no;
		
		$.ajax({
			//호출할 서버쪽 URL주소 설정
			url : "/group4erp/goReleaseUp.do"
			//전송 방법 설정
			, type : "POST"
			//서버로 보낼 파라미터명과 파라미터값을 설정
			, data : str
			//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			//매개변수 upDelCnt에는 입력 행의 개수가 들어온다.
			, success : function(updateCnt){
				if(updateCnt==1){
					alert("출고 날짜 등록 성공");
					location.replace("/group4erp/goReleaseList.do")
				}else if(updateCnt==0){
					alert("출고 날짜 등록 실패");
				}else if(updateCnt==-1){
					alert("재고가 부족합니다!");
				}else { alert("서버 오류!"); }
			}
			//서버의 응답을 못 받았을 경우 실행할 익명함수 설정
			, error : function(){
				alert("서버 접속 실패");
			}
		});
		
	}
</script>

</head>
<body><center>
<h1>[출고 현황]</h1>
		<form name="bookReleaseSearch" method="post" action="/group4erp/goReleaseList.do">
		<table width="600" border=1 bordercolor="#000000" cellpadding=5 align=center>
			<tr>
			<th>지역
			<td align=center colspan=3>
	        	<c:forEach items="${requestScope.inventory_loc}" var="inven" varStatus="loopTagStatus">
             		<input type="checkbox" name="inventory_loc" value="${inven.branch_name}">${inven.branch_name}
            	</c:forEach>
			<tr>
			<th>일자
			<td width=300>
				<input type="text" id="datepicker1" name="dateFrom">&nbsp;~&nbsp;
				<input type="text" id="datepicker2" name="dateTill">
			<th>출판사
			<td align=center>
				<select name="searchPublisher">
					<option value="">--------------</option>
					<c:forEach items="${requestScope.publisher}" var="publisher" varStatus="loopTagStatus">
                  		<option value="${publisher.publisher}">${publisher.publisher}</option>
               		</c:forEach>
				</select>
			<tr>
			<th>키워드
			<td colspan=4><input type="text" name="keyword1" size=40>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a style="cursor:pointer" onclick="searchToday();">[금일 검색]</a>
			<input type="hidden" name="searchToday">
			<script>
				 $("#datepicker1").datepicker({ dateFormat: 'yy-mm-dd' });
				 $("#datepicker2").datepicker({ dateFormat: 'yy-mm-dd' });
			</script>
		</table>
		<br>
			<input type="button" value="  검색  " onclick="goSearchRelease();">&nbsp;&nbsp;
     		<input type="button" value="모두검색" onclick="goAllSearchRelease();">
     	<table border=0 width=700>
         <tr>
            <td align=right>
            [검색 수량] : ${releaseListCnt} 개
               <select name="rowCntPerPage">
                  <option value="10">10</option>
                  <option value="15">15</option>
                  <option value="20">20</option>
                  <option value="25">25</option>
                  <option value="30">30</option>
               </select> 행보기
     	</table>
      	<input type="hidden" name="selectPageNo" value="${invenSearchDTO.selectPageNo}">
		</form>

		<br><br><br>
		<table class="releaseListTable" width="700" border=1 bordercolor="#000000" cellpadding=5 align=center>
			<tr>
				<th>번호<th>출고번호<th>출고일시<th>주문번호<th>비고
			<c:forEach items="${requestScope.releaseList}" var="release" varStatus="loopTagStatus">
            <c:choose>
	            <c:when test="${release.release_dt=='X'}">
	            	<tr>
		          	<td align=center>${releaseListCnt-
		                  (invenSearchDTO.selectPageNo*invenSearchDTO.rowCntPerPage-invenSearchDTO.rowCntPerPage+1+loopTagStatus.index)
		                  +1}
		            <td align=center>${release.release_no}
		            <td align=center>${release.release_dt}
		            <td align=center>${release.all_order_no}
	            	<td align=center>
	            	<input type="button" value="출고" onclick="goReleaseUp(${release.all_order_no});">
	            </c:when>
	            <c:otherwise>
	            	<tr style="cursor:pointer" onClick="goReleaseContentForm(${release.all_order_no});">
		          	<td align=center>${releaseListCnt-
		                  (invenSearchDTO.selectPageNo*invenSearchDTO.rowCntPerPage-invenSearchDTO.rowCntPerPage+1+loopTagStatus.index)
		                  +1}
		            <td align=center>${release.release_no}
		            <td align=center>${release.release_dt}
		            <td align=center>${release.all_order_no}
	            	<td align=center>------
	            </c:otherwise>
            </c:choose>
         	</c:forEach>
		</table>
		<br>
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>

		<script>
			
			
			
		</script>
	</body>
</html>