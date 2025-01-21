package com.itwillbs.project_dos.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.project_dos.adminService.AdminReservationService;
import com.itwillbs.project_dos.service.MyPageService;
import com.itwillbs.project_dos.vo.MemberVO;
import com.itwillbs.project_dos.vo.ReservationVO;

@Controller
public class MypageController {
	
	@Autowired
	private MyPageService myPageService;
	
	
	@GetMapping("Mypage")
	public String myPage(HttpSession session,Model model) {
		
		String id = (String) session.getAttribute("sId");
		
		MemberVO member = myPageService.getMyProfile(id);
		
		model.addAttribute("member", member);
		
		List<ReservationVO> myReservation = myPageService.getMyReservationlist(id);
		
		model.addAttribute("reservationList", myReservation);
		
		return "mypage/profile";
	}
	
	@GetMapping("MyReservationEdit")
	public String myReservationEdit(String reservation_idx,Model model) {
		
		ReservationVO myreservation = myPageService.getMyReservation(reservation_idx);
		
		model.addAttribute("reservation",myreservation);
		
		return "mypage/reservation_edit";
	}
	
	@GetMapping("MyReservationTableEdit")
	public String reservationTableEdit() {
		return "mypage/reservation_table_edit";
		
	}
}
