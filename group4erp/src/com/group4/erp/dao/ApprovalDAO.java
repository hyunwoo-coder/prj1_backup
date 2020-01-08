package com.group4.erp.dao;

import java.util.List;

import com.group4.erp.ApprovalDTO;
import com.group4.erp.ApprovalSearchDTO;

public interface ApprovalDAO {
	
	int insertApproval(ApprovalDTO approvalDTO);
	
	List<ApprovalDTO> getApprovalReqList(ApprovalSearchDTO approvalSearchDTO);
	
	int getApprovalReqCnt(ApprovalSearchDTO approvalSearchDTO);

}
