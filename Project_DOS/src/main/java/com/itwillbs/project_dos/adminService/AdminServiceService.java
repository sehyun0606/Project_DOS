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

	public NoticeVO getAdminNotice(int board_num) {
		return serviceMapper.selectAdminNotice(board_num);
	}

	public int editNotice( NoticeVO notice) {
		return serviceMapper.updateAdminNotice(notice);
	}

	public int deleteNotice(int board_num) {
		return serviceMapper.deleteAdminNotice(board_num);
	}

	public List<NoticeVO> searchNoticeListByName(String searchQuery) {
		return serviceMapper.searchNoticeByTitle(searchQuery);
	}

	public List<NoticeVO> searchNoticeListByDate(String searchQuery) {
		return serviceMapper.searchNoticeByDate(searchQuery);
	}
	
	
}
