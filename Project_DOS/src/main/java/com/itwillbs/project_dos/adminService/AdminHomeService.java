package com.itwillbs.project_dos.adminService;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.adminMapper.AdminHomeMapper;

@Service
public class AdminHomeService {

	@Autowired
	private AdminHomeMapper homeMapper;
	
	//멤버쉽 분포도를 위한 각 멤버쉽 분포 불러오기
	public List<Map<String, Object>> getMembershipList() {
		return homeMapper.selectMembershipList();
	}

	public Map<String, String> getReservationMap() {
		return homeMapper.selectResrevationMap();
	}

	public String getReviewAVG() {
		return homeMapper.selectReviewAVG();
	}

	public String getNewReview() {
		return homeMapper.getNewReview();
	}

	public String getNewQna() {
		return homeMapper.getNewQna();
	}

}
