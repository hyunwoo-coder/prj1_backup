<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 리스트</title>
<script>

$(document).ready(function(){
	
	
	headerSort();
	
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

	function goSearch() {
		document.empListSearchForm.submit();
	}
	
	function insertNewEmp() {
		alert("신규 사원 추가 기능 구현");
	}
	function headerSort(){

		//alert(9999)
		//첫번째 tr 태그 내부의 th 태그를 클릭하면 발생할 일을 설정
		$(".empListTable thead:eq(0) tr:eq(0) th").click(function(){
			//클릭한 th 태그를 관리하는 JQuery 객체 메위주를 얻어 변수에 저장
			var thisThObj = $(this);
			//내림차순, 오름차순 여부를 저장할 변수선언
			var ascDesc = "";
			//클릭한 th 형제의 th 태그 안의 문자열에 ▲, ▼제거
			thisThObj.siblings().each(function(){
				//i번째 th 태그 안의 문자열을 받자
				var str = $(this).text();
				//앞,뒤 공백 제거
				txt = $.trim(str);
				//▲ 제거하기
				txt = txt.replace("▲","")
				//▼ 제거하기
				txt = txt.replace("▼","")
				//i번째 th 태그 안에 ▲, ▼제거한 문자열 넣기
				$(this).text( txt );
			});
			//클릭한 th안의 문자열 뒤에 ▲, ▼붙이기
			//클릭한 th 안의 문자열을 얻어 변수 txt 저장
			var txt = thisThObj.text();
			//txt 변수 안의 문자열에 ▲가 있으면 ▼ 로 바꾸고 ascDesc 변수에 "desc"저장하기
			if(txt.indexOf("▲")>=0) {
				txt = txt.replace("▲", "▼");
				ascDesc = "desc";
			}
			//txt 변수 안의 문자열에 ▼가 있으면 ▲ 로 바꾸고 ascDesc 변수에 "asc"저장하기
			else if(txt.indexOf("▼")>=0) {
				txt = txt.replace("▼", "▲");
				ascDesc = "asc";
			}
			//txt 변수 안의 문자열에 ▼, ▲ 둘다 없을 경우 ▲ 로 넣어주고 ascDesc 변수에 "asc"저장하기
			else {
				txt = txt+"▲";
				ascDesc = "asc";
			}
			//txt안의 데이터를 클릭한 th 안의 문자열로 갱신
			thisThObj.text( txt );
			//Array 객체에 각각의 tr을 관리하는 JQuery 객체들을 생성해서 저장. 원하는 정렬 기준 따라 JQuery 객체의 위치를 바꾼다.
			//정렬 대상이 되는 모든 tr 태그를 관리하는 JQuery 객체 생성해 저장
			var allTrObj = $('.'+selector+' tbody:eq(0)').children();
			//각각의 tr을 관리하는 JQuery객체들을 생성하여 Array 객체에 저장
			var trObjs = [];
			allTrObj.each(function(){
				trObjs.push( $(this) );
			});
			//클릭한 th 태그의 인덱스 번호 저장.
			var thIndex = thisThObj.index();
			//반복문을 사용하여 클릭한 th 열과 동이한 열의 데이터를 오름 또는 내림 정렬에 맞추어 Array 객체에 저장된 tr 태그 관리 JQuery 객체를 재 배치
			for( j=0 ; j<trObjs.length-1 ; j++){
				for( k=j+1 ; k<trObjs.length ; k++){
					//j 번쨰 JQuery 객체의 관리 tr 의 x 번째 열의 문자얻고 소문자로 바꾸기
					var td1Text = trObjs[j].children("td").eq(thIndex).text();
					td1Text = ($.trim(td1Text)).toLowerCase();
					if( thIndex==0 ) { td1Text = parseInt(td1Text,10); }
					//k 번쨰 JQuery 객체의 관리 tr 의 x 번째 열의 문자얻고 소문자로 바꾸기
					var td2Text = trObjs[k].children("td").eq(thIndex).text();
					td2Text = ($.trim(td2Text)).toLowerCase();
					if( thIndex==0 ) { td2Text = parseInt(td2Text,10); }
					//만약 내림차순 의도가 있고[j 번쨰 x 번째 열의 문자] < [k 번쨰 x 번째 열의 문자] 면 j 번쨰 JQuery 객체와 k 번째 JQuery 객체의 위치 바꾸기
					if( (ascDesc=="desc" && td1Text<td2Text)){
						var tmp = trObjs[j];
						trObjs[j] = trObjs[k];
						trObjs[k] = tmp;
					}
					//만약 내림차순 의도가 있고[j 번쨰 x 번째 열의 문자] > [k 번쨰 x 번째 열의 문자] 면 j 번쨰 JQuery 객체와 k 번째 JQuery 객체의 위치 바꾸기
					else if( (ascDesc=="asc" && td1Text>td2Text) ){
						var tmp = trObjs[j];
						trObjs[j] = trObjs[k];
						trObjs[k] = tmp;
					}
				}
			}
			//기존 tr 태그를 지우기
			$('.empListTable tbody:eq(0)').empty();
			//Array 객체에 저장된 JQuery 객체가 관리하는 tr 태그를 삽입하기
			for(var j=0 ; j<trObjs.length ; j++){
				$('.empListTable tbody:eq(0)').append( trObjs[j] );
			}
		});
		
	}
</script>
</head>
<body>
<center>
	<h1>[직원 리스트]</h1>

	<form na me="empListForm" method="post" action="/group4erp/viewEmpInfo.do">
	[검색어]<input type="text" name="searchKeyword">&nbsp;&nbsp;<input type="button" value="검색" onClick="goSearch();">

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
	
	<!-- <form na me="empListForm" method="post" action="/group4erp/viewEmpInfo.do"> -->
	
	<div id="blankArea"><br></div>
		<table class="empListTable tbcss1" cellpadding="5" cellspacing="5" width="500">		
			<thead>
			<tr>

				<th style="cursor:pointer">사번<th>성명<th>부서<th style="cursor:pointer">직급
			</tr>

			<c:forEach items="${empList}" var="empList" varStatus="loopTagStatus">
			<tr style="cursor:pointer">
				<td>${empList.emp_no}</td><td>${empList.emp_name}</td><td>${empList.dep_name} </td><td>${empList.jikup }</td>		
			</tr>
			
			</c:forEach>

				<th style="cursor:pointer">사번<th>성명<th>부서<th style="cursor:pointer">직급
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${requestScope.getEmpBoardList}" var="empList" varStatus="loopTagStatus">
			<tr style="cursor:pointer" onClick="goEmpContentForm(${empList.emp_no});">	
				<td align=center>${empList.emp_no}
				<td align=center>${empList.emp_name}
				<td align=center>${empList.dep_name}
				<td align=center>${empList.jikup}
			</tr>		
			</c:forEach>
			</tbody>
		</table>
		<br>
		<input type="button" value="신규사원등록" onClick="insertNewEmp();">
		<br><br>
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
	<!-- </form>  -->

</center>

</body>
</html>