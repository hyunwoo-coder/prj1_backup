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
		alert("세금계산서 발급");
	}

</script>
</head>
<body><center>
	<h3>세금계산서</h3>
	<form name="taxInvoiceForm" method="post" action="/group4erp/insertTaxInvoice.do" >
		<table class="tbcss1" name="taxInvoiceForm" cellpadding="5" cellspacing="5" width="800">
		<tr>
			<td rowspan="5" width="10">공급자</td><td>사업자번호</td><td>&nbsp;&nbsp;</td><td rowspan="5" width="10">공급받는자</td><td>사업자번호</td><td>&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td width="10">상호(법인명)</td><td>&nbsp;&nbsp;</td><td width="10">상호(법인명)</td><td>&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td>성명(대표자)</td><td>&nbsp;&nbsp;</td><td>성명(대표자)</td><td>&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td>사업자주소</td><td>&nbsp;&nbsp;</td><td>사업자주소</td><td>&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td>업종</td><td>&nbsp;&nbsp;</td><td>업종</td><td>&nbsp;&nbsp;</td>
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