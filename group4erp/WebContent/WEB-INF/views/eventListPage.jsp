<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 행사 신청</title>
<script>

	$(document).ready(function(){
	
		headerSort("eventListTable", 0);

		setTableTrBgColor(
				"eventListTable",	//테이블 class 값
				"${headerColor}",			//헤더 tr 배경색
				"${oddTrColor}",		//홀수행 배경색
				"${evenTrColor}",	//짝수행 배경색
				"${mouseOverColor}"			//마우스 온 시 배경색
		);
		

		$('[name=rowCntPerPage]').change(function(){
			goSearch();
		});
	
		$(".pagingNumber").html(
			getPagingNumber(
				"${eventCnt}"						//검색 결과 총 행 개수
				,"${eventSearchDTO.selectPageNo}"			//선택된 현재 페이지 번호
				,"${eventSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
				,"10"										//페이지 당 보여줄 페이지번호 개수
				,"goSearch();"						//페이지 번호 클릭 후 실행할 자스코드
			)
		);

		inputData('[name=rowCntPerPage]',"${eventSearchDTO.rowCntPerPage}");
		inputData('[name=selectPageNo]',"${eventSearchDTO.selectPageNo}");
		inputData("[name=searchKeyword]", "${eventSearchDTO.searchKeyword}");
		inputData("[name=sort]", "${eventSearchDTO.sort}");

		<c:forEach items="${eventSearchDTO.evnt_category}" var="evnt_category">
			inputData("[name=evnt_category]", "${evnt_category}");
		</c:forEach>
		<c:forEach items="${eventSearchDTO.evnt_stat}" var="evnt_stat">
			inputData("[name=evnt_stat]", "${evnt_stat}");
		</c:forEach>
		
	});

	function reserveEvent() {
		//alert("이벤트 신청 페이지");
		location.replace("/group4erp/eventScheduling.do");
	}

	function goSearch() {
		
		document.searchEvntForm.submit();
	}

	function goSearchAll() {
		document.searchEvntForm.reset();

		$('[name=searchEvntForm] [name=selectPageNo]').val("1");
		$('[name=searchEvntForm] [name=rowCntPerPage]').val("15");
		
		goSearch();
	}

	function deleteNotYetEvent() {
		
		var evnt_no = [];
		var cnt=0;

		$("[name=delCheckBox]").each(function() {
		
			var thisObj = $(this);

			if(thisObj.is(":checked")) {
				
				evnt_no.push(thisObj.val());
			}
		});
					
		if(evnt_no.length==0) {
			alert("선택된 이벤트가 없습니다.");
		}

		$("[name=evnt_no]").val(evnt_no);

		//alert($('[name=deleteCorpForm]').serialize());
		$.ajax({
			url : "/group4erp/deleteEvntProc.do",				//호출할 서버쪽 URL 주소 설정
			type : "post",										//전송 방법 설정
			data : $('[name=deleteEvntForm]').serialize(),		//서버로 보낼 파라미터명과 파라미터값을 설정
			
			success : function(delCnt) {
				if(delCnt>=1) {
					alert("삭제 성공!");
					
					location.replace("/group4erp/viewEventList.do");
				} else if(delCnt==-1) {	
					alert("이벤트가 이미 삭제되었습니다!");
					
					location.replace("/group4erp/viewEventList.do");

				} else {
					alert("서버쪽 DB 연동 실패!");
				}
			}

			//서버의 응답을 못 받았을 경우 실행할 익명함수 설정
			, error : function() {		//서버의 응답을 못받았을 경우 실행할 익명함수 설정
				alert("서버 접속 실패!");
			}	
		});
	}

	</script>
