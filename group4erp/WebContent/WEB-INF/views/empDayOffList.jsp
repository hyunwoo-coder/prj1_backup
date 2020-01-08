<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>직원별 휴가현황</title>
	<script>

		$(document).ready(function(){
			
			$(".pagingNumber").html(
				getPagingNumber(
					"${getDayOffListCnt}"					//검색 결과 총 행 개수
					,"${hrListSearchDTO.selectPageNo}"		//선택된 현재 페이지 번호
					,"${hrListSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
					,"10"									//페이지 당 보여줄 페이지번호 개수
					,"goSearch();"							//페이지 번호 클릭 후 실행할 자스 코드
				)
			);

			setTableTrBgColor(
					"dayOffList",			//테이블 class 값
					"${headerColor}",		//헤더 tr 배경색
					"${oddTrColor}",		//홀수행 배경색
					"${evenTrColor}",		//짝수행 배경색
					"${mouseOverColor}"		//마우스 온 시 배경색
			);
			
		});
	
		function goSearch(){
			location.replace("/group4erp/viewEmpDayOffList.do");
		}

		function getNowtime() {
			var today = new Date();
			var year = today.getFullYear(); 
			var month = today.getMonth()+1; 
			var date = today.getDate();
			var week = getWeek(today);

			if(month < 10 ) {month = "0"+month;}
			if (date<10){date = "0" + date;}

			//alert( document.write(year) );
			//return 'abc';
			var result = year + "년 " +month + "월 " + date + "일 ("+ week +") ";
			$("#nowtime").text('2019-09-09');			
			//return year + "년 " +month + "월 " + date + "일 ("+ week +") " + hour + "시 " + minute + "분 " +second + "초 ";
		}

		function dayoffUpdate(emp_no){
				alert(emp_no);
				return;
		}


		function addUpdelTr(ele, emp_no){
			//console.log(ele);
			//console.log($(ele));
			//alert($(ele).children().eq(1).text());
			var addhtmlTr = "<tr name='addTr'><td align=center></td>";
			addhtmlTr += "<td align=center>"+$(ele).children().eq(1).text()+"</td>";
			addhtmlTr += "<td align=center>"+$(ele).children().eq(2).text()+"</td>";
			addhtmlTr += "<td align=center>"+$(ele).children().eq(3).text()+"</td>";
			//addhtmlTr += "<td align=center><input type='text' name='dayoff_name' size=5 value='"+$(ele).children().eq(4).text()+"'></td>";
			addhtmlTr += "<td align=center><select name='dayoff_cd' value='"+$(ele).children().eq(4).text()+"'><option value='1'>연차</option>"
			addhtmlTr += "<option value='2'>월차</option><option value='3'>생리</option><option value='4'>출산</option>"
			addhtmlTr += "<option value='5'>반차</option><option value='6'>보상</option></select>"
				
			var dtfrom = $(ele).children().eq(5).text();
			var dtfromval = dtfrom.replace(dtfrom.substr(11,2),"").trim();
			addhtmlTr += "<td align=center><input type='text' name='start_day_off' id='dateFrom' size='10' value='"+dtfromval+"'></td>";

			var dttill = $(ele).children().eq(6).text();
			var dttillval = dttill.replace(dttill.substr(11,2),"").trim();
			addhtmlTr += "<td align=center><input type='text' name='end_day_off' id='dateTill' size='10' value='"+dttillval+"'><input type='hidden' name='emp_no' value='"+emp_no+"'></td></tr>";
			addhtmlTr += "<tr><td style='border-top:0px' colspan=7 align=center><input type='button' value='수정' onClick='dayoffUpdate(this);'>&nbsp;&nbsp;<input type='button' value='닫기' onClick='dayoffClose(this);'></td><tr>";
			//<input type='button' value='삭제' onClick='dayoffDelete(this);'>
			
			$(ele).after(addhtmlTr);

	        $("#dateFrom").datepicker({ 
		    	        dateFormat: 'yy-mm-dd'
			    	    ,defaultDate : dtfromval
			    	    ,minDate : 'today'
		        		,onClose: function( selectedDate ) {   
							//$("#dateTill").datepicker({minDate:selectedDate});
			        		$("#dateTill").datepicker( "option", "minDate", selectedDate );
						}       
						,onSelect: function() { 
					        var dateObject = $(this).datepicker('getDate');
					    }
			});
			//$( "#dateFrom" ).datepicker().datepicker("setDate", dtfromval);
			//$( "#dateFrom" ).datepicker("setDate", dtfromval);
			
	        $("#dateTill").datepicker({ 
		        		dateFormat: 'yy-mm-dd'
		        		,defaultDate : dttillval
		        		,minDate : dtfromval
			        	,onClose: function( selectedDate ) {
                			//$("#dateFrom").datepicker({maxDate:selectedDate});
			        		// $("#dateFrom").datepicker( "option", "maxDate", selectedDate );
	            		}
						,onSelect: function() { 
					        var dateObject = $(this).datepicker('getDate');
					        alert($(this).val()); 
					    }      
            });
		}


		function dayoffUpdate(up){
			var data1 = $("[name=addTr]").find("[name=dayoff_cd]").val();
			var data2 = $("[name=addTr]").find("[name=start_day_off]").val();
			var data3 = $("[name=addTr]").find("[name=end_day_off]").val();
			var data4 = $("[name=addTr]").find("[name=emp_no]").val();
			var updatedata = "dayoff_cd="+data1+"&start_day_off="+data2+"&end_day_off="+data3+"&emp_no="+data4;

			$.ajax({
                url : "/group4erp/dayoffUpdateProc.do"
                , type: "post"
                , data : updatedata
                , success : function(dayoffUpdateCnt){
	                	if(dayoffUpdateCnt == 1){
		                      alert("수정되었습니다.");
		                      location.replace("/group4erp/viewEmpDayOffList.do");
		                }
 
		                else{
		                      alert("서버쪽 DB 연동 실패");
		                }
                } 

                , error : function(){
                   alert("서버 접속 실패");
                }
             });
			
		}
		//function dayoffDelete(del){}
		function dayoffClose(close){
			$(close).parent().parent().prev().remove();	
			$(close).parent().remove();
		}

		
	</script>
