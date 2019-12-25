<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 전사적자원관리 시스템 </title>
<script>

$(document).ready(function(){  
	
	 $('[name=rowCntPerPage]').change(function(){
		 goSearchBook();
	 });
	   
	   
	 $(".pagingNumber").html(
			 getPagingNumber(
					 "${releaseListCnt}"                  //검색 결과 총 행 개수
	            	,"${invenSearchDTO.selectPageNo}"         //선택된 현재 페이지 번호
	            	,"${invenSearchDTO.rowCntPerPage}"      //페이지 당 출력행의 개수
	            	,"10"                              //페이지 당 보여줄 페이지번호 개수
	            	,"goSearchBook();"                  //페이지 번호 클릭 후 실행할 자스코드
	            	)
	         );
	
});

	function goSearchBook(){
		alert("검색 기능 구현중");
	}

	function goAllSearchBook(){
		alert("모두검색 기능 구현중");
	}

</script>

</head>
<body><center>
<h1>[출고 현황]</h1>
		<form name="bookReleaseSearch" method="post" action="/group4erp/">
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
				<select name="serachPublisher">
					<option value="">--------------</option>
					<c:forEach items="${requestScope.publisher}" var="publisher" varStatus="loopTagStatus">
                  		<option value="${publisher.publisher}">${publisher.publisher}</option>
               		</c:forEach>
				</select>
		</table>
		<br>
			<input type="button" value="  검색  " onclick="goSearchBook();">&nbsp;&nbsp;
     		<input type="button" value="모두검색" onclick="goAllSearchBook();">
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
      	<input type="hidden" name="selectPageNo">
		</form>

		<br><br><br>
		<table width="700" border=1 bordercolor="#000000" cellpadding=5 align=center>
			<tr>
				<th>책번호<th>책이름<th>출판사<th>출고갯수
			<c:forEach items="${requestScope.releaseList}" var="release" varStatus="loopTagStatus">
          	<tr style="cursor:pointer" onClick="goInvenContentForm(${release.release_no});">
            <td align=center>${release.book_name}
            <td align=center>${release.isbn13}
            <td align=center>${release.publisher}
            <td align=center>${release.books_qty}
         	</c:forEach>
		</table>
		<br>
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>

		<script>
			
			
			
		</script>
	</body>
</html>