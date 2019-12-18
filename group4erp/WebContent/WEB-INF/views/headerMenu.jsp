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


		function moveMainPage() {
			location.replace("/group4erp/goMainPage.do");
		}
			
	
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

	<!-- 업무관리 서브메뉴 -->
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


		<!-- 재고관리 서브메뉴 -->
		function goBookList() {
			location.replace("/group4erp/goBookList.do");
			//alert("도서정보리스트 구현 예정");
		}

		function goBookInvenList() {
			//alert("재고현황조회 기능 구현 예정");
			location.replace("/group4erp/goBookInvenList.do");
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

		<!-- 배송관리 서브메뉴 -->
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

		function goNowSaleList() {
			alert("현재 판매 현황 조회");
		}

		function goGateTableSaleList() {
			alert("매대판매 관련 정보 기능 조회");
		}

		function eventSchedulingList() {
			//alert("이벤트 행사 신청 & 결과 보고 기능 구현 예정");
			location.replace("/group4erp/eventScheduling.do");
		}

		function eventGoodsOrder() {
			alert("이벤트굿즈 발주 기능 구현");
		}

		function adOrder() {
			alert("광고신청기능 구현 예정");
		}

		<!-- 인사관리 서브 메뉴-->
		function viewEmpList() {	//직원정보
			location.replace("/group4erp/viewEmpList.do");
		}

		function viewSalaryList() {		//급여지급현황조회
			location.replace("/group4erp/viewSalList.do");
		}

		function viewEmpWorkStateList() {	//직원별 근무현황 조회
			location.replace("/group4erp/viewEmpWorkStateList.do");
		}

		function viewEmpDayOffList() {	//직원별 휴가현황 조회
			location.replace("/group4erp/viewEmpDayOffList.do");
		}
		
		
	</script>
</head>
<body>
<center>
	<table name="menuList" border="0" cellspacing="0" cellpadding="0" width="90%">
		<tr>
			<td align="left"><input type="button" value="메인화면으로" onClick="moveMainPage();"></td>
			<th style="cursor:pointer" onMouseOver="javascript:viewMyWorkMenu();">업무관리</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>	
			<th style="cursor:pointer" onMouseOver="javascirpt:viewInventoryMenu();">재고현황</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<!-- <th style="cursor:pointer" onMouseOver="javascirpt:viewShippingMenu();">배송관리</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> -->
			<th style="cursor:pointer" onMouseOver="javascirpt:viewMarketingMenu();">마케팅관리</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<th style="cursor:pointer" onMouseOver="javascirpt:viewHRMenu();">인사관리</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<th style="cursor:pointer" onMouseOver="javascirpt:viewAccoutingMenu();">회계관리</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<th style="cursor:pointer" onMouseOver="javascirpt:viewBigDataMenu();">전략분석</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<!-- <th style="cursor:pointer" onMouseOver="javascirpt:viewBuyerMenu();">거래처관리</th><td widht="100" onMouseOver="hideSubMenu();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> -->
			<td align="right">OOO 사원님 로그인하셨습니다. &nbsp;<input type="button" value="로그아웃" onClick="logout()"></td>
			
			
		</tr>
		<tr>
			<td colspan="17">&nbsp;<!-- &nbsp;지우지말것!! -->
				<span id="subMenu1"> <!-- 업무관리 -->
					<span id="myCareBookList" style="cursor:pointer" onClick="myCareBookList();">담당 상품 조회&nbsp;&nbsp;&nbsp;</span>
					<span id="overTimeWork" style="cursor:pointer" onClick="overTimeWork();">야근&주말근무신청&nbsp;&nbsp;&nbsp;</span>
					<span id="businessTripForm" style="cursor:pointer" onClick="businessTripForm();">출장신청&보고&nbsp;&nbsp;&nbsp;</span>
					<span id="viewMyWorkTime" style="cursor:pointer" onClick="viewMyWorkTime();">근태조회&nbsp;&nbsp;&nbsp;</span>
					<span id="takeCharge" style="cursor:pointer" onClick="takeCharge();">경비청구&nbsp;&nbsp;&nbsp;</span>
				</span>
				
	
				<span id="subMenu2">	<!-- 재고관리 -->
					<span id="myCareBookList" style="cursor:pointer" onClick="goBookList();">도서정보조회&nbsp;&nbsp;&nbsp;</span>
					<span id="bookInventoryList" style="cursor:pointer" onClick="goBookInvenList();">재고현황조회&nbsp;&nbsp;&nbsp;</span>
					<span id="shippingList" style="cursor:pointer" onClick="goShippingList();">출고현황조회&nbsp;&nbsp;&nbsp;</span>
					<span id="myIntoList" style="cursor:pointer" onClick="goMyIntoList();">입고현황조회&nbsp;&nbsp;&nbsp;</span>
					<span id="returnBookList" style="cursor:pointer" onClick="goReturnBookList();">반품현황조회&nbsp;&nbsp;&nbsp;</span>
				</span>
	
				<span id="subMenu3" >	<!-- 배송관리 -->
					<span id="orderList" style="cursor:pointer" onClick="goOrderList();">주문현황조회&nbsp;&nbsp;&nbsp;</span>
					<span id="shipScheduleList" style="cursor:pointer" onClick="goShipScheduleList();">배송스케쥴조회&nbsp;&nbsp;&nbsp;</span>
					<span id="goShipping" style="cursor:pointer" onClick="goShipping();">출고지시&nbsp;&nbsp;&nbsp;</span> 
					<span id="returnList" style="cursor:pointer" onClick="goReturnList();">반품접수&처리 현황&nbsp;&nbsp;&nbsp;</span>
				</span>
	
				<span id="subMenu4">	<!-- 마케팅관리 -->
					<span id="nowSaleList" style="cursor:pointer" onClick="goNowSaleList();">판매현황&nbsp;&nbsp;&nbsp;</span>
					<span id="gateTableSaleList" style="cursor:pointer" onClick="goGateTableSaleList();">매대판매현황&nbsp;&nbsp;&nbsp;</span> 
					<span id="eventSchedulingList" style="cursor:pointer" onClick="eventSchedulingList();">이벤트신청 & 결과보고&nbsp;&nbsp;&nbsp;</span>
					<span id="eventGoodsOrder" style="cursor:pointer" onClick="eventGoodsOrder();">이벤트굿즈 제작 발주&nbsp;&nbsp;&nbsp;</span>
					<span id="adOrder" style="cursor:pointer" onClick="adOrder();">광고신청현황&nbsp;&nbsp;&nbsp;</span>	
				</span>
	
				<span id="subMenu5">	<!-- 인사관리 -->
					<span id="empList" style="cursor:pointer" onClick="viewEmpList();">직원현황&nbsp;</span>
					<span id="salaryList" style="cursor:pointer" onClick="viewSalaryList();">급여지급현황&nbsp;</span>
					<span id="empWorkState" style="cursor:pointer" onClick="viewEmpWorkStateList();">직원별 근무현황조회&nbsp;</span>
					<span id="empDayOffList" style="cursor:pointer" onClick="viewEmpDayOffList();">직원별 휴가 현황&nbsp;</span>		
				</span>
	
				<span id="subMenu6">	<!-- 회계관리 -->
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="salesInfoList" style="cursor:pointer" onClick="viewSalesReport();">매출정보&nbsp;&nbsp;&nbsp;</span>
					<span id="nonPaymentList" style="cursor:pointer" onClick="viewNonPaymentList();">결제예정금액&nbsp;&nbsp;&nbsp;</span>
					<span id="elecBill" style="cursor:pointer" onClick="viewElecBillList();">전자어음&nbsp;&nbsp;&nbsp;</span>
					<span id="specTransaction" style="cursor:pointer" onClick="viewSpecTransaction();">거래명세서&nbsp;&nbsp;&nbsp;</span>
					<span id="taxInvoice" style="cursor:pointer" onClick="viewTaxInvoice();">세금계산서&nbsp;&nbsp;&nbsp;</span>
				</span>
	
				<span id="subMenu7">	<!-- 전략분석 -->
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="salesChangeReport" style="cursor:pointer" onClick="viewSalesChangeReport();">매출추이분석&nbsp;&nbsp;&nbsp;</span>
					<span id="nowSaleListReport" style="cursor:pointer" onClick="viewNowSaleReport();">판매현황분석&nbsp;&nbsp;&nbsp;</span>
					<span id="cusPrefReport" style="cursor:pointer" onClick="viewCusPrefReport();">고객 선호도 분석&nbsp;&nbsp;&nbsp;</span>
					<span id="cusClaimReport" style="cursor:pointer" onClick="viewCusClaimReport();">고객 클레임 처리 상황&nbsp;&nbsp;&nbsp;</span>
					<span id="bestKeywordReport" style="cursor:pointer" onClick="viewBestKeywordReport();">인기 키워드 현황&nbsp;&nbsp;&nbsp;</span>
					<span id="trendChangeReport" style="cursor:pointer" onClick="viewTrendChangeReportReport();">트렌드 변화 추이&nbsp;&nbsp;&nbsp;</span>
					<span id="eventReport" style="cursor:pointer" onClick="viewEventReportReport();">이벤트 행사 사후 분석&nbsp;&nbsp;&nbsp;</span>
				</span>
	
				<!-- <span id="subMenu8">	거래처관리 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="updateClientList" style="cursor:pointer" onClick="updateClientList();">거래처 목록&nbsp;&nbsp;&nbsp;
					<span id="clientList" style="cursor:pointer" onClick="viewClientList();">고객사 조회&nbsp;&nbsp;&nbsp;
					<span id="supporterList" style="cursor:pointer" onClick="viewSupporterList();">협력사 조회&nbsp;&nbsp;&nbsp; 
						
				</span>-->
			
			</td>
		</tr>
	</table> <hr>
</center>
</body>
</html>