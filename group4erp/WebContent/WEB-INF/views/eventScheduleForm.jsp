<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 행사 신청</title>
<script>

	function checkForm() {

		document.eventScheduleForm.submit();

	}

	</script>
</head>
<body><center>

	<h1>이벤트 신청 페이지</h1>
	<form name="eventScheduleForm" method="post" action="/group4erp/reserveEvent.do">
		<table class="tbcss2" cellpadding="5" cellspacing="5">
			<tr>
				<td colspan="2">담당자 </td><td colspan="2">session에서 사원명 연동 예정 </td>
			</tr>
			<tr>
				<td>행사종류</td><td><select><option value="01">매대판매행사</option>
										<option value="02">기부행사</option>
										</select></td><td>행사명</td><td><input type="text" name="event_title"></td>
			</tr>
			<tr>
				<td colspan="2">이벤트 예정 일시 </td><td colspan="2"><input type="text" name="event_start_date"> ~
								<input type="text" name="event_end_date"></td>
			</tr>
			<tr>
				<td colspan="2">예상 소요 경비 </td><td colspan="2"><input type="text" name="tot_probable_cost">원</td>
			</tr>
			<tr>
				<td colspan="2">첨부자료</td><td colspan="2"><input type="file" name="uploadFile();"></td>
			</tr>
			<tr>
				<td colspan="2">비고</td><td colspan="2"><textarea name="comment"></textarea></td>
			</tr>
		
		</table><br>
			<input type="button" value="결재" onClick="checkForm();">
	<input type="reset" value="초기화">
	</form>

</center>
</body>
</html>