<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 전사적자원관리 시스템 </title>
<script>

	function bookjSignUp(){
		alert("등록 기능 구현중");
		
		$.ajax({
			//호출할 서버쪽 URL주소 설정
			url : "/group4erp/goSignUpBookProc.do"
			//전송 방법 설정
			, type : "post"
			//서버로 보낼 파라미터명과 파라미터값을 설정
			, data : $('[name=newSignUpBookProc]').serialize()
			//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			//매개변수 upDelCnt에는 입력 행의 개수가 들어온다.
			, success : function(insertCnt){
				if(insertCnt==1){
					alert("책 등록 성공");
					location.replace("/group4erp/goBookList.do")
				}else if(insertCnt==0){
					alert("등록 실패");
				}else alert("서버쪽 DB연동 실패!");
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
   <form name = "newSignUpBookProc" method="post" action="/group4erp/goSignUpBookProc.do">
         <table cellpadding=5 class="tbcss1">
            <tr>
               <th bgcolor=#DBDBDB >ISBN13
               <td><input type="text" name="ISBN13" class="ISBN13" size="10" maxlength=20>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >책 이름
               <td><input type="text" name="book_name" class="book_name" size="20" maxlength=50>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>카테고리
               <td><input type="radio" name="cat_cd" value="01">소설
                  <input type="radio" name="cat_cd" value="02">사회
                  <input type="radio" name="cat_cd" value="03">과학
                  <input type="radio" name="cat_cd" value="04">IT
                  <input type="radio" name="cat_cd" value="05">예술
                  <input type="radio" name="cat_cd" value="06">종교
                  <input type="radio" name="cat_cd" value="07">만화
                  <input type="radio" name="cat_cd" value="08">여행
                  <input type="radio" name="cat_cd" value="09">잡지
                  <input type="radio" name="cat_cd" value="10">요리
                  <input type="radio" name="cat_cd" value="11">수험서
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >가격
               <td><input type="text" name="book_price" class="book_price" size="20" maxlength=20>원
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >페이지 수
               <td><input type="text" name="book_pages" class="book_pages" size="20" maxlength=20>쪽
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >저자
               <td><input type="text" name="writer" class="writer" size="10" maxlength=30>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>출판사
               <td><input type="text" name="publisher">
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >판형
               <td><input type="radio" name="size_cd" value="01">신국판
                  <input type="radio" name="size_cd" value="02">국판
                  <input type="radio" name="size_cd" value="03">46판
                  <input type="radio" name="size_cd" value="04">46배판
                  <input type="radio" name="size_cd" value="05">크라운판
                  <input type="radio" name="size_cd" value="06">국배판
                  <input type="radio" name="size_cd" value="07">타블로이드
                  <input type="radio" name="size_cd" value="08">기타
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>판매여부
               <td><input type="radio" name="is_print" value='y'>판매
				   <input type="radio" name="is_print" value='n'>절판
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>담당 직원
               <td><input type="text" name="emp_name" class="emp_name" size="10" maxlength=20>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>출간일
               <td><input type="text" id="datepicker" name="datepicker" size="15">
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>출판사 담당 직원
               <td><input type="text" name="editor" class="editor" size="10" maxlength=20>
            </tr>
         </table>
         <input type="button" value=" 등록 " onClick="bookjSignUp();">&nbsp;
   </form>



</body>
</html>