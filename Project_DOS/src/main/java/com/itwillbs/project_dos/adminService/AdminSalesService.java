package com.itwillbs.project_dos.adminService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.adminMapper.AdminSalesMapper;
import com.itwillbs.project_dos.vo.PurchaseHistoryVO;

@Service
public class AdminSalesService {
	
	@Autowired
	private AdminSalesMapper salesMapper;

	public List<PurchaseHistoryVO> getHistoryList(int startRow, int listLimit) {
		return salesMapper.selectHistoryList(startRow,listLimit);
	}

	public int getHistoryListCount() {
		return salesMapper.selectHistoryListCount();
	}

}
