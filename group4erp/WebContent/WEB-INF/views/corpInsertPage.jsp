<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 등록</title>
<script>

	$(document).ready(function() {
		
	});

	function checkRegForm() {
		//alert("유효성 체크");

		if(is_empty("[name = corp_no]")) {
			alert("사업자 번호를 입력해주세요.");
			$("[name = corp_no]").focus();

			return;
		}

		if(is_empty("[name = corp_name]")) {
			alert("상호명을 입력해주세요.");
			$("[name = corp_name]").focus();

			return;
		}

		if(is_empty("[name = ceo_name]")) {
			alert("사업자명을 입력해주세요.");
			$("[name = ceo_name]").focus();

			return;
		}

		if(is_empty("[name = ceo_name]")) {
			alert("사업자명을 입력해주세요.");
			$("[name = ceo_name]").focus();

			return;
		}

		if(is_empty("[name = corp_business_area]")) {
			alert("사업분야를 입력해주세요.");
			$("[name = corp_business_area]").focus();

			return;
		}

		if(is_empty("[name = corp_addr]")) {
			alert("소재지를 입력해주세요.");
			$("[name = corp_addr]").focus();

			return;
		}

		if(is_empty("[name = corp_tel]")) {
			alert("소재지를 입력해주세요.");
			$("[name = corp_tel]").focus();

			return;
		}

		if(confirm("정말 저장하겠습니까?")==false) {

			return;
		}
		
		$.ajax({
			url : "/group4erp/insertCorpProc.do"	//접속할 서버쪽 url 주소 지정
			, type : "post"					//전송 방법 설정
			, data : $("[name = insertCorpForm]").serialize()	//서버로 보낼 파라미터명과 파라미터값을 설정
			, success : function(insertCorpCnt) {	//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정. 매개변수 boardRepleCnt에는 입력된 행의 개수가 들어온다.
														//현재 data 매개변수에는 새 글 등록 개수가 들어온다.
				if(insertCorpCnt==1) {			//[게시판 입력 행 적용 개수]가 1개이면(insert가 1회 성공했다는 뜻)
					alert("거래처 등록 성공");
					location.replace("/group4erp/viewCorpList.do");
					} else if(insertCorpCnt==0) {		//글 등록 개수가 0이면 경고
						alert("거래처 등록에 실패했습니다. 관리자에게 문의 바랍니다.");
					} else {
						alert("서버 오류 발생! 관리자에게 문의 바람!");
					}				
				}

				, error : function() {		//서버의 응답을 못받았을 경우 실행할 익명함수 설정
					alert("서버 접속 실패!");
				}			
		});

	}

	function checkCorp_no() {
		alert("사업자번호 유효성 체크");
	}

</script>
</head>
<body><center>
	<h1>거래처 등록</h1>
	<form name="insertCorpForm" method="post" action="/insertCorpProc.do">
		
		<table class="insertCorpTable tbcss2" name="insertCorpTable" cellpadding="5" cellspacing="5" width="500">
			<tr>
				<td>사업자 번호</td><td><input tyep="text" name="corp_no" maxlength="12" ></td>
			</tr>
			<tr>
				<td>상호명</td><td><input tyep="text" name="corp_name" maxlength="30"></td>
			</tr>
			<tr>
				<td>사업자명</td><td><input tyep="text" name="ceo_name" maxlength="30"></td>
			</tr>
			<tr>
				<td>사업분야</td><td><input tyep="text" name="corp_business_area" maxlength="15"></td>
			</tr>
			<tr>
				<td>소재지</td><td><input tyep="text" name="corp_addr" maxlength="100"></td>
			</tr>
			<tr>
				<td>연락처</td><td><input tyep="text" name="corp_tel" maxlength="20"></td>
			</tr>
			<tr>
				<td>FAX</td><td><input tyep="text" name="corp_fax" maxlength="15"></td>
			</tr>
					
		</table> <br>
	<input type="button" value="등록" onClick="checkRegForm();">
	<input type="reset" value="초기화">
	
	</form>

</center>

</body>
</html>