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
<title>휴가 신청 결재</title>
</head>
<body><center>	
	<form name="DayOffApprovalDoc" method="post" action="/group4erp/eventApproavalProc.do">
		<table name="outerLineTable tab" cellpadding="5" cellspacing="5" width="700" align="center">
		
		<tr>
			<td align="right" ><table name="jikup" border="1" cellpadding="5" cellspacing="0"><tr><td  width="90" align="center">기안자 </td><td  width="90" align="center">부서장</td><td width="90" align="center">대표이사 </td> </tr> 
														<tr><td align="center">${myDayOffApplyInfo.jikup} ${myDayOffApplyInfo.emp_name} </td><td align="center"><input type="radio" name="approvalYn" value="1">승인 &nbsp;
																											<input type="radio" name="approvalYn" value="2">반려 &nbsp;</td>
																											
																											<td><input type="radio" name="approvalYn" value="1">승인 &nbsp;
																											<input type="radio" name="approvalYn" value="2">반려 &nbsp; </td></tr></table>						
		</tr>
			
		<tr>
			<table class="documentTable tab" name="documentTable" cellpadding=5" cellspacing="5" width="600">		
				<tr>
					<td width="100">신청번호</td><td colspan="3">${myDayOffApplyInfo.dayoff_apply_no}</td>
				</tr>
				<tr>
					<td width="100">기안자</td><td widht="200">직급 : ${myDayOffApplyInfo.jikup}&nbsp;  </td><td width="200" >성명 : ${myDayOffApplyInfo.emp_name}  </td>
				</tr>
				<tr>
					<td width="100">신청 휴가</td ><td colspan="3">${myDayOffApplyInfo.dayoff_category}</td>
				</tr>			
				<tr>
					<td>휴가 기간</td><td colspan="2">${myDayOffApplyInfo.start_dayoff} ~ ${myDayOffApplyInfo.end_dayoff} ${myDayOffApplyInfo.using_dayoff }일간</td>
				</tr>
					
			</table><br>
			<h4>위와 같이 휴가를 신청하오니 검토 부탁드립니다.</h4>	
			<input type="button" value="결재" onClick="responseApproval();"> &nbsp;
			<input type="reset" value="초기화">
		</tr>	
	</table><br>
	

	</form>
	
</center>

</body>
</html>