package com.itwillbs.project_dos.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.project_dos.service.MenuService;

@Controller  // 컨트롤러 선언
@RequestMapping("/menu")  // 기본 경로 설정: /menu
public class MenuController {

    @Autowired
    private MenuService menuService;  // 서비스 연결

    // 메뉴 리스트 페이지
    @GetMapping("/list")
    public String menuList(Model model) {
        // 서비스에서 메뉴 리스트 가져오기
        model.addAttribute("menuList", menuService.getMenuList());
        // menu/menu.jsp 페이지로 이동
        return "menu/menu";  
    }

    // 예약 페이지
    @GetMapping("/reserve")
    public String reserveMenu() {
        // menu/reserve.jsp 페이지로 이동
        return "menu/reserve";
    }

    // 메뉴 확인 페이지
    @GetMapping("/check")
    public String checkMenu() {
        // menu/check.jsp 페이지로 이동
        return "menu/check";
    }

    // 메뉴 확인 완료 페이지
    @GetMapping("/confirm")
    public String confirmMenu() {
        // menu/confirm.jsp 페이지로 이동
        return "menu/confirm";
    }
}