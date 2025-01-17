package com.itwillbs.project_dos.adminController;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.project_dos.adminService.AdminMenuService;
import com.itwillbs.project_dos.vo.MenuVO;

@Controller
public class AdminMenuController {
	@Autowired
	private AdminMenuService menuService;
	
	//업로드 경로
	private String virtualPath = "/resources/upload";
	
	@GetMapping("AdminMenu")
	public String adminMenu() {
		return"admin/admin_menu/admin_menu";
	}
	
	@GetMapping("AdminMenuList")
	public String adminMenuList(String menu ,Model model) {
		
		List<MenuVO> menuList = menuService.getMenuList(menu);
		
		model.addAttribute("menuList", menuList);
		
		return "admin/admin_menu/admin_menu_list";
	}
	
	@GetMapping("MenuAdd")
	public String menuAddForm() {
		return "admin/admin_menu/menu_add";
	}
	
	@PostMapping("MenuAdd")
	public String menuAdd(MenuVO menu, HttpSession session, Model model) {
		
		
		
		//파일 업로드 작업
		String realPath = getRealPath(session, virtualPath);
		String subDir = menu.getMenu_category();
		
		realPath += "/" + subDir;
		
		MultipartFile menuImg = menu.getMenuImg();
		
		
		menu.setMenu_img("");
		
		String imgName = "";
		
		if(!menuImg.getOriginalFilename().equals("")) {
			imgName = UUID.randomUUID().toString() + "_" + menuImg.getOriginalFilename();
			menu.setMenu_img(subDir + "/" + imgName);
		}
		
		int insertCount = menuService.registMenu(menu);
		
		if (insertCount > 0) {
			try {
				if(!menuImg.getOriginalFilename().equals("")) {
					menuImg.transferTo(new File(realPath, imgName));
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "redirect:AdminMenu";
		} else {
			model.addAttribute("msg","메뉴 등록 실패");
			return "result/result";
		}
	}
	
	//파일 업로드 및 다운로드를 위한 유틸리티 메서드
	//파일 업로드에 사용될 실제 업로드 디렉토리 경로를 리턴하는 메서드
	private String getRealPath(HttpSession session, String virturalPath) {
		return session.getServletContext().getRealPath(virturalPath);
	}
	
	//파일 업로드 시점에 맞는 날짜별 서브디렉토리 생성
	private String createDirectories(String realPath) {
		
		LocalDate today = LocalDate.now();
		String datePattern = "yyyy/MM/dd";
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern(datePattern);
		
		String subDir = today.format(dtf);
		realPath += "/" + subDir;
		
		try {
			Path path = Paths.get(realPath);
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return subDir;
	}
}










