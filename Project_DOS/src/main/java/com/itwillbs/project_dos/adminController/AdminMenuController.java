package com.itwillbs.project_dos.adminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.project_dos.adminService.AdminMenuService;
import com.itwillbs.project_dos.vo.MenuVO;

@Controller
public class AdminMenuController {
	@Autowired
	private AdminMenuService menuService;
	
	@GetMapping("AdminMenu")
	public String adminMenu() {
		return"admin/admin_menu/admin_menu";
	}
	
	@GetMapping("AdminMenuList")
	public String adminMenuList(String menu ,Model model) {
		
		List<MenuVO> menuList = menuService.getMenuList(menu);
		
		return "admin/admin_menu/admin_menu_list";
	}
	
	@GetMapping("MenuAdd")
	public String menuAdd() {
		return "admin/admin_menu/menu_add";
	}
}
