package com.itwillbs.project_dos.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.project_dos.adminService.AdminProductService;
import com.itwillbs.project_dos.vo.ProductVO;

@Controller
public class ShopController {
	
	@Autowired
	private AdminProductService adminProductService;
	
	@GetMapping("Merch")
	public String merch(Model model) {
		
		List<ProductVO> dollList = adminProductService.getDollList();
		
		model.addAttribute("dollList", dollList);
		
		List<ProductVO> tumblerList = adminProductService.getTumblerList();
		
		model.addAttribute("tumblerList", tumblerList);
		
		List<ProductVO> dishList = adminProductService.getDishList();
		
		model.addAttribute("dishList", dishList);
		
		return "shop/merch";
	}
	
}
