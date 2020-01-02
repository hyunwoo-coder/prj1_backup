<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매현황</title>
</head>
<body><center>
	<h1>판매현황</h1><br>
	
	[주문 현황]
	<table name="onLineSaleTable" cellpadding="5" cellspacing="5">
		<tr>
			<td>온라인</td><td>${onlineOrderCnt}건</td>
		</tr>
		<tr>
			<td>오프라인</td><td>0건</td>
		</tr>
	</table>

	[오프라인 판매 현황]
	<table name="offLineSaleTable" cellpadding="5" cellspacing="5">
		<tr>
			<td></td>
		</tr>
	
	</table>
</center>

</body>
</html>