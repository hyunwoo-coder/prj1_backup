<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src = "/www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 키워드 분석 자료</title>
<script>

	google.charts.load('current', {'packages' : ['corechart'] } );

	google.charts.setOnLoadCallback(drawChart);


	function drawChart() {
		var data = google.visualization.arrayToDataTable(${bestKwd_chart_data});

		var options = {
				title: '일별 키워드 검색 건수',
				width :500, 
				height: 200
		};

		var chart = new google.visualization.LineChart(document.getElementById('bestKwdCntChart'));

		chart.draw(data, options);
	}


</script>
</head>
<body><center>
	<h1>키워드 검색 분석 자료</h1>
	<form name="keywordSearchForm" method="post" action="/group4erp/searchKeywordInfo.do">
		<table border="0" cellpadding="5" cellspacing="5" >
			<tr>
				<td align="left">[키워드]</td><td><input type="text" name="keyword1" class="keyword1" >
												<input type="button" value="검색" onClick="goSearch();"></td>
			</tr>
			<tr>
				<td align="left">[상위순]</td><td><input type="checkbox" name="readcnt" class="readcnt" value="100">Best 10 &nbsp;
											<input type="checkbox" name="readcnt" class="readcnt" value="100">Best 15 &nbsp;
											<input type="checkbox" name="readcnt" class="readcnt" value="100">Best 20 &nbsp;</td>
			</tr>
		</table>
	</form>
	<div id="bestKwdCntChart" style="width: 500px; height: 200px;"> </div><br>
	-전체-
	<table class="bestKeywdTable tab" name="bestKeywdTable tab" cellpadding="5" cellspacing="5">
		<th style="cursor:pointer">순위</th><th style="cursor:pointer">키워드</th><th style="cursor:pointer">검색 횟수</th>
			<c:forEach items='${bestKwdList}' var="bestKwdList" varStatus="loopTagStatus">
				<tr>
					<td align="center">${bestKwdList.rank}</td>
					<td align="center">${bestKwdList.srch_kwd}</td>
					<td align="center">${bestKwdList.kwd_cnt}</td>				
				</tr>				
			</c:forEach>

	</table>
</center>

</body>
</html>