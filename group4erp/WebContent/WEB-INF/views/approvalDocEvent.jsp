<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>

<% 
	//String mgr_emp_no = (String)session.getAttribute("mgr");
	//System.out.println("mgr_emp_no==="+mgr_emp_no);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 행사 신청 결재</title>
</head>
<body><center>	
	<form name="eventApprovalDoc" method="post" action="/group4erp/eventApproavalProc.do">
		<table name="outerLineTable tab" cellpadding="5" cellspacing="5" width="700" align="center">
		
		<tr>
			<td align="right" ><table name="jikup" border="1" cellpadding="5" cellspacing="0"><tr><td  width="90" align="center">기안자 </td><td  width="90" align="center">부서장</td><td width="90" align="center">대표이사 </td> </tr> 
														<tr><td align="center">${approvalInfoList.emp_name}</td><td align="center"><input type="radio" name="approvalYn" value="1">승인 &nbsp;
																											<input type="radio" name="approvalYn" value="2">반려 &nbsp;</td>
																											
																											<td><input type="radio" name="approvalYn" value="1">승인 &nbsp;
																											<input type="radio" name="approvalYn" value="2">반려 &nbsp; </td></tr></table>						
		</tr>
			
		<tr>
			<table class="documentTable tab" name="documentTable" cellpadding=5" cellspacing="5" width="600">		
				<tr>
					<td width="100">신청번호</td><td colspan="3">${approvalInfoList.evnt_no}</td>
				</tr>
				<tr>
					<td width="100">기안자</td><td>직급 : &nbsp;${approvalInfoList.jikup}</td><td width="50" >성명 : ${approvalInfoList.emp_name}</td>
				</tr>
				<tr>
					<td width="100">일시</td><td colspan="3">${approvalInfoList.reg_dt} </td>
				</tr>
				<tr>
					<td width="100">안건 주제</td ><td colspan="3">이벤트 행사 신청</td>
				</tr>
				<tr>
					<td width="100" rowspan="3">내용</td><td width="100" >이벤트 타이틀</td><td colspan="2">${approvalInfoList.evnt_title}</td>
				</tr>
				
				<tr>
					<td>진행 일시</td><td colspan="2">${approvalInfoList.evnt_start_dt} ~ ${approvalInfoList.evnt_end_dt}</td>
				</tr>
				<tr>
					<td width="100">첨부파일</td><td colspan="3">${approvalInfoList.atchd_data}</td>
				</tr>
				<tr>
					<td width="100">비고</td><td colspan="3">${approvalInfoList.evnt_comment}</td>
				</tr>
				<tr>
					<td width="100">메모</td><td colspan="3"><textarea name="mgr_memo"></textarea></td>
				</tr>				
			</table><br>
			<h4>위와 같이 진행할 예정이니 검토 부탁드립니다.</h4>
		</tr>	
	</table>
	<br><br>
	
	<input type="button" value="결재" onClick="responseApproval();"> &nbsp;
	<input type="reset" value="초기화">
	</form>
	
</center>

</body>
</html>