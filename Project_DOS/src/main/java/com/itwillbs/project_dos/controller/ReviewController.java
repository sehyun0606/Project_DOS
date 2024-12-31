package com.itwillbs.project_dos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {
	@GetMapping("Review")
	public String review() {
		return "review/review_list";
	}
}
