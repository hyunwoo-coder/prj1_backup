<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여지급내역(직원별)</title>
<script>

	$(document).ready(function(){
	
		headerSort("salListTable", 0);
	
		$('[name=rowCntPerPage]').change(function(){
			goSearch();
		});
		
		$(".pagingNumber").html(
				getPagingNumber(
					"${getEmpBoardListCnt}"						//검색 결과 총 행 개수
					,"${hrListSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
					,"${hrListSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
					,"10"										//페이지 당 보여줄 페이지번호 개수
					,"goSearch();"						//페이지 번호 클릭 후 실행할 자스코드
				)
			);
	
		inputData('[name=rowCntPerPage]',"${hrListSearchDTO.rowCntPerPage}");
		inputData('[name=selectPageNo]',"${hrListSearchDTO.selectPageNo}");
	});

	function viewEmpSalInfo(emp_no) {

		//alert($("[name=salListForm]").serialize());
		
		document.salListForm.submit();

		/*$.ajax({			
			url : "/group4erp/viewEmpSalInfo.do"	
			, type : "post"				
			, data : $("[name=salListForm]").serialize()	
			
			, success : function(sal_info) {	
				if(sal_info != null) {		
					alert("조회 성공");		
					location.replace("/group4erp/goMainPage.do");
					
				} else if(sal_info==0) {		
					alert("해당 직원이 없습니다.");
				} else {
					alert("서버 오류 발생! 관리자에게 문의 바람!");
				}				
			}
			
			, error : function() {		//서버의 응답을 못받았을 경우 실행할 익명함수 설정
				alert("서버 접속 실패!");
			}			
		}); */
	}

	function goApproval() {
		alert("결재");
	}

</script>

</head>
<body><center>
	<h1>${timeDTO.now_year}년도&nbsp;${timeDTO.now_month-1}월분 급여대장</h1>
	
	지급일 : ${timeDTO.now_year}년 ${timeDTO.now_month-1}월 25일	&nbsp;&nbsp;단위 [만원]
	<form name="empListSearchForm" method="post" action="/group4erp/viewEmpList.do">
	[검색어]<input type="text" name="searchKeyword">&nbsp;&nbsp;<input type="button" value=" 검색 " onClick="goSearch();">

	&nbsp;&nbsp;<input type="button" value="모두검색" onClick="goSearchAll();">
	 <table border=0 width=700>
	 	<tr>
	    	<td align=right>
	        [총 개수] : ${getEmpBoardListCnt}&nbsp;&nbsp;&nbsp;&nbsp;
	            <select name="rowCntPerPage">
	               <option value="10">10</option>
	               <option value="15">15</option>
	               <option value="20">20</option>
	               <option value="25">25</option>
	               <option value="30">30</option>
	            </select> 행보기
      </table>
     <input type="hidden" name="selectPageNo">
    </form>
      
	<form name="salListForm" method="post" action="/group4erp/viewEmpSalInfo.do">
		<table class="salListTable tbcss1" name="salEmpList" cellpadding="5" cellspacing="5">
			<tr>
				<th rowspan="2">직책 </th><th rowspan="2">성명</th><th colspan="6">지급내역</th><th colspan="7">공제내역</th><th rowspan="2">실수령액</th>
			</tr>
			<tr>
				<!-- 지급내역 목록 -->
				<td>기본급 </td> <td>식대 </td><td>초과근무수당</td><td>성과수당</td><td>차량유지비</td><td>합계</td>
				<!-- 공제내역 목록-->
				<td>갑근세 </td> <td>주민세 </td><td>고용보험</td><td>건강보험</td><td>국민연금</td><td>기타</td><td>합계</td>
			</tr>
			
			<c:forEach items="${empSalList}" var="empSal" varStatus="loopTagStatus">
				<tr style="cursor:pointer" onClick="viewEmpSalInfo(${empSal.emp_no});">
					<td>${empSal.jikup}</td><td>${empSal.emp_name}</td><td>${empSal.salary}</td><td>${sikdae}</td> <td> </td> <td> </td> <td>${car_care}</td> <td>${empSal.real_sal}</td>
				
					<td>${empSal.income}</td><td>${empSal.resident}</td><td>${empSal.emp_insurance}</td><td>${empSal.health_care }</td> <td>${empSal.annuity}</td> <td>.</td><td>${empSal.deduct_sal}</td><td>${empSal.final_sal}</td>
				</tr>
			</c:forEach>
	
		</table>
		<br>
				[1][2][3][4][5][6][7][8][9][10] <br>
				
				<input type="button" value="결재" onClick="goApproval();">
				
	</form>


</center>

</body>
</html>