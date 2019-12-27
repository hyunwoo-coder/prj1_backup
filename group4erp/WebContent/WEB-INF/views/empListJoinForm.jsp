<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 전사적자원관리 시스템 </title>
 <style>
      .tbcss1, .tbcss1 th,.tbcss1 td{ 
               border-collapse: collapse;
               border:1px solid #A2A2A2; 
               padding: 5;
               font-size: 9pt;
               font-family: tahoma, 굴림, 돋움, verdana
      }
   </style>
<script>

	function goJoinMember(){
		alert("등록 화면 구현중입니다.");
		
		$.ajax({
			//호출할 서버쪽 URL주소 설정
			url : "/group4erp/newEmpInfoProc.do"
			//전송 방법 설정
			, type : "post"
			//서버로 보낼 파라미터명과 파라미터값을 설정
			, data : $('[name=newEmpForm]').serialize()
			//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			//매개변수 upDelCnt에는 입력 행의 개수가 들어온다.
			, success : function(insertCnt){
				if(insertCnt==1){
					alert("사원 등록 성공");
					location.replace("/group4erp/viewEmpList.do")
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
<body><center>
   <form name="newEmpForm" method="post" action="/group4erp/newEmpInfoProc.do">
         <table cellpadding=5 class="tbcss1">
            <tr>
               <th bgcolor=#DBDBDB >사원명
               <td><input type="text" name="emp_name" class="emp_name" size="10" maxlength=20>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >사원영문명
               <td><input type="text" name="emp_eng_name" class="emp_eng_name" size="20" maxlength=20>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>부서번호
               <td>
               	  <input type="radio" name="dep_no" value="01">총무부
                  <input type="radio" name="dep_no" value="02">기획부
                  <input type="radio" name="dep_no" value="03">영업부
                  <input type="radio" name="dep_no" value="04">마케팅부
                  <input type="radio" name="dep_no" value="05">사업부
                  <input type="radio" name="dep_no" value="06">인사부
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >직급
               <td>
				  <input type="radio" name="jikup_cd" value="01">대표이사
                  <input type="radio" name="jikup_cd" value="02">전무이사
                  <input type="radio" name="jikup_cd" value="03">상무이사
                  <input type="radio" name="jikup_cd" value="04">부장
                  <input type="radio" name="jikup_cd" value="05">차장
                  <input type="radio" name="jikup_cd" value="06">과장
                  <input type="radio" name="jikup_cd" value="07">대리
                  <input type="radio" name="jikup_cd" value="08">주임
                  <input type="radio" name="jikup_cd" value="09">사원
                  <input type="radio" name="jikup_cd" value="10">기타
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >연봉
               <td><input type="text" name="salary" class="salary" size="20" maxlength=20>만원
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >주민번호
               <td><input type="text" name="jumin_num" class="jumin_num" size="13" maxlength=6>&nbsp;-&nbsp;
                  <input type="text" name="jumin_num" class="jumin_num" size="14" maxlength=7>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>성별
               <td><input type="radio" name="emp_gender" value="남">남자   
                  <input type="radio" name="emp_gender" value="여">여자
            </tr>
            <tr>
               <th bgcolor=#DBDBDB >전화번호
               <td><input type="text" name="phone" class="phone" size="20" maxlength=20>
                  <font color="gray"> *&nbsp;'&nbsp;-&nbsp;'&nbsp;제외하고 입력</font>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>외부 이메일
               <td><input type="text" name="emp_email" class="emp_email" size="35" maxlength=40>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>회사전용 이메일
               <td><input type="text" name="emp_email_office" class="emp_email_office" size="35" maxlength=40>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>직속상관이름
               <td><input type="text" name="mgr_emp_name" class="mgr_emp_name" size="10">
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>직원주소
               <td><input type="text" name="emp_addr" class="emp_addr" size="50" maxlength=100>
            </tr>
            <tr>
               <th bgcolor=#DBDBDB>근무형태
               <td><select name="worktime_cd">
						<option value="">------------
						<option value="01">정규직
						<option value="02">파견직
						<option value="03">기간제 근로자
						<option value="04">파트타임
						<option value="05">인턴
            </tr>
			<tr>
               <th bgcolor=#DBDBDB>비밀번호
               <td><input type="password" name="emp_pwd" class="emp_pwd" size="7">
            </tr>
         </table>
         <br>
         <input type="button" value=" 등록 " onclick="goJoinMember();">
   </form>
</body
</html>