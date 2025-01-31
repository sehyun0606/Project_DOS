package com.itwillbs.project_dos.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReservationVO {
	private int reservation_idx;
	private String member_id;
	private String member_phone;
	private Date reservation_date;
	private String reservation_time;
	private String people_count;
	private int table_num;
	private int reservation_status;
	private String review_status;
}
