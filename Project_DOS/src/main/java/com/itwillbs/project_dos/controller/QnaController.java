package com.itwillbs.project_dos.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnaController {
		@Autowired
		private QnaController service;
		@GetMapping("/Question")
		public String qnaboard() {
			return "service/qna_board";
		}
		
		@GetMapping("/Faq")
		public String faqview() {
			return "service/faq_view";
		}
	
		@GetMapping("/Qna_write")
		public String qnawrite() {
			return "service/qna_write";
		}
	}


