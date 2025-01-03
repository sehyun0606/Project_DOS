package com.itwillbs.project_dos.adminController;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.project_dos.adminService.AdminServiceService;
import com.itwillbs.project_dos.vo.AdminPageInfo;
import com.itwillbs.project_dos.vo.FAQVO;
import com.itwillbs.project_dos.vo.NoticeVO;
import com.itwillbs.project_dos.vo.QuestionVO;

@Controller
public class AdminServiceController {
	@Autowired
	private AdminServiceService adminService;
	//공지사항 게시판 페이징 및 목록 불러오기 로직
	@GetMapping("AdminNotice")
	public String adminNotice(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		int listLimit = 6;
		int startRow = (pageNum - 1) * listLimit;
		int listCount = adminService.getAdminNoticeListCount();
		int pageListLimit = 5;
		
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		if(maxPage == 0) {
			maxPage = 1;
		}
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		if(pageNum < 1 || pageNum > maxPage) {
			model.addAttribute("msg", "존재하지 않는 페이지");
			model.addAttribute("targetURL","AdminNotice?pageNum=1");
			return "result/result";
		}
		
		AdminPageInfo pageInfo = new AdminPageInfo(listCount,pageListLimit,maxPage,startPage,endPage,pageNum);
		
		model.addAttribute("pageInfo",pageInfo);
		List<NoticeVO> noticeList = adminService.getNoticeList(startRow,listLimit);
		model.addAttribute("noticeList", noticeList);
		
		
		return "admin/admin_service/admin_notice";
	}
	
	
	@GetMapping("NoticeForm")
	public String noticeForm() {
		return "admin/admin_service/notice_form";
	}
	
	//공지사항 등록 로직
	@PostMapping("NoticeForm")
	public String writeNotice(NoticeVO notice, Model model) {
		
		notice.setBoard_readcount(0);
		
		int insertCount = adminService.registBoard(notice);
		
		if(insertCount == 1) {
			model.addAttribute("msg","공지사항 등록 성공");
			model.addAttribute("targetURL", "AdminNotice");
			return "result/result";
		}else {
			model.addAttribute("msg","등록 실패");
			return "result/result";
		}
	}
	//공지사항 수정폼으로 페이징
	@GetMapping("AdminNoticeEdit")
	public String noticeEdit(int board_num, Model model) {
		NoticeVO notice = adminService.getAdminNotice(board_num);
		if(notice == null) {
			model.addAttribute("msg", "존재하지 않는 게시물입니다");
			return "result/result";
		}
		model.addAttribute("notice",notice);
		return "admin/admin_service/notice_edit";
	}
	//공지사항 수정 로직
	@PostMapping("AdminNoticeEdit")
	public String editNotice(int board_num,NoticeVO notice, Model model) {
		
		notice.setBoard_num(board_num);
		
		int updateCount = adminService.editNotice(notice);
		
		if(updateCount > 0) {
			model.addAttribute("msg","공지사항 수정 성공");
			model.addAttribute("targetURL", "AdminNotice");
			return "result/result";
		}else {
			model.addAttribute("msg", "공지사항 수정 실패!");
			return "result/result";
		}
		
	}
	//공지사항 삭제 로직
	@GetMapping("AdminNoticeDelete")
	public String noticeDelete(int board_num, Model model) {
		
		int deleteCount = adminService.deleteNotice(board_num);
		if(deleteCount > 0) {
			return "redirect:/AdminNotice";
		}else {
			model.addAttribute("msg", "삭제 실패..");
			return "result/result";
		}
	}
	
	//공지사항 필터링 및 검색 로직
	@GetMapping("AdminNoticeSearch")
	public String adminNoticeSearch(@RequestParam Map<String, String> map, Model model) {
		
		if(map.get("searchType").equals("name")) {
			List<NoticeVO> noticeList = adminService.searchNoticeListByName("%"+map.get("searchQuery")+"%");
			model.addAttribute("noticeList", noticeList);
		}else if(map.get("searchType").equals("date")) {
			List<NoticeVO> noticeList = adminService.searchNoticeListByDate("%"+map.get("searchQuery")+"%");
			model.addAttribute("noticeList", noticeList);
		}else {
			model.addAttribute("msg","잘못된 접근!!");
			return "result/result";
		}
		
		return "admin/admin_service/admin_notice_search";
	}
	
