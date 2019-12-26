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

			$('[name=rowCntPerPage]').change(function(){
				goSearch();
			});

			
			
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


			inputData( "[name=selectPageNo]", "${hrListSearchDTO.selectPageNo}" );	
			inputData( "[name=rowCntPerPage]", "${hrListSearchDTO.rowCntPerPage}" );
			inputData( "[name=datepicker]", "${hrListSearchDTO.datepicker}" );
			inputData( "[name=keyword1]", '${hrListSearchDTO.keyword1}' );
			<c:forEach items="${hrListSearchDTO.inout_name}" var="inout">
				inputData( "[name=inout_name]", "${inout}" );
			</c:forEach>



			

			
		});
	
		function goSearch(){
			//alert($("[name=datepicker]").val());
			alert($("[name=InoutListDate]").serialize());
			var keyword1 = $("[name=InoutListDate] [name=keyword1]").val();
			keyword1 = $.trim(keyword1);
			$("[name=InoutListDate] [name=keyword1]").val(keyword1);
			document.InoutListDate.submit();
		}

		function goSearchAll(){
			document.InoutListDate.reset();
			$("[name=InoutListDate] [name=selectPageNo]").val(1);
			$("[name=InoutListDate] [name=rowCntPerPage]").val(10);
			goSearch();
			
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
	<form name="InoutListDate" method="post" action="/group4erp/viewEmpWorkStateList.do">
		
		<div style="width:800">
			[키워드] : <input type="text" name="keyword1" >
			[일자] : <input type="text" id="datepicker" name="datepicker"><br>
			<table><tr height=10><td></table>
			[구분] :
			<input type="checkbox" name="inout_name" class="inout_name" value="출근">출근
			<input type="checkbox" name="inout_name" class="inout_name" value="퇴근">퇴근
			<input type="checkbox" name="inout_name" class="inout_name" value="결근">결근
			<input type="checkbox" name="inout_name" class="inout_name" value="조퇴">조퇴
			<input type="checkbox" name="inout_name" class="inout_name" value="지각">지각
			<input type="checkbox" name="inout_name" class="inout_name" value="외근">외근
			
			<input type="button" value="검색" onClick="goSearch();"
					style="width:75; font-family:돋움; background-color:#FFFFFF; border:1 solid #A0DBE4">&nbsp;
			<input type="button" value="모두검색" onClick="goSearchAll();"
					style="width:75; font-family:돋움; background-color:#FFFFFF; border:1 solid #A0DBE4">
		</div>
	    
	    <script>
	        $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
	        
	    </script>
	    
	    &nbsp;&nbsp;
		<table border=0 width=70%>
			<tr>
				<td align=right>
					[총 개수] : ${getEmpInoutListCnt}&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="rowCntPerPage">
						<option value="10">10
						<option value="15">15
						<option value="20">20
						<option value="25">25
						<option value="30">30
					</select> 행보기
		</table>
	    
	    <input type="hidden" name="selectPageNo">
	    
	    
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
						<td align=center> ${inout.DT_WORK}
						<td align=center> ${inout.EMP_NO}
						<td align=center> ${inout.EMP_NAME}
						<td align=center> ${inout.DEP_NAME}
						<td align=center> ${inout.JIKUP}
						<td align=center> ${inout.IN_TIME}
						<td align=center> ${inout.OUT_TIME}
						<td align=center> ${inout.WORKING_HRS}
						<td align=center> ${inout.CHECK_INOUT_NAME}
						<td align=center> ${inout.REMARKS}
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