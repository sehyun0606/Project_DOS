package com.itwillbs.project_dos.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {

	private int member_idx;
	private String member_id;
	private String member_passwd;
	private String member_name;
	private String member_phone;
	private String member_email;
	private String member_email_auth;
	private String member_birth;
	private Date member_reg_date;
	private Date member_withdraw_date;
	private int member_status;
	private String membership;
	private String member_post_code;
	private String member_address1;
	private String member_address2; 
}
