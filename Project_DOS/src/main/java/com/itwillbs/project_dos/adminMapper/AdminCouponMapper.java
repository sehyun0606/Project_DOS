package com.itwillbs.project_dos.adminMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.project_dos.vo.CouponVO;

@Mapper
public interface AdminCouponMapper {

	List<CouponVO> selectCouponList();

	int insertCoupon(CouponVO couponVO);

	int deleteCoupon(String coupon_name);

}
