package com.itwillbs.project_dos.adminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminServiceController {
	@GetMapping("AdminNotice")
	public String adminNotice() {
		return "admin/admin_service/admin_notice";
	}
	
	
	@GetMapping("NoticeForm")
	public String noticeForm() {
		return "admin/admin_service/notice_form";
	}
}
