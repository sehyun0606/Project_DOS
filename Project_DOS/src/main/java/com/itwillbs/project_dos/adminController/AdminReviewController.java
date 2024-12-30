package com.itwillbs.project_dos.adminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminReviewController {
	@GetMapping("AdminReview")
	public String adminReview() {
		return "admin/admin_review/admin_review";
	}
	
	
	@GetMapping("ReviewAnswer")
	public String reviewAnswer() {
		return "admin/admin_review/review_answer";
	}
}
