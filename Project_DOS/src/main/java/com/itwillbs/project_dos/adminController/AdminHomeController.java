package com.itwillbs.project_dos.adminController;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.project_dos.adminService.AdminHomeService;

@Controller
public class AdminHomeController {
	@Autowired
	private AdminHomeService homeService;
	
	@GetMapping("AdminHome")
	public String adminHome(Model model) {
		
		//멤버쉽분포도를 위한 멤버쉽 리스트 불러오기
		List<Map<String, Object>>  membershipList = homeService.getMembershipList();
		model.addAttribute("membership", membershipList);
		System.out.println(membershipList);
		
		//당일 신규 예약, 이번주 총 예약, 총 평점,신규리뷰,신규 문의 불러오기
		Map<String, String> reservationMap = homeService.getReservationMap();
		model.addAttribute("reservation",reservationMap);
		
		String reviewAVG = homeService.getReviewAVG();
		model.addAttribute("review", reviewAVG);
		
		String newReview = homeService.getNewReview();
		model.addAttribute("newReview", newReview);
		
		String newQna = homeService.getNewQna();
		model.addAttribute("newQna", newQna);
		
		
		return "admin/admin_home";
	}
}
