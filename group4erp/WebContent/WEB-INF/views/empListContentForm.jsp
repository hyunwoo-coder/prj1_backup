<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP페이지 처리 방식 선언하기 -->

<!-- 현재 이 JSP페이지 실행 후 생성되는 문서는 HTML이고, 이 문서는 UTF-8 방식으로 인코딩한다 라고 설정함 / 현재 이 JSP페이지는 UTF-8방식으로 인코딩 한다 -->
<!-- UTF-8 인코딩 방식은 한글을 포함 전 세계 모든 문자열을 부호화할수 있는 방법이다. -->
<!DOCTYPE html>
<!-- JSP기술의 한 종류인 [Include Directive]를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<!-- 유일하게 WEB-INF 루트 경로를 쓸수 있다. -->
<%@ include file="/WEB-INF/views/common.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><center>
	<b>직원 상세보기</b>
	
	
		<table class="tbcss1" width="600" border=1 bordercolor="#000000" cellpadding=5 align=center>
			<tr>
				<th>이름
				<td>가나다
				<th>영어이름
				<td>rkskek
				<th colspan=4 width="30%">사원사진
			<tr>
				<th>주민등록번호
				<td colspan=3>111111-2222222
				<td rowspan=4 colspan=4 width="30%">no image
			<tr>
				<th>핸드폰번호
				<td colspan=3>010-1234-5678
			<tr>
				<th>이메일
				<td colspan=3>naver11@naver.com
			<tr>
				<th>회사이메일
				<td colspan=3>company11@company.com
			<tr>
				<th>주소
				<td colspan=5>전라북도 장수군 장수읍  개정농원길 20-43
				<th>휴직상태
				<td>X
			<tr>
				<th>입사일
				<td colspan=2>2019-12-25 수요일
				<!--<th>부서번호
				<td>10-->
				<th colspan=2>부서이름
				<td>총무과
				<th>성별
				<td>남
			<tr>
				<th>직업형태
				<td>정규직
				<th>직급
				<td>사원
				<th>연봉
				<td colspan=3>30,000,000
			<tr>
				<th>직속상관
				<th>부서이름
				<td>총무과
				<th>직급
				<td>대표이사
				<th>이름
				<td colspan=2>라마바
		</table>

</center>
</body>
</html>