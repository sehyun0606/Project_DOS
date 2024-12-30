package com.itwillbs.project_dos.adminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminMenuController {
	@GetMapping("AdminMenu")
	public String adminMenu() {
		return"admin/admin_menu/admin_menu";
	}
	
	
	@GetMapping("MenuAdd")
	public String menuAdd() {
		return "admin/admin_menu/menu_add";
	}
}
