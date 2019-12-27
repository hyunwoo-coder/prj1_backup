<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출고 현황 </title>
<script>

$(document).ready(function(){  
	
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

</script>

</head>
<body><center>
<h1>[출고 현황]</h1>
		<form name="bookReleaseSearch" method="post" action="/group4erp/goReleaseList.do">
		<table width="700" border=1 bordercolor="#000000" cellpadding=5 align=center>
			<tr>
			<th>지역
			<td align=center colspan=3>
	        	<c:forEach items="${requestScope.inventory_loc}" var="inven" varStatus="loopTagStatus">
             		<input type="checkbox" name="inventory_loc" value="${inven.branch_name}">${inven.branch_name}
            	</c:forEach>
			<tr>
			<th>키워드
			<td width=300><input type="text" name="keyword1" size=40>
			<th>출판사
			<td align=center>
				<select name="searchPublisher">
					<option value="">--------------</option>
					<c:forEach items="${requestScope.publisher}" var="publisher" varStatus="loopTagStatus">
                  		<option value="${publisher.publisher}">${publisher.publisher}</option>
               		</c:forEach>
				</select>
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
				<th>번호<th>출고번호<th>출고일시<th>주문번호
			<c:forEach items="${requestScope.releaseList}" var="release" varStatus="loopTagStatus">
          	<tr style="cursor:pointer" onClick="goReleaseContentForm(${release.all_order_no});">
          	<td align=center>${releaseListCnt-
                  (invenSearchDTO.selectPageNo*invenSearchDTO.rowCntPerPage-invenSearchDTO.rowCntPerPage+1+loopTagStatus.index)
                  +1}
            <td align=center>${release.release_no}
            <td align=center>${release.release_dt}
            <td align=center>${release.all_order_no}
         	</c:forEach>
		</table>
		<br>
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>

		<script>
			
			
			
		</script>
	</body>
</html>