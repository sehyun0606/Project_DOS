package com.itwillbs.project_dos.adminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminUserController {
	@GetMapping("AdminUser")
	public String adminUser() {
		return "admin/admin_user/admin_user";
	}
	
	
	@GetMapping("UserUpdate")
	public String userUpdate() {
		return "admin/admin_user/user_update";
	}
}