</head>
<body><center>

	<h1>이벤트 현황</h1>
    <input type="hidden" name="selectPageNo">
    <input type="hidden" name="sort">
	<form name="searchEvntForm" method="post" action="/group4erp/viewEventList.do">
		<table border=0>
			<tr>
	    		<td align="left">
	    			<label> [전체 이벤트 횟수 ] : ${eventCnt}회 </label><br>
	    			<label> [담당 이벤트 행사 횟수] : ${eventCnt}회 </label>
	            	<select name="rowCntPerPage">
	              		<option value="10">10</option>
	               		<option value="15">15</option>
	               		<option value="20">20</option>
	               		<option value="25">25</option>
	               		<option value="30">30</option>
	            	</select> 행보기
	            </td>
	        </tr>
		</table>
		<table name="searchEvntTable">
			<tr>
				<td>[검색어]</td><td><input type="text" name="searchKeyword">&nbsp;&nbsp;<input type="button" value="검색" onClick="goSearch();">&nbsp;&nbsp;
									<input type="button" value="모두검색" onClick="goSearchAll();"></td>
			</tr>
			<tr> <!-- DB 연동할 것 -->
				<td>[종류별]</td><td><input type="checkbox" value="01" name="evnt_category">매대판매
								<input type="checkbox" value="02" name="evnt_category">야외판매
								<input type="checkbox" value="03" name="evnt_category">할인전
								<input type="checkbox" value="04" name="evnt_category">기부행사
								<input type="checkbox" value="05" name="evnt_category">온라인 설문조사
								<input type="checkbox" value="06" name="evnt_category">저자강연회
								<input type="checkbox" value="07" name="evnt_category">선착순증정
				</td>
			</tr>
			<tr>
				<td>[상태별]</td><td><input type="checkbox" value="01" name="evnt_stat">대기중
									<input type="checkbox" value="03" name="evnt_stat">심사중
									<input type="checkbox" value="02" name="evnt_stat">진행중
									<input type="checkbox" value="04" name="evnt_stat">종료
				</td>
			</tr>
		</table>
		<input type="hidden" name="selectPageNo" >
		<input type="hidden" name="sort" >
	</form>
	
	<input type="button" value="이벤트 신청" onClick="reserveEvent();">&nbsp;
	<input type="button" value="삭제" onClick="deleteNotYetEvent();"><br>
	<div id="comment" style="color:red;">대기중인 이벤트 행사만 삭제할 수 있습니다.</div>
	
	<div>&nbsp; <span class="pagingNumber"></span>&nbsp;</div>
	<table>
		<tr height=10>
			<td></td>
		</tr>
	</table>
	
	
	
	<form name="eventScheduleForm" method="post" action="/group4erp/reserveEvent.do">
		<table class="eventListTable tab" name="eventListTable" cellpadding="5" cellspacing="5" width="800">
			<tr><th></th>
				<c:choose>
					<c:when test="${param.sort=='1 desc'}">
						<th style="cursor:pointer" onClick="$('[name=sort]').val('1 asc'); goSearch();  "> ▼ 이벤트 번호</th>
					</c:when>
					<c:when test="${param.sort=='1 asc'}">
						<th style="cursor:pointer" onClick="$('[name=sort]').val('1 desc'); goSearch(); "> ▲ 이벤트 번호</th>
					</c:when>			
					<c:otherwise>
						<th style="cursor:pointer" onClick="$('[name=sort]').val('1 asc'); goSearch();  ">이벤트 번호</th>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${param.sort=='3 desc'}">
						<th style="cursor:pointer" onClick="$('[name=sort]').val('3 asc'); goSearch();  "> ▼ 이벤트 종류</th>
					</c:when>
					<c:when test="${param.sort=='3 asc'}">
						<th style="cursor:pointer" onClick="$('[name=sort]').val('3 desc'); goSearch(); "> ▲ 이벤트 종류</th>
					</c:when>			
					<c:otherwise>
						<th style="cursor:pointer" onClick="$('[name=sort]').val('3 asc'); goSearch();  ">이벤트 종류</th>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${param.sort=='4 desc'}">
						<th style="cursor:pointer" onClick="$('[name=sort]').val('4 asc'); goSearch();  "> ▼ 타이틀</th>
					</c:when>
					<c:when test="${param.sort=='4 asc'}">
						<th style="cursor:pointer" onClick="$('[name=sort]').val('4 desc'); goSearch(); "> ▲ 타이틀</th>
					</c:when>			
					<c:otherwise>
						<th style="cursor:pointer" onClick="$('[name=sort]').val('4 asc'); goSearch();  ">타이틀</th>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${param.sort=='7 desc'}">
						<th style="cursor:pointer" onClick="$('[name=sort]').val('7 asc'); goSearch();  "> ▼ 시작일</th>
					</c:when>
					<c:when test="${param.sort=='7 asc'}">
						<th style="cursor:pointer" onClick="$('[name=sort]').val('7 desc'); goSearch(); "> ▲ 시작일</th>
					</c:when>			
					<c:otherwise>
						<th style="cursor:pointer" onClick="$('[name=sort]').val('7 asc'); goSearch();  ">시작일</th>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${param.sort=='8 desc'}">
						<th style="cursor:pointer" onClick="$('[name=sort]').val('8 asc'); goSearch();  "> ▼ 종료일</th>
					</c:when>
					<c:when test="${param.sort=='8 asc'}">
						<th style="cursor:pointer" onClick="$('[name=sort]').val('8 desc'); goSearch(); "> ▲ 종료일</th>
					</c:when>			
					<c:otherwise>
						<th style="cursor:pointer" onClick="$('[name=sort]').val('8 asc'); goSearch();  ">종료일</th>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${param.sort=='9 desc'}">
						<th style="cursor:pointer" onClick="$('[name=sort]').val('9 asc'); goSearch();  "> ▼ 상태</th>
					</c:when>
					<c:when test="${param.sort=='9 asc'}">
						<th style="cursor:pointer" onClick="$('[name=sort]').val('9 desc'); goSearch(); "> ▲ 상태</th>
					</c:when>			
					<c:otherwise>
						<th style="cursor:pointer" onClick="$('[name=sort]').val('9 asc'); goSearch();  ">상태</th>
					</c:otherwise>
				</c:choose>
			
			</tr>
			<tr>
			<c:forEach items="${eventList}" var="eventList" varStatus="loopTagStatus">
				<tr style="cursor:pointer" onClick="viewEventInfoForm(${empList.emp_no});">	
					<td class="delCheckBox" align=center>
						<c:if test="${eventList.evnt_stat eq '대기중' }">
							<input type="checkbox" name="delCheckBox" value="${eventList.evnt_no}">
						</c:if>
					</td>
					<td align=center>${eventList.evnt_no}</td>	<!-- <input type="hidden" value="${dep_no}">  -->
					<td align=center>${eventList.evnt_category}</td>
					<td align=center>${eventList.evnt_title}</td>
					<td align=center>${eventList.evnt_start_dt}</td>
					<td align=center>${eventList.evnt_end_dt}</td>
					<td align=center>${eventList.evnt_stat}</td>
				</tr>		
			</c:forEach>
		</table><br>
	
	</form>
	
	<form name="deleteEvntForm" method="post" action="/group4erp/deleteEvntProc.do">
		<input type="hidden" name="evnt_no">
	</form>
	
</center>
</body>
</html>