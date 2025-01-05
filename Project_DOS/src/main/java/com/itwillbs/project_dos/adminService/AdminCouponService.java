package com.itwillbs.project_dos.adminService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.adminMapper.AdminCouponMapper;
import com.itwillbs.project_dos.vo.CouponVO;

@Service
public class AdminCouponService {
	
	@Autowired
	private AdminCouponMapper couponMapper;
	
	public List<CouponVO> getCouponList() {
		return couponMapper.selectCouponList();
	}

	public int createCoupon(CouponVO couponVO) {
		return couponMapper.insertCoupon(couponVO);
	}

	public int deleteCoupon(String coupon_name) {
		return couponMapper.deleteCoupon(coupon_name);
	}


}
