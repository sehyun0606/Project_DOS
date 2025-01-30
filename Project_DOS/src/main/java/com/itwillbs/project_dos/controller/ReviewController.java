package com.itwillbs.project_dos.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.project_dos.adminService.AdminReviewService;
import com.itwillbs.project_dos.service.ReviewService;
import com.itwillbs.project_dos.vo.AdminPageInfo;
import com.itwillbs.project_dos.vo.ReviewVO;

@Controller
public class ReviewController {
	
	@Autowired
	private AdminReviewService adminReviewService;
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("Review")
	public String review(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "") String category, Model model, HttpSession session) {
		
		String id = (String)session.getAttribute("sId");
		
		int listLimit = 4;
		int startRow = (pageNum - 1) * listLimit;
		int listCount = adminReviewService.getAdminReviewListCount(category);
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
			model.addAttribute("targetURL","Review?pageNum=1");
			return "result/result";
		}
		
		AdminPageInfo pageInfo = new AdminPageInfo(listCount,pageListLimit,maxPage,startPage,endPage,pageNum);
		
		model.addAttribute("pageInfo",pageInfo);
		
		List<ReviewVO> reviewList = adminReviewService.getReviewList(startRow,listLimit,category);
		
		model.addAttribute("reviewList", reviewList);
		
		List<String> reviewIdxList = reviewService.getIdxList(id);
		
		model.addAttribute("idxList", reviewIdxList);
		
		return "review/review_list";
	}
	
	@ResponseBody
	@PostMapping("ReviewLike")
	public String reviewLike(HttpSession session, String review_idx) {
		
		String responseData = "false";
		
		String id = (String)session.getAttribute("sId");
		
		int insertCount = reviewService.insertReviewLike(id,review_idx);
		
		if(insertCount > 0) {
			reviewService.updateReviewLike(review_idx, "plus");
			responseData = "true";
			return responseData;
		}else {
			return responseData;
		}
		
	}
	
	@ResponseBody
	@PostMapping("ReviewUnLike")
	public String reviewUnLike(HttpSession session, String review_idx) {
		
		String responseData = "false";
		String id = (String)session.getAttribute("sId");
		
		int deleteCount = reviewService.deleteReviewLike(review_idx,id);
		
		if(deleteCount > 0) {
			reviewService.updateReviewLike(review_idx, "minus");
			responseData = "true";
			return responseData;
		}else {
			return responseData;
		}
	}
	
	@GetMapping("ReviewInfo")
	public String reviewInfo(int review_idx, Model model) {
		
		ReviewVO review = adminReviewService.getAdminreview(review_idx);
		
		model.addAttribute("review",review);
		
		return "review/review_info";
	}
	
	@GetMapping("ReviewWrite")
	public String reviewWriteForm() {
		
		return "review/review_write";
	}
	
	@PostMapping("ReviewSubmit")
	public String reviewSubmit(String reviewRating,ReviewVO review,HttpSession session ,Model model) {
		if(reviewRating.equals("")) {
			model.addAttribute("msg", "별점을 입력해주세요");
			return "result/result";
		}
		int stars = Integer.parseInt(reviewRating);
		String id = (String)session.getAttribute("sId");
		review.setMember_id(id);
		review.setReview_rating(stars);
		
		List<java.util.Date> history = reviewService.getReservationHistory(id);
		
		
		if(history.isEmpty()) {
			model.addAttribute("msg", "방문이 완료된 분들만 리뷰 작성이 가능합니다");
			return "result/result";
		}
		
		
		 java.util.Date oldestDate = Collections.min(history);
		 
		reviewService.updateReservationReviewStatus(oldestDate,id);
		
		int insertCount = reviewService.insertReview(review);
		
		if(insertCount > 0) {
			model.addAttribute("msg", "등록 성공");
			model.addAttribute("targetURL","Review");
			return "result/result";
		}else {
			model.addAttribute("msg", "등록 실패..");
			model.addAttribute("targetURL","Review");
			return "result/result";
		}
		
	}
}
