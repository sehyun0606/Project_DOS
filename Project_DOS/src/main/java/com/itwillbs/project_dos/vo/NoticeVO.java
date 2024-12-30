package com.itwillbs.project_dos.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeVO {
	private int board_num;
	private String board_title;
	private String board_content;
	private String board_file;
	private int readcount;
	private Timestamp board_date;
}
