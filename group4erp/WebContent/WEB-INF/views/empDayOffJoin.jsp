<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<%--
<% String emp_name = (String)session.getAttribute("emp_name"); %>
<% String emp_no = (String)session.getAttribute("emp_no"); %>
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>YES4조 전사적자원관리 시스템 </title>

<style>
.tbcss1, .tbcss1 th,.tbcss1 td{ 
         border-collapse: collapse;
         border:1px solid #A2A2A2; 
         padding: 5;
         font-size: 9pt;
         font-family: tahoma, 굴림, 돋움, verdana
}
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
	
	$("#start_dayoff").datepicker({
		dateFormat: 'yy-mm-dd'
	    ,onSelect: function() {
	        var dateObject = $(this).datepicker('getDate');

	    }
	});
	$("#end_dayoff").datepicker({
		dateFormat: 'yy-mm-dd'
	    ,onSelect: function() {
	        var dateObject = $(this).datepicker('getDate');

	    }
	});
	
});

	function empDayOffJoin(){
		
		//alert("휴가 신청 기능 구현중");
		
		//alert($('[name=empDayOffJoinForm]').serialize());
		//return;

		//날짜 차이 구하기
		
		var strDate1 = $('[name=start_dayoff]').val();
		var strDate2 = $('[name=end_dayoff]').val();
		var arr1 = strDate1.split('-');
		var arr2 = strDate2.split('-');
		var startDay = new Date(arr1[0], arr1[1], arr1[2]);
		var endDay = new Date(arr2[0], arr2[1], arr2[2]);

		
		var diff = endDay - startDay;
		var currDay = 24 * 60 * 60 * 1000;

		var usingDay = parseInt(diff/currDay);
		
		$('[name=using_dayoff]').val(usingDay+1);
		
		$.ajax({
			//호출할 서버쪽 URL주소 설정
			url : "/group4erp/goDayOffProc.do"
			//전송 방법 설정
			, type : "POST"
			//서버로 보낼 파라미터명과 파라미터값을 설정
			, data : $('[name=empDayOffJoinForm]').serialize()
			//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			//매개변수 upDelCnt에는 입력 행의 개수가 들어온다.
			, success : function(insertCnt){
				if(insertCnt==1){
					alert("휴가 신청 성공");
					location.replace("/group4erp/goBookList.do")
				}else if(insertCnt==0){
					alert("휴가 신청 실패");
				}else if(insertCnt==-2){
					alert("휴가 정보 수정 실패");
				}else alert("서버 오류!");
			}
			//서버의 응답을 못 받았을 경우 실행할 익명함수 설정
			, error : function(){
				alert("서버 접속 실패");
			}
		});
		
		
	}

</script>

</head>
<body>
<cneter>
<b>[01월 휴가 신청]</b>
	<br>
	<table>
		<tr>
			<td>1. 2020년 01월 휴가 신청 입니다
		<tr>
			<td>2. 올해 OOO님의 남은 연가는 OO일 입니다.
		<tr>
			<td>3. 이번달 휴가 신청자는 OO명 입니다.
		<tr>
			<td>4. 한달에 나갈수 있는 휴가 일수는 4일이 최대이며
		<tr>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;4일 초과시 부서장의 승인이 있어야합니다.
		<tr>
			<td>(날짜 유효성 검사 / 휴가 신청 2번 안되게(이미 신청한 사람은 신청 못하게 막아야한다) )
	</table>
	<br>
<form name="empDayOffJoinForm" method="post" action="/group4erp/empDayOffJoinProc.do">
	<table cellpadding=5 class="tbcss1">
		<tr>
			<th bgcolor=#DBDBDB >사원명
			<td><input type="text" name="emp_name" class="emp_name" size="10" maxlength=20>
		<tr>
			<th bgcolor=#DBDBDB>휴가종류
			<td>
				<select name="dayoff_cd">
					<option value="">---------
					<option value="01">연차
					<option value="02">월차
					<option value="03">생리
					<option value="04">출산
					<option value="05">반차
					<option value="06">보상
		<tr>
		<th bgcolor=#DBDBDB >휴가 기간
			<td>
				<input type="text" id="start_dayoff" name="start_dayoff" class="start_dayoff" size="20" maxlength=20>&nbsp;~&nbsp;
				<input type="text" id="end_dayoff" name="end_dayoff" class="end_dayoff" size="20" maxlength=20>
				<input type="hidden" name="using_dayoff" class="using_dayoff">
	</table>
</form>

	<input type="button" value=" 신청 " onclick="empDayOffJoin();">&nbsp;



</body>
</html>