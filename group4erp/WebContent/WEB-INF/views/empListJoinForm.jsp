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
			if( is_empty('[name=emp_name]') ){
		       alert("이름을 입력해주세요.");
		       $("[name=emp_name]").focus();
		       return;
		    }
		    if( is_empty('[name=emp_eng_name]') ){
		       alert("영문이름을 입력해주세요.");
		       $("[name=emp_eng_name]").focus();
		       return;
		    }
		    if( is_empty('[name=dep_no]') ){
		       alert("부서를 선택해주세요.");
		       $("[name=dep_no]").focus();
		       return;
		    }
		    if( is_empty('[name=jikup_cd]') ){
		       alert("직급을 선택해주세요.");
		       $("[name=jikup_cd]").focus();
		       return;
		    }
		    if( is_empty('[name=salary]') ){
		       alert("연봉을 입력해주세요.");
		       $("[name=salary]").focus();
		       return;
		    }
		    if( is_empty('[name=jumin_num_f]') ){
		       alert("주민번호 앞자리를 입력해주세요.");
		       $("[name=jumin_num_f]").focus();
		       return;
		    }
		    if( is_empty('[name=jumin_num_b]') ){
		       alert("주민번호 뒷자리를 입력해주세요.");
		       $("[name=jumin_num_b]").focus();
		       return;
		    }
		    if( is_empty('[name=emp_gender]') ){
		       alert("성별을 선택해주세요.");
		       $("[name=emp_gender]").focus();
		       return;
		    }
		    if( is_empty('[name=phone]') ){
		       alert("휴대전화를 입력해주세요.");
		       $("[name=phone]").focus();
		       return;
		    }
		    if( is_empty('[name=emp_email]') ){
		       alert("이메일을 입력해주세요.");
		       $("[name=emp_email]").focus();
		       return;
		    }
		    if( is_empty('[name=emp_email_office]') ){
		       alert("회사 이메일을 입력해주세요.");
		       $("[name=emp_email_office]").focus();
		       return;
		    }
		    if( is_empty('[name=mgr_emp_name]') ){
		       alert("직속상관 이름을 입력해주세요.");
		       $("[name=conmgr_emp_nametent]").focus();
		       return;
		    }
		    if( is_empty('[name=emp_addr]') ){
		       alert("주소를 입력해주세요.");
		       $("[name=emp_addr]").focus();
		       return;
		    }
		    if( is_empty('[name=worktime_cd]') ){
		       alert("근무 형태를 선택해주세요.");
		       $("[name=worktime_cd]").focus();
		       return;
		    }
		    if( is_empty('[name=emp_pwd]') ){
		       alert("비밀번호를 입력해주세요.");
		       $("[name=emp_pwd]").focus();
		       return;
		    }
		    
		    
		    var juminb = $('[name=jumin_num_b]').val();
		    var gender = 0;
		    $("[name=emp_gender]").each(function(){
		       var thisGender = $(this);
		       if(thisGender.is(":checked")){
		          gender = thisGender;   
		       }
		    });
		    if(juminb.indexOf(1)==0 || juminb.indexOf(3)==0){
		       if(gender.val()=='여'){
		          alert("주민등록번호 뒷자리 와 성별이 다릅니다.");
		          return;
		       }
		    }else if(juminb.indexOf(2)==0 || juminb.indexOf(4)==0){
		       if(gender.val()=='남'){
		          alert("주민등록번호 뒷자리 와 성별이 다릅니다.");
		          return;
		       }
		    }else if(juminb.indexOf(5)==0 || juminb.indexOf(6)==0 || juminb.indexOf(7)==0 || juminb.indexOf(8)==0 || juminb.indexOf(9)==0){
		       alert("일치하지 않는 주민등록번호 입니다.");
		       return;
		    }
		    var juminf = $('[name=jumin_num_f]').val();
		    var jumin = []
		    jumin.push(juminf);
		    jumin.push(juminb);
		    var jumin_num = jumin.join('');
		    $('[name=jumin_num]').val(jumin_num);
		    
		    var phone = $('[name=phone]').val();
		    
		    if(phone.indexOf('-')>0){
		       phone = phone.split('-').join('');
		    }
		    
		    $('[name=phone]').val(콜);
		    
		    if( is_valid_pattern("[name=phone]", /^[0-9]{10,11}$/)==false ){
		       alert("전화번호 형식이 틀렸습니다. 다시 입력해주세요");
		       return;
		    }
		    if( is_valid_email("[name=emp_email]")==false ){
		       alert("이메일 형식을 벗어납니다.");
		       return;
		    }
		    if( is_valid_pattern("[name=emp_pwd]", /^[0-9]{4}$/)==false ){
		       alert("암호는 숫자 4개를 입력해주세요");
		       return;
		    }
		    
		    if(confirm("정말 저장하시겠습니까?")==false){return;}
						
		
		if( is_empty('[name=emp_name]') ){
			alert("이름을 입력해주세요.");
			$("[name=emp_name]").focus();
			return;
		}
		if( is_empty('[name=emp_eng_name]') ){
			alert("영문이름을 입력해주세요.");
			$("[name=emp_eng_name]").focus();
			return;
		}
		if( is_empty('[name=dep_no]') ){
			alert("부서를 선택해주세요.");
			$("[name=dep_no]").focus();
			return;
		}
		if( is_empty('[name=jikup_cd]') ){
			alert("직급을 선택해주세요.");
			$("[name=jikup_cd]").focus();
			return;
		}
		if( is_empty('[name=salary]') ){
			alert("연봉을 입력해주세요.");
			$("[name=salary]").focus();
			return;
		}
		if( is_empty('[name=jumin_num_f]') ){
			alert("주민번호 앞자리를 입력해주세요.");
			$("[name=jumin_num_f]").focus();
			return;
		}
		if( is_empty('[name=jumin_num_b]') ){
			alert("주민번호 뒷자리를 입력해주세요.");
			$("[name=jumin_num_b]").focus();
			return;
		}
		if( is_empty('[name=emp_gender]') ){
			alert("성별을 선택해주세요.");
			$("[name=emp_gender]").focus();
			return;
		}
		if( is_empty('[name=phone]') ){
			alert("휴대전화를 입력해주세요.");
			$("[name=phone]").focus();
			return;
		}
		if( is_empty('[name=emp_email]') ){
			alert("이메일을 입력해주세요.");
			$("[name=emp_email]").focus();
			return;
		}
		if( is_empty('[name=emp_email_office]') ){
			alert("회사 이메일을 입력해주세요.");
			$("[name=emp_email_office]").focus();
			return;
		}
		if( is_empty('[name=emp_addr]') ){
			alert("주소를 입력해주세요.");
			$("[name=emp_addr]").focus();
			return;
		}
		if( is_empty('[name=worktime_cd]') ){
			alert("근무 형태를 선택해주세요.");
			$("[name=worktime_cd]").focus();
			return;
		}
		if( is_empty('[name=emp_pwd]') ){
			alert("비밀번호를 입력해주세요.");
			$("[name=emp_pwd]").focus();
			return;
		}
		
		
		var juminb = $('[name=jumin_num_b]').val();
		var gender = 0;
		$("[name=emp_gender]").each(function(){
			var thisGender = $(this);
			if(thisGender.is(":checked")){
				gender = thisGender;	
			}
		});
		if(juminb.indexOf(1)==0 || juminb.indexOf(3)==0){
			if(gender.val()=='여'){
				alert("주민등록번호 뒷자리 와 성별이 다릅니다.");
				return;
			}
		}else if(juminb.indexOf(2)==0 || juminb.indexOf(4)==0){
			if(gender.val()=='남'){
				alert("주민등록번호 뒷자리 와 성별이 다릅니다.");
				return;
			}
		}else if(juminb.indexOf(5)==0 || juminb.indexOf(6)==0 || juminb.indexOf(7)==0 || juminb.indexOf(8)==0 || juminb.indexOf(9)==0){
			alert("일치하지 않는 주민등록번호 입니다.");
			return;
		}
		var juminf = $('[name=jumin_num_f]').val();
		var jumin = []
		jumin.push(juminf);
		jumin.push(juminb);
		var jumin_num = jumin.join('');
		$('[name=jumin_num]').val(jumin_num);
		
		var phone = $('[name=phone]').val();
		
		if(phone.indexOf('-')>0){
			phone = phone.split('-').join('');
		}
		
		$('[name=phone]').val(phone);
		
		if( is_valid_pattern("[name=phone]", /^[0-9]{10,11}$/)==false ){
			alert("전화번호 형식이 틀렸습니다. 다시 입력해주세요");
			return;
		}
		if( is_valid_email("[name=emp_email]")==false ){
			alert("이메일 형식을 벗어납니다.");
			return;
		}
		if( is_valid_pattern("[name=emp_pwd]", /^[0-9]{4}$/)==false ){
			alert("암호는 숫자 4개를 입력해주세요");
			return;
		}
		
		if(confirm("정말 저장하시겠습니까?")==false){return;}
		
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
<b>[직원 등록]</b>
<table><tr height=5><td></td></tr></table>
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

               <td><input type="text" name="jumin_num_f" class="jumin_num" size="13" maxlength=6>&nbsp;-&nbsp;
                  <input type="text" name="jumin_num_b" class="jumin_num" size="14" maxlength=7>
                  <input type="hidden" name="jumin_num">

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
            <!-- 
            <tr>
<<<<<<< HEAD
=======
               <th bgcolor=#DBDBDB>직속상관이름
               <td><input type="text" name="mgr_emp_name" class="mgr_emp_name" size="10">
            </tr>
             -->
            <tr>

               <th bgcolor=#DBDBDB>직원주소
               <td><input type="text" name="emp_addr" class="emp_addr" size="60" maxlength=100>
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
</body>
</html>