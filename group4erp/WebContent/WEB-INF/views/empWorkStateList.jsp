<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>직원 근무 현황</title>
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
		/* var picker = new Pikaday({ 
			 field: document.getElementById('datepicker'),
			 format: 'yyyy-MM-dd',
			 toString(date, format) {
			   let day = ("0" + date.getDate()).slice(-2);
			   let month = ("0" + (date.getMonth() + 1)).slice(-2);
			   let year = date.getFullYear();
			   return `${year}-${month}-${day}`;
		 }
		}) */;
	
		$(document).ready(function(){

			
			
			$(".pagingNumber").html(
				getPagingNumber(
					"${getEmpInoutListCnt}"					//검색 결과 총 행 개수
					,"${hrListSearchDTO.selectPageNo}"		//선택된 현재 페이지 번호
					,"${hrListSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
					,"10"									//페이지 당 보여줄 페이지번호 개수
					,"goSearch();"							//페이지 번호 클릭 후 실행할 자스 코드
				)
			);





			$("#datepicker").datepicker({
			    onSelect: function() { 
			    	//var date = $('#datepicker').datepicker({ dateFormat: 'yyyy-mm-dd' }).val();
			        var dateObject = $(this).datepicker('getDate');
			        alert(dateObject.val()); 
			    }
			});


			

			
		});
	
		function goSearch(){
			//alert($("[name=datepicker]").val());
			document.InoutListDate.submit();
		}

		

		function InoutbyDt(){
			alert( $("[name=getEmpInoutList]").serialize() );
			/* 
			$.ajax({
				url : "/group4erp/viewEmpWorkStateList.do"
				,type : "post"
				,data : $("[name=getEmpInoutList]").serialize()
				,success : function(admin_idCnt){
					if(admin_idCnt==1){
						location.replace("/z_spring/boardListForm.do");
					}
					else if(admin_idCnt==0){
						alert("아이디, 암호가 존재하지 않음. 재입력 바람");
					}
					else{
						alert("서버 오류 발생. 관리자에게 문의 바람");
					}	
				}
				,error : function(){
					alert("서버 접속 실패. 관리자에게 문의 바람");
				}
			}); */
		}
	</script>

</head>
<body><center>
	<h1>[직원 근무 현황]</h1><br>
	기준일 : 2019년 12월 19일
	<form name="InoutListDate" method="post" action="/group4erp/viewEmpWorkStateList.do">
		
		
		<table>
			<tr>
				<td width=73%>
				<td>일자: <input type="text" id="datepicker" name="datepicker">
				<td> <input type="button" value="검색" onClick='goSearch();'>
		</table>
		
	    
	    <script>
	        $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
	        
	    </script>
	    
	    <input type="text" name="selectPageNo">
	  </form>
	    
	    <table><tr height=10><td></table>
	    
	   <form name="getEmpInoutList" method="post" action="/group4erp/viewEmpWorkStateList.do">
		<table class="tbcss1" name="dayOffList" cellpadding="5" cellspacing="5" width=70%>
			<thead>
				<tr>
					<th style="cursor:pointer">날짜
					<th style="cursor:pointer">사원번호
					<th width=100 style="cursor:pointer">성명
					<th style="cursor:pointer">부서
					<th style="cursor:pointer">직급
					<th style="cursor:pointer">출근시간
					<th style="cursor:pointer">퇴근시간
					<th style="cursor:pointer">근무시간
					<th style="cursor:pointer">구분
					<th style="cursor:pointer">비고
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${requestScope.getEmpInoutList}" var="inout" varStatus="loopTagStatus">
					<tr style="cursor:pointer">
						<%-- <td align=center>
							${boardListAllCnt - 
								(boardSearchDTO.selectPageNo*boardSearchDTO.rowCntPerPage-boardSearchDTO.rowCntPerPage+1+loopTagStatus.index)+1} --%>
						<td align=center> ${inout.dt_work}
						<td align=center> ${inout.emp_no}
						<td align=center> ${inout.emp_name}
						<td align=center> ${inout.dep_name}
						<td align=center> ${inout.jikup}
						<td align=center> ${inout.in_time}
						<td align=center> ${inout.out_time}
						<td align=center> ${inout.working_hrs}
						<td align=center> ${inout.check_inout_name}
						<td align=center> ${inout.remarks}
					</tr>
				</c:forEach>
			</tbody>
		
			
			
			<!-- <tr>
				<th>소속 부서 ▼ </th><th>직급 ▼ </th><th>성명 ▼ </th><th>휴가 종류 ▼ </th><th>복귀 예정일 ▼</th>
			</tr>
			<tr>
				<td>기획부</td><td>과장</td><td>박민아</td><td>연차</td><td>2019.12.24</td>
			</tr>
			<tr>
				<td>영업부</td><td>사원</td><td>김설현</td><td>연차</td><td>2019.12.26</td>
			</tr> -->
		
		</table>
		
		
		<table><tr height=10><td></table>
		
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
	
	</form>

</center>
</body>
</html>