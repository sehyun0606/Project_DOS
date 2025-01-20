package com.itwillbs.project_dos.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.sql.Timestamp;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PerchaseHistoryVO {
	private String merchant_uid;
	private String member_id;
	private String member_phone;
	private String product_name;
	private int pay_amount;
	private String pay_method;
	private Timestamp pay_date;
	
}
	    
	    
	    

