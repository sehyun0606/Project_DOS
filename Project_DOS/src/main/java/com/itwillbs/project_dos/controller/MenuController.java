package com.itwillbs.project_dos.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.project_dos.service.MenuService;
import com.itwillbs.project_dos.vo.MenuVO;

@Controller  
public class MenuController {

    @Autowired
    private MenuService menuService;  // 서비스 연결

    @GetMapping("Menu")
    public String menu(Model model) {
    	
    	List<MenuVO> menu = menuService.getMenuList();
    	List<MenuVO> set = new ArrayList<MenuVO>();
    	List<MenuVO> steak = new ArrayList<MenuVO>();
    	List<MenuVO> pasta = new ArrayList<MenuVO>();
    	List<MenuVO> salad = new ArrayList<MenuVO>();
    	List<MenuVO> rizPhi = new ArrayList<MenuVO>();
    	List<MenuVO> drink = new ArrayList<MenuVO>();
    	List<MenuVO> side = new ArrayList<MenuVO>();
    	
    	for(MenuVO menu1 : menu) {
    		if(menu1.getMenu_category().equals("set")) {
    			set.add(menu1);
    		}else if(menu1.getMenu_category().equals("steak")) {
    			steak.add(menu1);
    		}else if(menu1.getMenu_category().equals("pasta")) {
    			pasta.add(menu1);
    		}else if(menu1.getMenu_category().equals("salad")) {
    			salad.add(menu1);
    		}else if(menu1.getMenu_category().equals("riz&phi")) {
    			rizPhi.add(menu1);
    		}else if(menu1.getMenu_category().equals("drink")) {
    			drink.add(menu1);
    		}else if(menu1.getMenu_category().equals("side")) {
    			side.add(menu1);
    		}
    	}
    	
    	model.addAttribute("set", set);
    	model.addAttribute("steak",steak);
    	model.addAttribute("pasta", pasta);
    	model.addAttribute("salad", salad);
    	model.addAttribute("rizAphi", rizPhi);
    	model.addAttribute("drink", drink);
    	model.addAttribute("side", side);
    	
    	return "menu/menu";
    }
}