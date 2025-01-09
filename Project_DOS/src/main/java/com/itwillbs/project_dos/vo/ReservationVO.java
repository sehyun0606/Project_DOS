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
	private Date reservatrion_date;
	private String reservation_time;
	private int people_count;
	private int table_num;
	private int reservation_status;
}
