package com.itwillbs.project_dos.adminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.project_dos.adminService.AdminUserService;
import com.itwillbs.project_dos.vo.AdminPageInfo;
import com.itwillbs.project_dos.vo.MemberVO;

@Controller
public class AdminUserController {
	
	@Autowired
	private AdminUserService userService;
	
	@GetMapping("AdminUser")
	public String adminUser(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		int listLimit = 6;
		int startRow = (pageNum - 1) * listLimit;
		int listCount = userService.getMemberListCount();
		int pageListLimit = 5;
		
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		if(maxPage == 0) {
			maxPage = 1;
		}
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		if(pageNum < 1 || pageNum > maxPage) {
			model.addAttribute("msg", "존재하지 않는 페이지");
			model.addAttribute("targetURL","AdminUser?pageNum=1");
			return "result/result";
		}
		
		AdminPageInfo pageInfo = new AdminPageInfo(listCount,pageListLimit,maxPage,startPage,endPage,pageNum);
		
		model.addAttribute("pageInfo",pageInfo);
		List<MemberVO> userList = userService.getUserList(startRow,listLimit);
		model.addAttribute("userList", userList);
		
		
		
		return "admin/admin_user/admin_user";
	}
	
	
	@GetMapping("UserUpdate")
	public String userUpdate() {
		return "admin/admin_user/user_update";
	}
}
