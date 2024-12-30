package com.itwillbs.project_dos.adminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminCouponController {
	@GetMapping("AdminiCoupon")
	public String adminCoupon() {
		return "admin/admin_coupon/admin_coupone";
	}
}
