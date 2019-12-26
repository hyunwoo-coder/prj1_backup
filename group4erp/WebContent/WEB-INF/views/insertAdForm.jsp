<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고신청 페이지</title>
<script>

	function reserveAd() {
		alert("광고신청접수");
	}

</script>

</head>
<body><center>
	<h1>광고신청 페이지</h1>
	<form name="insertAdForm" method="post" action="/group4erp/insertAdProc.do">
		<table class="insertAdTable tbcss1" name="insertAdTable" cellpadding="5" cellspacing="5">
			<tr>
				<td>업체번호</td><td><input type="text" name="corp_no"></td>
			</tr>
			<tr>
				<td>광고 타이틀</td><td><input type="text" name="ad_title" maxlength="100"></td>
			</tr>
			<tr>
				<td>노출 요청일</td><td><input type="text" name="open_req_dt">
				</td>
			</tr>
			<tr>
				<td>노출 기간</td><td><input type="text" name="ad_term"><br>
				<label>종료 예정일 : </label></td>
			</tr>
			<tr>
				<td>노출 요청 위치(사이트 메인 페이지)</td>
				<td><select name="open_req_area">
										<option value="01">상단</option>
										<option value="02">하단</option>
										<option value="03">중앙</option>
										<option value="04">왼쪽</option>
										<option value="05">오른쪽</option>
					</select>
				</td>				
			</tr>
			<tr>
				<td>결제 수단</td><td><select name="ad_pay_method">
										<option value="계좌이체">계좌이체</option>
										<option value="카드결제">카드결제</option>
										
					</select></td>
			</tr>
			<tr>
				<td>첨부파일</td><td><input type="file" name="fileUpload"></td>
			</tr>
		
		</table>
		<br>
		<input type="button" value="광고신청" onClick="reserveAd();">
	
	</form>

</center>

</body>
</html>