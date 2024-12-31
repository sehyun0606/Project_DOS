package com.itwillbs.project_dos.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminNoticePageInfo {
	private int listCount;
	private int pageListLimit;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int pageNum;
}
