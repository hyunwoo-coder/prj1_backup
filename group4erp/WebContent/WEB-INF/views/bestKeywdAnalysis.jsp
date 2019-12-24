<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 키워드 분석 자료</title>
</head>
<body><center>
	<h1>키워드 검색 분석 자료</h1>
	<form name="keywordSearchForm" method="post" action="/group4erp/searchKeywordInfo.do">
		<b><<   2019.12.23(월)  >></b><br><br>
		[키워드1] : <input type="text" name="keyword1" class="keyword1" >&nbsp;&nbsp;&nbsp;
			
					<select name="orAnd" class="orAnd">
						<option value="or" selected>or</option>
						<option value="and">and</option>
					</select>
			
		[키워드2] : <input type="text" name="keyword2" class="keyword2" >&nbsp;&nbsp;&nbsp;
		<br>
		<!-- 어제 또는 오늘 게시판 글을 검색하는 조건 표현하기 -->
		
		&nbsp;&nbsp;&nbsp;
		[조회수] : 				
		<input type="checkbox" name="readcnt" class="readcnt" value="100">조회수100회이상&nbsp;&nbsp;&nbsp;
	
	</form>
	
	<table class="bestKeywdTable tbcss2" name="bestKeywdTable" cellpadding="5" cellspacing="5">
		<tr>
			<th>순위</th><th>검색어</th>
		</tr>
		<tr>
			<td>1</td><td>2020</td>
		</tr>
		<tr>
			<td>2</td><td>노벨문학상</td>
		</tr>
		<tr>
			<td>3</td><td>여행도서</td>
		</tr>
		<tr>
			<td>4</td><td>북튜버</td>
		</tr>
		<tr>
			<td>5</td><td>kpop</td>
		</tr>
				

	</table>

</center>

</body>
</html>