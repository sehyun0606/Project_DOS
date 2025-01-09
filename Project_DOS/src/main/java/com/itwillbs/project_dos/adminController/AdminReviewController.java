package com.itwillbs.project_dos.adminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.project_dos.adminService.AdminReviewService;
import com.itwillbs.project_dos.vo.AdminPageInfo;
import com.itwillbs.project_dos.vo.ReviewVO;

@Controller
public class AdminReviewController {
	
	@Autowired
	private AdminReviewService reviewService;
	
	//총 리뷰 리스트 불러오는 로직
	@GetMapping("AdminReview")
	public String adminReview(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		int listLimit = 4;
		int startRow = (pageNum - 1) * listLimit;
		int listCount = reviewService.getAdminReviewListCount();
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
			model.addAttribute("targetURL","AdminReview?pageNum=1");
			return "result/result";
		}
		
		AdminPageInfo pageInfo = new AdminPageInfo(listCount,pageListLimit,maxPage,startPage,endPage,pageNum);
		
		model.addAttribute("pageInfo",pageInfo);
		
		List<ReviewVO> reviewList = reviewService.getReviewList(startRow,listLimit);
		
		model.addAttribute("reviewList", reviewList);
		
		
		
		return "admin/admin_review/admin_review";
	}
	
	//리뷰 상세보기
	@GetMapping("ReviewAnswer")
	public String reviewAnswerForm(int review_idx, Model model) {
		
		ReviewVO review = reviewService.getAdminreview(review_idx);
		
		model.addAttribute("review", review);
		
		return "admin/admin_review/review_answer";
	}
	
	//리뷰 답변하기
	@PostMapping("ReviewAnswer")
	public String reviewAnswer(String answer_content,int review_idx) {
		
		
		return "redirect:/AdminReview";
	}
	
	
	//리뷰 필터링 기능
	@GetMapping("AdminReviewFilter")
	public String reviewFilterResult(String category, @RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		
		int listCount = 0;
		//카테고리 경우에 따라 수행되는 페이징
		if(category.equals("noRequest")) {
			listCount = reviewService.getAdminnoRequestReviewCount();
		}else {
			listCount = reviewService.getAdminReviewListCount();
		}
		
		int listLimit = 4;
		int startRow = (pageNum - 1) * listLimit;
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
			model.addAttribute("targetURL","AdminReview?pageNum=1");
			return "result/result";
		}
		
		AdminPageInfo pageInfo = new AdminPageInfo(listCount,pageListLimit,maxPage,startPage,endPage,pageNum);
		
		model.addAttribute("pageInfo",pageInfo);
		
		List<ReviewVO> reviewList = null;
		//카테고리 경우에 따라 수행되는 로직
		if(category.equals("all")) {
			reviewList = reviewService.getReviewList(startRow, listLimit);
		}else if(category.equals("noRequest")) {
			reviewList = reviewService.getNoRequestReviewList(startRow,listLimit);
		}else if(category.equals("date")) {
			reviewList = reviewService.getReviewListByDate(startRow,listLimit);
		}else if(category.equals("star")) {
			reviewList = reviewService.getReviewListByStar(startRow,listLimit);
		}else if(category.equals("like")) {
			reviewList = reviewService.getReviewListByLike(startRow,listLimit);
		}
		
		
		model.addAttribute("filterReviewList", reviewList);
		model.addAttribute("category",category);
		
		
		return "admin/admin_review/filter_result";
	}
}










