package com.itwillbs.project_dos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	
	@GetMapping("Mypage")
	public String myPage() {
		
		return "mypage/profile";
	}
}
