<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세금계산서</title>
<script>

	function saveTaxInvoiceTemp() {
		alert("세금계산서 임시 저장");
	}

	function issueTaxInvoice() {

		if(confirm("정말 저장하겠습니까?")==false) {

			return;
		}

		
		//alert("세금계산서 발급");
	}

	function searchCorp() {
		//alert("거래처 검색");
		var url = "/group4erp/viewSearchCorp.do";
		var name = "업체 검색";
		var option = "width=300, height=500, top=200, left=200, scrollbars=yes";
		
		window.open(url, name, option);
	}

</script>
</head>
<body><center>
	<h3>세금계산서</h3>
	<form name="taxInvoiceForm" method="post" action="/group4erp/insertTaxInvoice.do" >
		<table class="ourCompanyInfoForm tbcss1" name="ourCompanyInfoForm" cellpadding="5" cellspacing="5" width="800">
			<tr>
				<td rowspan="5" width="100">공급자</td><td>사업자번호</td><td>110-11-98765</td>
			</tr>
			<tr>
				<td width="10">상호(법인명)</td><td>(주)아이즈북스&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td>성명(대표자)</td><td>조충래, 김태현, 박현우, 이동하, 임남희, 최민지</td>
			</tr>
			<tr>
				<td>사업자주소</td><td>서울특별시 금천구 가산동 월드메르디앙 2차 409호&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td>업종</td><td>출판&nbsp;&nbsp;</td>
			</tr>
		</table><br>
		
		<table class="BuyerInfoForm tbcss1" name="BuyerInfoForm" cellpadding="5" cellspacing="5" width="800">
			<tr>
				<td rowspan="5" width="100">공급받는자<input type="button" value="검색" onClick="searchCorp();"></td><td>사업자번호</td><td> ${selectedCorp.corp_no} </td>
			<tr>
				<td width="10">상호(법인명)</td><td>${selectedCorp.corp_name}</td>
			</tr>
			<tr>
				<td>성명(대표자)</td><td>${selectedCorp.ceo_name}</td> 
			</tr>
			<tr>
				<td>사업자주소</td><td>${selectedCorp.corp_addr}</td>
			</tr>
			<tr>
				<td>업종</td><td>${selectedCorp.corp_business_area}</td>
			</tr>
		</table>
	
	<br>				
	<table class="invoice_body tbcss1" name="invoice_body" cellpadding="5" cellspacing="5" width="800">
		<tr>
			<th>거래일시</th><th>품목</th><th>단가</th><th>공급가액</th><th>세액</th><th>비고</th>
		</tr>
		<tr>
			<td><input type="text" name="tradeDate"></td>
			<td><input type="text" name="item"></td>
			<td><input type="text" name="unit_cost"></td>
			<td><input type="text" name="real_cost"></td>
			<td><input type="text" name="tax"></td>
			<td><input type="text" name="comment"></td>
		</tr>
		</table> 
	
	</form>
	<input type="button" value="임시저장" onClick="saveTaxInvoiceTemp();">
	<input type="button" value="발급하기" onClick="issueTaxInvoice();">
	
</center>

</body>
</html>