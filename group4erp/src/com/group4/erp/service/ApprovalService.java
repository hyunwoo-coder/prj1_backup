package com.group4.erp.service;

import java.util.List;

import com.group4.erp.ApprovalDTO;
import com.group4.erp.ApprovalSearchDTO;

public interface ApprovalService {
	
	int insertApproval(ApprovalDTO approvalDTO);
	
	List<ApprovalDTO> getApprovalReqList(ApprovalSearchDTO approvalSearchDTO);
	
	int getApprovalReqCnt(ApprovalSearchDTO approvalSearchDTO);

}
