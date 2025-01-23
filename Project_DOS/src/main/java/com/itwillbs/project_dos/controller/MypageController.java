package com.itwillbs.project_dos.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.project_dos.adminService.AdminReservationService;
import com.itwillbs.project_dos.service.MyPageService;
import com.itwillbs.project_dos.vo.AdminPageInfo;
import com.itwillbs.project_dos.vo.MemberVO;
import com.itwillbs.project_dos.vo.NoticeVO;
import com.itwillbs.project_dos.vo.QuestionVO;
import com.itwillbs.project_dos.vo.ReservationVO;

@Controller
public class MypageController {
	
	@Autowired
	private MyPageService myPageService;
	
	
	@GetMapping("Mypage")
	public String myPage(HttpSession session,Model model) {
		
		String id = (String) session.getAttribute("sId");
		
		MemberVO member = myPageService.getMyProfile(id);
		
		model.addAttribute("member", member);
		
		List<ReservationVO> myReservation = myPageService.getMyReservationlist(id);
		
		model.addAttribute("reservationList", myReservation);
		
		return "mypage/profile";
	}
	
	@GetMapping("MyReservationEdit")
	public String myReservationEdit(String reservation_idx,Model model) {
		
		ReservationVO myreservation = myPageService.getMyReservation(reservation_idx);
		
		model.addAttribute("reservation",myreservation);
		
		return "mypage/reservation_edit";
	}
	
	@GetMapping("MyReservationTableEdit")
	public String myReservationTableEdit() {
		return "mypage/reservation_table_edit";
	}
	
	@GetMapping("MyQuestion")
	public String myQuestion(@RequestParam(defaultValue = "1") int pageNum, Model model,HttpSession session) {
		
		String id = (String) session.getAttribute("sId");
		
		int listLimit = 6;
		int startRow = (pageNum - 1) * listLimit;
		int listCount = myPageService.getMyNoticeListCount(id);
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
			model.addAttribute("targetURL","MyQuestion?pageNum=1");
			return "result/result";
		}
		
		AdminPageInfo pageInfo = new AdminPageInfo(listCount,pageListLimit,maxPage,startPage,endPage,pageNum);
		
		model.addAttribute("pageInfo",pageInfo);
		List<QuestionVO> questionList = myPageService.getQuestionList(startRow,listLimit,id);
		model.addAttribute("questionList", questionList);
		return "mypage/my_question";
	}
	
	@GetMapping("MyQuestionEdit")
	public String myQuestionEdit(int qna_num, Model model) {
		
		QuestionVO question = myPageService.getMyQuestionDetail(qna_num);
		
		model.addAttribute("question",question);
		
		return "mypage/myQuestion_edit";
	}
	
	@PostMapping("UpdateQna")
	public String updateQna(QuestionVO question) {
		
		int updateCount = myPageService.editMyQuestion(question);
		
		return "redirect:/MyQuestion";
	}
}







