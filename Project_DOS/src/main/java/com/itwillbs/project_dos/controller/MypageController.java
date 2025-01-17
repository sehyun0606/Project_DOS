package com.itwillbs.project_dos.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.project_dos.service.MyPageService;
import com.itwillbs.project_dos.vo.MemberVO;

@Controller
public class MypageController {
	
	@Autowired
	private MyPageService myPageService;
	@GetMapping("Mypage")
	public String myPage(HttpSession session,Model model) {
		
		String id = (String) session.getAttribute("sId");
		
		MemberVO member = myPageService.getMyProfile(id);
		
		model.addAttribute("member", member);
		
		return "mypage/profile";
	}
}
