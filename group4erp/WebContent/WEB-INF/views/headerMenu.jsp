<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>
<html>
<head>
	<script>
		$(document).ready(function() {
			$("#subMenu1").hide();
			$("#subMenu2").hide();
			$("#subMenu3").hide();
			$("#subMenu4").hide();
			$("#subMenu5").hide();
			$("#subMenu6").hide();
			$("#subMenu7").hide();
			$("#subMenu8").hide();
			
			
			var tableObj = $("[name=menuList]");

			var trObj = tableObj.find("th");

		});
			
	
		function viewMyWorkMenu() {
			hideSubMenu();
			$("#subMenu1").show();
		}

		function viewInventoryMenu() {
			hideSubMenu();
			$("#subMenu2").show();
		}
	

		function viewShippingMenu() {
			hideSubMenu();
			$("#subMenu3").show();
		}


		function viewMarketingMenu() {
			hideSubMenu();
			$("#subMenu4").show();
			//alert("마케팅관리 기능 구현");
			//location.replace("/z_spring/boardListForm.do");
		}


		function viewHRMenu() {
			hideSubMenu();
			$("#subMenu5").show();
			//alert("인사관리 기능 구현(admin 권한 보유자만 보이게 구현)");
			//location.replace("/z_spring/boardListForm.do");
		}

		function viewAccoutingMenu() {
			hideSubMenu();
			$("#subMenu6").show();
		}

		function viewBigDataMenu() {
			hideSubMenu();
			$("#subMenu7").show();
		}

		function viewBuyerMenu() {
			hideSubMenu();
			$("#subMenu8").show();
		}

		function hideSubMenu() {
			$('#subMenu1').hide();
			$('#subMenu2').hide();
			$('#subMenu3').hide();
			$('#subMenu4').hide();
			$('#subMenu5').hide();
			$('#subMenu6').hide();
			$('#subMenu7').hide();
			$('#subMenu8').hide();
		}		

		function goMySchedule() {
			alert("나의 일정 메뉴 준비중");
		}

		function goMyCareBookList() {
			alert("도서정보조회");
		}

		function myDayOffList() {
			alert("나의 휴가 현황 관련 기능 구현");
		}

		function reservateMeetingRoom() {
			alert("팀회의실 예약 기능 구현");
		}

		function lentCompanyCar() {
			alert("회사차량이용신청 기능 구현");
		}

		function businessTripForm() {
			alert("출장신청 & 보고 기능 구현");
		}

		function viewMyWorkTime() {
			alert("근태조회 구현 예정");
		}

		function overTimeWork() {
			alert("야간&주말근무 신청 기능 구현");
		}


		function takeCharge() {
			alert("경비청구 기능 구현 예정");
		}

		function ERPoption() {
			alert("ERP 설정 기능 구현 예정");
		}


		function goMyCareBookList() {
			alert("도서정보리스트 구현 예정");
		}

		function goMyCareBookList() {
			alert("재고현황조회 기능 구현 예정");
		}

		function goMyCareBookList() {
			alert("출고현황조회 기능 구현");
		}

		function goMyCareBookList() {
			alert("입고현황조회 기능 구현");
		}

		function goMyCareBookList() {
			alert("반품 현황 조회 기능 구현");
		}

		function goOrderList() {
			alert("주문현황 조회 기능 구현");
		}

		function goShipScheduleList() {
			alert("배송조회 기능 구현 예정");
		}

		function goShipping() {
			alert("출고지시 기능 구현 예정");
		}

		function goReturnList() {
			alert("반품현황 조회기능 구현 예정");
		}

		function goTrackShipping() {
			alert("배송추적기능 조회");
		}

		function goNewBookList() {
			alert("신간조회기능 구현 예정");
		}

		function goNowSaleList() {
			alert("현재 판매 현황 조회");
		}

		function goGateTableSaleList() {
			alert("매대판매 관련 정보 기능 조회");
		}

		function eventSchedulingList() {
			alert("이벤트 행사 신청 & 결과 보고 기능 구현 예정");
		}

		function eventGoodsOrder() {
			alert("이벤트굿즈 발주 기능 구현");
		}

		function adOrder() {
			alert("광고신청기능 구현 예정");
		}

		<!--추가 예정-->
		
	</script>
