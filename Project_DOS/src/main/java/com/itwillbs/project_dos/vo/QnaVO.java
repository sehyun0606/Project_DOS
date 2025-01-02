package com.itwillbs.project_dos.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaVO {
	private int qna_num;
	private String qna_type;
	private String qna_title;
	private String member_id;
	private String qna_content;
	private int qna_readcount;
	private Timestamp qna_date;
	private String request_status;
	private String request_content;
	private Timestamp request_date;
}
