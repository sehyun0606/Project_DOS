package com.itwillbs.project_dos.adminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.project_dos.adminService.AdminCouponService;
import com.itwillbs.project_dos.vo.CouponVO;

@Controller
public class AdminCouponController {
	
	@Autowired
	private AdminCouponService couponService;
	
	//쿠폰 리스트 불러오는 로직
	@GetMapping("AdminCoupon")
	public String adminCoupon(Model model) {
		
		List<CouponVO> couponList = couponService.getCouponList();
		System.out.println(couponList);
		model.addAttribute("couponList", couponList);
		
		return "admin/admin_coupon/admin_coupone";
	}
	
	//쿠폰 생성 로직
	@PostMapping("CouponCreate")
	public String couponCreate(CouponVO couponVO, Model model) {
		int insertCount = couponService.createCoupon(couponVO);
		
		if(insertCount > 0) {
			return "redirect:/AdminCoupon";
		}else {
			model.addAttribute("msg", "쿠폰 등록에 실패하였습니다..");
			return "result/result";
		}
	}
	
	//쿠폰 삭제 로직
	@GetMapping("AdminCouponDelete")
	public String adminCouponDelete(String coupon_name) {
		
		int deleteCount = couponService.deleteCoupon(coupon_name);
		
		return "redirect:/AdminCoupon";
	}
}





