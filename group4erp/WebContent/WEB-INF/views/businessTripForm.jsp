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

<<<<<<< HEAD
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker2-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker2{cursor: pointer;}

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
=======
>>>>>>> refs/remotes/master/master
</style>
<script>
	$(document).ready(function(){
		$("#datepicker").datepicker({
		    onSelect: function() { 
		    	//var date = $('#datepicker').datepicker({ dateFormat: 'yyyy-mm-dd' }).val();
		        var dateObject = $(this).datepicker('getDate');
		        alert(dateObject.val()); 
		    }
		});

		$("#datepicker2").datepicker2({
		    onSelect: function() { 
		    	//var date = $('#datepicker').datepicker({ dateFormat: 'yyyy-mm-dd' }).val();
		        var dateObject2 = $(this).datepicker2('getDate');
		        alert(dateObject2.val()); 
		    }
		});
	});
	
	function goBusinessTripList(){
		location.replace("/group4erp/businessTripList.do");
	}
		 
	function reset(){
		document.businessTripForm.reset();
	}
	
</script>	
	
<meta charset="UTF-8">
<title>출장신청&보고</title>
</head>
<body>
	<form name="businessTripForm" method="post" action="/group4erp/businessTripForm.do">
	<b>출장 신청서</b>
	<table class="tbcss1" name=work_outside_info cellpadding="5" cellspacing="5">
		<tr>
			<th>이름</th>
				<td>
					<input type="text">
				</td>
		</tr>
		
		<tr>
			<th>부서명</th>
				<td>
					<select id = "dept">
						<option >부서 선택</option>
						<option value=1>총무부</option>
						<option value=2>기획부</option>
						<option value=3>영업부</option>
						<option value=4>마케팅부</option>
						<option value=5>사업부</option>
						<option value=6>인사부</option>
					</select>
				</td>
		</tr>
		
		<tr>
			<th >출장희망일</th>
				<td>
					<input type="text" id="datepicker" name="datepicker">
					~
					<input type="text" id="datepicker2" name="datepicker2">
					&nbsp;&nbsp;&nbsp;
				</td>
		</tr>
			<script>
	        $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' }); 
	        $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
	    	</script>
		
		<tr>
			<th>목적지</th>
				<td>
					<input type="text" size="50" name="destination">															
				</td>
		</tr>
		
		<tr>
			<th >출장 사유</th>
				<td >
				<textarea name="work_outside_reason" cols="50" rows="10" id="work_outside_reason" maxlenght="500"></textarea>
				</td>
		</tr>
		
		<tr>
			<th >담당자</th>
				<td>
					<input type="text" name="destination">
				</td>
		</tr>
	</table>
	<table>
	</table>
		<input type="button" class="approval" value="결재" onClick="checkForm()">
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="초기화" onClick="reset()">
		
		<input type="button" value="목록보기" onClick="goBusinessTripList()">
	</form>
</body>
</html>