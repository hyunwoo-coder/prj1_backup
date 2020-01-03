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

	});
	
	
	
	function goBusinessTripList(){
		location.replace("/group4erp/businessTripList.do");
	}
		 
	function reset(){
		document.businessTripForm.reset();
	}

function checkBusinessTripRegForm(){
		
		if( is_empty($("#emp_no")) ){
			alert("이름을 입력해주세요.");
			$("#emp_no").focus();
			return;
		}
		   
		if( is_empty($("#destination")) ){
			alert("목적지를 입력해주세요.");
			$("#destination").focus();
			return;
		}

		if( is_empty($("#outside_start_time")) ){
			alert("출장 희망일을 입력해주세요.");
			$("#outside_start_time").focus();
			return;
		}

		if( is_empty($("#outside_end_time")) ){
			alert("출장 희망일을 입력해주세요.");
			$("#outside_end_time").focus();
			return;
		}

		if( is_empty($("#work_outside_reason")) ){
			alert("출장사유를 입력해주세요.");
			$("#work_outside_reason").focus();
			return;
		}
		/* if( is_valid_email("[name=email]")==false ){
			alert("이메일 형식을 벗어납니다.");
			return;
		}
		
		if( is_valid_pattern("[name=pwd]", /^[0-9]{4}$/)==false ){
			alert("암호는 숫자 4개를 입력해주세요");
			return;
		} */
		if(confirm("정말 저장하시겠습니까?")==false){return;}


		alert($("#destination").val());
		//alert("${(param.b_no)?0:param.b_no}")
		//var str = $('[name=boardRegForm]').serialize()+"&b_no="+${param.b_no};
		
		//현재 화면에서 페이지 이동 없이 서버쪽 "/z_spring/boardRegProc.do"를 호출하여 게시판 글을 입력하고 [게시판 입력 행 적용 개수]를 받기
	 	$.ajax({
			//접속할 서버쪽 URL 주소 설정
			url : "/group4erp/businessTripRegProc.do"
			//전송 방법 설정
			, type : "post"
			//서버로 보낼 파라미터명과 파라미터값을 설정
			, data : $('[name=businessTripForm]').serialize()
			//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			//매개변수 boardRegCnt에는 입력 행의 개수가 들어온다.
			, success : function(businessTripRegCnt){
				//[게시판 입력 행 적용 개수]가 1개면(=insert가 한번 성공했다는 뜻)
				if(businessTripRegCnt==1){
					alert("출장 신청 완료");
					location.replace('/group4erp/businessTripListForm.do')
				}
				//[게시판 새 글 입력 행 적용 개수]가 1개가 아니면 경고하기
				else{
					alert("출장 신청 실패 관리자에게 문의 바람.");
				}
			}
			//서버의 응답을 못 받았을 경우 실행할 익명함수 설정
			, error : function(){
				alert("businessTripRegForm 서버 접속 실패");
			}
		});
	}
</script>	
	
<meta charset="UTF-8">
<title>출장신청&보고</title>
</head>
<body>
	<form name="businessTripForm" id="businessTripForm" method="post" action="/group4erp/businessTripRegProc.do">
	<b>출장 신청서</b>
	<table class="tbcss1" name=work_outside_info cellpadding="5" cellspacing="5">
		<tr>
			<th>사원 번호</th>
				<td>
					<input type="text" id=emp_no name="emp_no">
				</td>
		</tr>
		
		<tr>
			<th>목적지</th>
				<td>
					<input type="text" size="50" id="destination" name="destination">															
				</td>
		</tr>
		
		<tr>
			<th >출장희망일</th>
				<td>
					<input type="text" id="outside_start_time" name="outside_start_time">
					~
					<input type="text" id="outside_end_time" name="outside_end_time">
					&nbsp;&nbsp;&nbsp;
				</td>
		</tr>
		
			<!-- <script>
	        	$("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' }); 
	    	</script> -->
		
		<tr>
			<th >출장 사유</th>
				<td >
					<textarea name="work_outside_reason" cols="50" rows="10" id="work_outside_reason" maxlenght="500"></textarea>
				</td>
		</tr>
	</table>
		<input type="button" class="approval" value="결재" onClick="checkBusinessTripRegForm()">

		<input type="button" value="초기화" onClick="reset()">
		
		<input type="button" value="목록보기" onClick="goBusinessTripList()">
	</form>
</body>
</html>