package com.itwillbs.project_dos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
		@GetMapping("/Notice")
		public String noticeboard() {
			return "service/notice_board";
		}
	}

