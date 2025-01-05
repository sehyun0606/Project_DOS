package com.itwillbs.project_dos.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CouponVO {
	private String coupon_name;
	private String discount_rate;
	private Timestamp coupon_date;
}
