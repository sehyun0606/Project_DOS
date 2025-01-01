package com.itwillbs.project_dos.service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnaController {
		@GetMapping("/Question")
		public String qnaboard() {
			return "service/qna_board";
		}
	}

