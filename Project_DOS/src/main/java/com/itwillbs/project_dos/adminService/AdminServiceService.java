package com.itwillbs.project_dos.adminService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.adminMapper.AdminServiceMapper;
import com.itwillbs.project_dos.vo.NoticeVO;

@Service
public class AdminServiceService {
	@Autowired
	private AdminServiceMapper serviceMapper;

	public int registBoard(NoticeVO notice) {
		return serviceMapper.insertNotice(notice);
	}

	public int getAdminNoticeListCount() {
		return serviceMapper.selectAdminNoticeListCount();
	}

	public List<NoticeVO> getNoticeList(int startRow, int listLimit) {
		return serviceMapper.selectAdminNoticeList(startRow,listLimit);
	}
	
}
