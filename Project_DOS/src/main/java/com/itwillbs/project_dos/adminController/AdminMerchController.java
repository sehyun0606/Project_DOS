package com.itwillbs.project_dos.adminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminMerchController {
	@GetMapping("AdminMerch")
	public String adminMerch() {
		return "admin/admin_merch/admin_merch";
	}
	
	
	@GetMapping("MerchEdit")
	public String merchEdit() {
		return "admin/admin_merch/merch_edit";
	}
	
	
	@GetMapping("AdminMealkit")
	public String adminMealkit() {
		return "admin/admin_merch/admin_mealkit";
	}
	
	
	@GetMapping("MealkitEdit")
	public String mealkitEdit() {
		return "admin/admin_merch/mealkit_edit";
	}
}