</head>
<body>
<center>
	<table name="menuList" border="0" cellspacing="0" cellpadding="0" width="90%">
		<tr>
			<th style="cursor:pointer" onMouseOver="javascript:viewMyWorkMenu();">업무관리</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>	
			<th style="cursor:pointer" onMouseOver="javascirpt:viewInventoryMenu();">재고현황</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<th style="cursor:pointer" onMouseOver="javascirpt:viewShippingMenu();">배송관리</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<th style="cursor:pointer" onMouseOver="javascirpt:viewMarketingMenu();">마케팅관리</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<th style="cursor:pointer" onMouseOver="javascirpt:viewHRMenu();">인사관리</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<th style="cursor:pointer" onMouseOver="javascirpt:viewAccoutingMenu();">회계관리</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<th style="cursor:pointer" onMouseOver="javascirpt:viewBigDataMenu();">전략분석</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<th style="cursor:pointer" onMouseOver="javascirpt:viewBuyerMenu();">거래처관리</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td align="right">OOO 사원님 로그인하셨습니다. &nbsp;<input type="button" value="로그아웃" onClick="logout()"></td>
			
			
		</tr>
		<tr>
			<td colspan="17">&nbsp;<!-- &nbsp;지우지말것!! -->
				<span id="subMenu1"> <!-- 업무관리 -->
					<span id="mySchedule" style="cursor:pointer" onClick="goMySchedule();">나의 일정&nbsp;&nbsp;&nbsp;</span>
					<span id="myCareBookList" style="cursor:pointer" onClick="myCareBookList();">담당 상품 조회&nbsp;&nbsp;&nbsp;</span>
					<span id="myDayOffList" style="cursor:pointer" onClick="myDayOffList();">나의 휴가 현황&nbsp;&nbsp;&nbsp;</span>
					<span id="reservateMeetingRoom" style="cursor:pointer" onClick="reservateMeetingRoom();">팀회의실 예약&nbsp;&nbsp;&nbsp;</span>
					<span id="lentCompanyCar" style="cursor:pointer" onClick="lentCompanyCar();">회사차량이용신청&nbsp;&nbsp;&nbsp;</span>
					<span id="overTimeWork" style="cursor:pointer" onClick="overTimeWork();">야근&주말근무신청&nbsp;&nbsp;&nbsp;</span>
					<span id="businessTripForm" style="cursor:pointer" onClick="businessTripForm();">출장신청&보고&nbsp;&nbsp;&nbsp;</span>
					<span id="viewMyWorkTime" style="cursor:pointer" onClick="viewMyWorkTime();">근태조회&nbsp;&nbsp;&nbsp;</span>
					<span id="takeCharge" style="cursor:pointer" onClick="takeCharge();">경비청구&nbsp;&nbsp;&nbsp;</span>
					<span id="ERPoption" style="cursor:pointer" onClick="ERPoption();">ERP 메뉴 설정&nbsp;&nbsp;&nbsp;</span>
				</span>
				
	
				<span id="subMenu2">	<!-- 재고관리 -->
		 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="myCareBookList" style="cursor:pointer" onClick="goMyCareBookList();">도서정보조회&nbsp;&nbsp;&nbsp;</span>
					<span id="bookInventoryList" style="cursor:pointer" onClick="goMyCareBookList();">재고현황조회&nbsp;&nbsp;&nbsp;</span>
					<span id="shippingList" style="cursor:pointer" onClick="goMyCareBookList();">출고현황조회&nbsp;&nbsp;&nbsp;</span>
					<span id="myIntoList" style="cursor:pointer" onClick="goMyCareBookList();">입고현황조회&nbsp;&nbsp;&nbsp;</span>
					<span id="returnBookList" style="cursor:pointer" onClick="goMyCareBookList();">반품현황조회&nbsp;&nbsp;&nbsp;</span>
				</span>
	
				<span id="subMenu3" >	<!-- 배송관리 -->
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
					<span id="orderList" style="cursor:pointer" onClick="goOrderList();">주문현황조회&nbsp;&nbsp;&nbsp;</span>
					<span id="shipScheduleList" style="cursor:pointer" onClick="goShipScheduleList();">배송스케쥴조회&nbsp;&nbsp;&nbsp;</span>
					<span id="goShipping" style="cursor:pointer" onClick="goShipping();">출고지시&nbsp;&nbsp;&nbsp;</span> 
					<span id="returnList" style="cursor:pointer" onClick="goReturnList();">반품접수&처리 현황&nbsp;&nbsp;&nbsp;</span>
					<span id="trackShipping" style="cursor:pointer" onClick="goTrackShipping();">배송추적&nbsp;&nbsp;&nbsp;</span>
				</span>
	
				<span id="subMenu4">	<!-- 마케팅관리 -->
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="newBookList" style="cursor:pointer" onClick="goNewBookList();">신간정보조회&nbsp;&nbsp;&nbsp;	</span>
					<span id="nowSaleList" style="cursor:pointer" onClick="goNowSaleList();">판매현황&nbsp;&nbsp;&nbsp;</span>
					<span id="gateTableSaleList" style="cursor:pointer" onClick="goGateTableSaleList();">매대판매현황&nbsp;&nbsp;&nbsp;</span> 
					<span id="eventSchedulingList" style="cursor:pointer" onClick="eventSchedulingList();">이벤트신청 & 결과보고&nbsp;&nbsp;&nbsp;</span>
					<span id="eventGoodsOrder" style="cursor:pointer" onClick="eventGoodsOrder();">이벤트굿즈 제작 발주&nbsp;&nbsp;&nbsp;</span>
					<span id="adOrder" style="cursor:pointer" onClick="adOrder();">광고신청현황&nbsp;&nbsp;&nbsp;</span>	
				</span>
	
				<span id="subMenu5">	<!-- 인사관리 -->
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="organizationChart" style="cursor:pointer" onClick="showOrganizationChartr();">조직도&nbsp;&nbsp;&nbsp;</span>
					<span id="salaryList" style="cursor:pointer" onClick="salaryList();">급여지급현황&nbsp;&nbsp;&nbsp; 
					<span id="bonusList" style="cursor:pointer" onClick="bonusListList();">성과급&수당 정보&nbsp;&nbsp;&nbsp;
					<span id="duringWorkList" style="cursor:pointer" onClick="duringWorkList();">직원 근속 정보&nbsp;&nbsp;&nbsp;
					<span id="employeeState" style="cursor:pointer" onClick="employeeState();">직원별 근무현황조회&nbsp;&nbsp;&nbsp;	
					<span id="employeeCouncelList" style="cursor:pointer" onClick="employeeCouncelList();">직원별 상담 일지&nbsp;&nbsp;&nbsp;
					<span id="employeeVacationList" style="cursor:pointer" onClick="employeeCouncelList();">직원별 휴가 현황&nbsp;&nbsp;&nbsp;
					<span id="empLeaveOrReinstatedList" style="cursor:pointer" onClick="empLeaveOrReinstatedList();">직원별 휴직/복직신청현황&nbsp;&nbsp;&nbsp;
					<span id="empBonusOrPenaltyList" style="cursor:pointer" onClick="empBonusOrPenaltyList();">직원별 포상/징계 조회&nbsp;&nbsp;&nbsp;
			
				</span>
	
				<span id="subMenu6">	<!-- 회계관리 -->
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					매출정보&nbsp;&nbsp;&nbsp;
					미수금&미지급금&nbsp;&nbsp;&nbsp;
					결제예정금액&nbsp;&nbsp;&nbsp; 
					전자어음&nbsp;&nbsp;&nbsp;
					거래명세서&nbsp;&nbsp;&nbsp;
					세금계산서&nbsp;&nbsp;&nbsp;	
					회계결산정보&nbsp;&nbsp;&nbsp;	
				</span>
	
				<span id="subMenu7">	<!-- 전략분석 -->
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					매출추이분석&nbsp;&nbsp;&nbsp;
					고객 선호도 분석&nbsp;&nbsp;&nbsp;
					고객 클레임 처리 상황&nbsp;&nbsp;&nbsp; 
					인기 키워드 현황&nbsp;&nbsp;&nbsp;
					트렌드 변화 추이&nbsp;&nbsp;&nbsp;
					이벤트 행사 사후 분석&nbsp;&nbsp;&nbsp;			
				</span>
	
				<span id="subMenu8">	<!-- 거래처관리 -->
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					거래처등록/삭제&nbsp;&nbsp;&nbsp;
					고객사 조회&nbsp;&nbsp;&nbsp;
					파트너사 조회&nbsp;&nbsp;&nbsp; 
					인기 키워드 현황&nbsp;&nbsp;&nbsp;
					지사별 재고수불현황&nbsp;&nbsp;&nbsp;
					거래내역(명세)조회&nbsp;&nbsp;&nbsp;			
				</span>
			
			</td>
		</tr>
	</table> <hr>
</center>
</body>
</html>