	//문의사항 페이징 및 목록 조회 로직
	@GetMapping("AdminQuestion")
	public String adminQuestion(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		int listLimit = 4;
		int startRow = (pageNum - 1) * listLimit;
		int listCount = adminService.getAdminQuestionListCount();
		int pageListLimit = 5;
		
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		if(maxPage == 0) {
			maxPage = 1;
		}
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		if(pageNum < 1 || pageNum > maxPage) {
			model.addAttribute("msg", "존재하지 않는 페이지");
			model.addAttribute("targetURL","AdminQuestion?pageNum=1");
			return "result/result";
		}
		
		AdminPageInfo pageInfo = new AdminPageInfo(listCount,pageListLimit,maxPage,startPage,endPage,pageNum);
		
		model.addAttribute("pageInfo",pageInfo);
		//답변유무 상관없는 question 목록 로직
		List<QuestionVO> QuestionList = adminService.getQuestionList(startRow,listLimit);
		model.addAttribute("questionList", QuestionList);
		
		//답변이 아직 안달린 question 목록 로직
		List<QuestionVO> NotAnsweredQuestionList = adminService.getNotAnsweredQuestionList();
		model.addAttribute("NotAnsweredQuestionList", NotAnsweredQuestionList);
		
		return "admin/admin_service/admin_question";
	}
	
	//문의사항 답변폼으로 페이징
	@GetMapping("AdminQuestionRequest")
	public String adminQuestionRequestForm(int qna_num, Model model) {
		QuestionVO question = adminService.getAdminQuestion(qna_num);
		if(question == null) {
			model.addAttribute("msg", "존재하지 않는 게시물입니다");
			return "result/result";
		}
		model.addAttribute("question",question);
		
		
		return "admin/admin_service/admin_question_request";
	}
	
	
	//문의사항 답변 로직
	@PostMapping("AdminQuestionRequest")
	public String adminQuestionRequest(String request_content, int qna_num ,Model model) {
		
		int updateCount = adminService.requestQuestion(request_content,qna_num);
		
		if(updateCount == 0) {
			model.addAttribute("msg", "답변 실패...");
			return "result/result";
		}else {
			model.addAttribute("msg","문의사항 답변 성공");
			model.addAttribute("targetURL", "AdminQuestion");
			return "result/result";
		}
		
		
	}
	
	//문의사항 답변 수정 포워딩
	@GetMapping("AdminQuestionEdit")
	public String adminQuestionEditForm(int qna_num, Model model) {
		
		QuestionVO question = adminService.getAdminQuestion(qna_num);
		
		if(question == null) {
			model.addAttribute("msg", "존재하지 않는 게시물입니다");
			return "result/result";
		}
		model.addAttribute("question",question);
		
		
		return "admin/admin_service/admin_question_edit";
	}
	
	//문의사항 답변 수정 로직
	@PostMapping("AdminQuestionEdit")
	public String adminQuestionEditForm(String request_content, int qna_num ,Model model) {
		int updateCount = adminService.requestQuestion(request_content,qna_num);
		
		if(updateCount == 0) {
			model.addAttribute("msg", "답변 실패...");
			return "result/result";
		}else {
			model.addAttribute("msg","답변 수정 성공");
			model.addAttribute("targetURL", "AdminQuestion");
			return "result/result";
		}
	}
	//문의사항 삭제 기능
	@GetMapping("AdminQuestionDelete")
	public String adminQuestionDelete(int qna_num, Model model) {
		
		int deleteCount = adminService.deleteQuestion(qna_num);
		
		if(deleteCount > 0) {
			return "redirect:/AdminQuestion";
		}else {
			model.addAttribute("msg", "삭제 실패..");
			return "result/result";
		}
		
	}
	
	
	//문의사항 검색 기능
	@GetMapping("AdminQuestionSearch")
	public String adminQuestionSerch(@RequestParam Map<String, String> map, Model model) {
		
		String searchQuery = "%"+map.get("searchQuery")+"%";
		List<QuestionVO> questionList = null;
		if(map.get("searchType").equals("name")) {
			questionList = adminService.searchQuestionListByName(searchQuery);
		}else if(map.get("searchType").equals("date")) {
			questionList = adminService.searchQuestionListByDate(searchQuery);
		}else if(map.get("searchType").equals("id")){
			questionList = adminService.searchQuestionListByID(searchQuery);
		}else if(map.get("searchType").equals("category")) {
			questionList = adminService.searchQuestionListByCategory(searchQuery);
		}
		else {
			model.addAttribute("msg","잘못된 접근!!");
			return "result/result";
		}
		model.addAttribute("questionList", questionList);
		
		return "admin/admin_service/admin_question_search";
	}
	
	@GetMapping("AdminFAQ")
	public String adminFAQForm( Model model) {
		
		FAQVO faq = adminService.getFAQ();
		
		model.addAttribute("FaqList", faq);
		
		
		return "admin/admin_service/admin_faq";
	}
	
	@PostMapping("AdminFAQ")
	public String adminFAQ(FAQVO faqVO, Model model) {
		
		int updateCount = adminService.updateFAQ(faqVO);
		
		if(updateCount > 0) {
			model.addAttribute("msg", "faq 수정 성공!");
			model.addAttribute("targetURL", "AdminNotice");
			return "result/result";
		}else {
			model.addAttribute("msg", "faq 수정 실패..");
			return "result/result";
		}
		
	}
	
}