</head>
<body><center>

	<h1 style="font-size:15pt">[직원 휴가 현황]</h1><br>
	<div id="nowtime" onload="getNowtime();">기준일 :</div><br><br>
	 
	<form name="empDayOffList" method="post" action="/group4erp/viewEmpDayOffList.do">
		<table class="dayOffList tab" name="dayOffList" cellpadding="5" cellspacing="5" width="700">
				<tr class="thset">

				<!-- <tr >
					<th style="cursor:pointer">NO
					<th style="cursor:pointer">소속 부서
					<th style="cursor:pointer">직급
					<th style="cursor:pointer">성명
					<th style="cursor:pointer">휴가 종류
					<th style="cursor:pointer">복귀 예정일
					<th style="cursor:pointer">수정/삭제 -->

					<th bgcolor="gray" style="cursor:pointer">NO</th>
					<th bgcolor="gray" style="cursor:pointer">소속 부서</th>
					<th bgcolor="gray" style="cursor:pointer">직급</th>
					<th bgcolor="gray" style="cursor:pointer">성명</th>
					<th bgcolor="gray" style="cursor:pointer">휴가 종류</th>
					<th bgcolor="gray" style="cursor:pointer">휴가 시작일</th>
					<th bgcolor="gray" style="cursor:pointer">복귀 예정일</th>

				</tr>

				<c:forEach items="${requestScope.getDayOffList}" var="dayoff" varStatus="loopTagStatus">
					<tr style="cursor:pointer; font-size:11pt;" onclick="addUpdelTr(this,'${dayoff.emp_no}')">
						<td align=center>${loopTagStatus.index+1}</td>
						<td align=center>${dayoff.dep_name}</td>
						<td align=center>${dayoff.jikup}</td>
						<td align=center>${dayoff.emp_name}</td>
						<td align=center>${dayoff.dayoff_name}</td>
						<td align=center>${dayoff.start_day_off}</td>
						<td align=center>${dayoff.end_day_off}</td>
					</tr>
				</c:forEach>
		</table>
				
		<table><tr height=10><td></table>
		<input type="button" onclick="goSearch();" value="1">
		<input type="hidden" name="selectPageNo">
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
		<br><br><br>
		<c:if test="${empty getDayOffList}">
			금일은 휴가자가 없습니다.
		</c:if>
	
	</form>
	
</center>
</body>
</html>