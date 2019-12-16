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
			$("#subMenu1").show();
		}

		function viewInventoryMenu() {
			$("#subMenu2").show();
		}
	

		function viewShippingMenu() {
			$("#subMenu3").show();
			//alert("배송관리 기능 구현");
			//location.replace("/z_spring/boardListForm.do");
		}


		function viewMarketingMenu() {
			$("#subMenu4").show();
			//alert("마케팅관리 기능 구현");
			//location.replace("/z_spring/boardListForm.do");
		}


		function viewHRMenu() {
			$("#subMenu5").show();
			//alert("인사관리 기능 구현(admin 권한 보유자만 보이게 구현)");
			//location.replace("/z_spring/boardListForm.do");
		}

		function viewAccoutingMenu() {
			$("#subMenu6").show();
		}

		function viewBigDataMenu() {
			$("#subMenu7").show();
		}

		function viewBuyerMenu() {
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
			<td colspan="17">&nbsp;
				<span id="subMenu1" onMouseOut="javascript:$('#subMenu1').hide();"> <!-- 업무관리 -->
					<label id="mySchedule" style="cursor:pointer" onClick="goMySchedule();">나의 일정&nbsp;&nbsp;&nbsp;</label>
					<label id="myGoods" style="cursor:pointer" onClick="goMyGoods();">담당 상품 조회&nbsp;&nbsp;&nbsp;</label>
					<label id="myDayOff" style="cursor:pointer" onClick="goMyDayOff();">나의 휴가 현황&nbsp;&nbsp;&nbsp; 
						팀회의실 예약&nbsp;&nbsp;&nbsp;
						회사차량이용신청&nbsp;&nbsp;&nbsp;
						야근&주말근무신청&nbsp;&nbsp;&nbsp;	
						출장신청&보고&nbsp;&nbsp;&nbsp;
						근태조회&nbsp;&nbsp;&nbsp;
						경비청구&nbsp;&nbsp;&nbsp;
						ERP 메뉴 설정
				</span>
				
	
				<span id="subMenu2" onMouseOut="javascript:$('#subMenu2').hide();">	<!-- 재고관리 -->
		 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label id="myCareBookList" style="cursor:pointer" onClick="goMyCareBookList();">도서정보조회&nbsp;&nbsp;&nbsp;</label>
					<label id="bookInventoryList" style="cursor:pointer" onClick="goMyCareBookList();">재고현황조회&nbsp;&nbsp;&nbsp;</label>
					<label id="shippingList" style="cursor:pointer" onClick="goMyCareBookList();">출고현황조회&nbsp;&nbsp;&nbsp;</label> 
					<label id="myIntoList" style="cursor:pointer" onClick="goMyCareBookList();">입고현황조회&nbsp;&nbsp;&nbsp;</label>
					<label id="returnBookList" style="cursor:pointer" onClick="goMyCareBookList();">반품현황조회&nbsp;&nbsp;&nbsp;</label>
				</span>
	
	<span id="subMenu3" onMouseOut="javascript:$('#subMenu3').hide();">	<!-- 배송관리 -->
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			주문현황조회&nbsp;&nbsp;&nbsp;
			배송스케쥴조회&nbsp;&nbsp;&nbsp;
			출고지시&nbsp;&nbsp;&nbsp; 
			반품접수&처리 현황&nbsp;&nbsp;&nbsp;
			배송추적&nbsp;&nbsp;&nbsp;
	</span>
	
	<span id="subMenu4" onMouseOut="javascript:$('#subMenu4').hide();">	<!-- 마케팅관리 -->
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			신간정보조회&nbsp;&nbsp;&nbsp;
			판매현황&nbsp;&nbsp;&nbsp;
			매대판매현황&nbsp;&nbsp;&nbsp; 
			이벤트신청 & 결과보고&nbsp;&nbsp;&nbsp;
			이벤트굿즈 제작 발주&nbsp;&nbsp;&nbsp;
			광고신청현황&nbsp;&nbsp;&nbsp;	
	</span>
	
	
	<span id="subMenu5" onMouseOut="javascript:$('#subMenu5').hide();">	<!-- 인사관리 -->
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			조직도&nbsp;&nbsp;&nbsp;
			급여지급현황&nbsp;&nbsp;&nbsp; 
			성과급&수당 정보&nbsp;&nbsp;&nbsp;
			직원 근속 정보&nbsp;&nbsp;&nbsp;
			직원별 근무현황조회&nbsp;&nbsp;&nbsp;	
			직원별 상담 일지&nbsp;&nbsp;&nbsp;
			직원별 휴가 현황&nbsp;&nbsp;&nbsp;
			직원별 휴직/복직신청현황&nbsp;&nbsp;&nbsp;
			직원별 포상/징계 조회&nbsp;&nbsp;&nbsp;
			
	</span>
	
	
	<span id="subMenu6" onMouseOut="javascript:$('#subMenu6').hide();">	<!-- 회계관리 -->
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		매출정보&nbsp;&nbsp;&nbsp;
		미수금&미지급금&nbsp;&nbsp;&nbsp;
		결제예정금액&nbsp;&nbsp;&nbsp; 
		전자어음&nbsp;&nbsp;&nbsp;
		거래명세서&nbsp;&nbsp;&nbsp;
		세금계산서&nbsp;&nbsp;&nbsp;	
		회계결산정보&nbsp;&nbsp;&nbsp;	
	</span>
	
	<span id="subMenu7" onMouseOut="javascript:$('#subMenu7').hide();">	<!-- 전략분석 -->
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		매출추이분석&nbsp;&nbsp;&nbsp;
		고객 선호도 분석&nbsp;&nbsp;&nbsp;
		고객 클레임 처리 상황&nbsp;&nbsp;&nbsp; 
		인기 키워드 현황&nbsp;&nbsp;&nbsp;
		트렌드 변화 추이&nbsp;&nbsp;&nbsp;
		이벤트 행사 사후 분석&nbsp;&nbsp;&nbsp;			
	</span>
	
	
	<span id="subMenu8" onMouseOut="javascript:$('#subMenu8').hide();">	<!-- 거래처관리 -->
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