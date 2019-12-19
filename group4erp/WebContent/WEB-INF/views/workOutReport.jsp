 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출장신청&보고</title>
</head>
<body>
	<form name="workOutReport" method="post" action="/group4erp/workOutReport.do">
	<b>출장 신청서</b>
				<div  style="float:left; color:#727272; padding:3px 2px 0 30px; font-size:22px; font-weight:bold;"">
				&nbsp;일시:
				</div>
	<table class="tbcss1" name="bookList" cellpadding="5" cellspacing="5" width="700">
		<tr>
			<th>직급</th>
				<td>
					<select name="jikup">
						<option value="">직급선택</option>
						<option value="대표이사">대표이사</option>
						<option value="전무이사">전무이사</option>
						<option value="상무이사">상무이사</option>
						<option value="부장">부장</option>
						<option value="차장">차장</option>
						<option value="과장">과장</option>
						<option value="대리">대리</option>
						<option value="주임">주임</option>
						<option value="사원">사원</option>
						<option value="기타">기타</option>
					</select>
				</td>
			<th>성명</th>
				<td><input type="text" name="work_out_name" ></td>
		</tr>
		
		<tr>
			<th>출장희망일</th>
				<td colspan="3">
					<input type="text" name="start_work_out_day">
					~
					<input type="text" name="edn_work_out_day">
					&nbsp;&nbsp;&nbsp;
					<input type="text" size="3" maxlanght="3" name="work_out_day_cnt">&nbsp;일간
				</td>
		</tr>
		<tr>
			<th >출장 사유</th>
				<td colspan="3">
				<textarea name="work_out_reason"  cols="50" rows="10" id="work_out_reason" maxlanght="500"></textarea>
				</td>
		</tr>
	</table>
	</form>
		<input type="button" value="결재">
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="초기화">
</body>
</html>