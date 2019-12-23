 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script>

	function goBusinessTripForm(){}
</script>	
	
<meta charset="UTF-8">
<title>출장신청&보고 리스트</title>
</head>
<body> <form name="businessTripList" method="post" action="/group4erp/businessTripForm.do">
      <div style="width:800">
      
        <!-- 키워드 검색 입력 양식 표현하기 -->
         [키워드] : <input type="text" name="keyword1" class="keyword1">
         
  
         <input type="button" value="   검색   " class="contactSearch" onclick="goSearch();">&nbsp;
         <input type="button" value=" 모두검색 " onclick="goSearchAll();">&nbsp;
         <a href="javascript:goBoardRegForm();">출장신청&보고</a>&nbsp;&nbsp;
         
        <input type="hidden" name="selectPageNo">
        
      </div><br>
      <table border=0 width=700>
         <tr>
            <td align=right>
            
               [총 개수] : ${boardListAllCnt}&nbsp;&nbsp;&nbsp;&nbsp;
               <select name="rowCntPerPage">
                  <option value="10">10</option>
                  <option value="15">15</option>
                  <option value="20">20</option>
                  <option value="25">25</option>
                  <option value="30">30</option>
               </select> 행보기
      </table>
   </form>
   
   <div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
   
   <table><tr hegiht=10><td></table>
   
   <table class="boardTable tbcss2" border=0 cellspacing=0 cellpadding=5 width=700>
      <tr bgcolor="${headerColor}"><th>직원번호<th>이름<th>직급<th>신청날짜<th>승인날짜
      
      				
      
   
   </table><br>
   
   <c:if test=" ${boardListAllCnt==0}">
   		검색 결과가 없습니다...2
   </c:if>
   <!-- 위 코딩은 아래 코딩으로 대체 가능하다. -->
   <!-- 만약에 검색된 게시판 총 개수가 0개면 "검색 결과가 없습니다"출력 -->
   <%--  
   <c:if test="${empty boardList}">
   		검색 결과가 없습니다...3
   </c:if>
   ${boardListAllCnt==0?'검색 결과가 없습니다...1':''} 
   --%>
</body>
</html>