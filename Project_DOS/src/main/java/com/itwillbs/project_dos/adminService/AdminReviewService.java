package com.itwillbs.project_dos.adminService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.adminMapper.AdminReviewMapper;
import com.itwillbs.project_dos.vo.ReviewVO;

@Service
public class AdminReviewService {
	
	@Autowired
	private AdminReviewMapper reviewMapper;
	
	//리뷰 목록
	public List<ReviewVO> getReviewList(int startRow, int listLimit) {
		return reviewMapper.selectReviewList(startRow,listLimit);
	}

	//리뷰 리스트 카운터
	public int getAdminReviewListCount() {
		return reviewMapper.selectAdminReviewCount();
	}
	//답변 안한 리뷰 리스트 카운터
	public int getAdminnoRequestReviewCount() {
		return reviewMapper.selecetNoRequestReviewCount();
	}
	
	//리뷰 상세 페이지 포워딩
	public ReviewVO getAdminreview(int review_idx) {
		return reviewMapper.selectAdminReview(review_idx);
	}
	
	//답변안한 리뷰 목록
	public List<ReviewVO> getNoRequestReviewList(int startRow, int listLimit) {
		return reviewMapper.selectNoRequestReviewList(startRow,listLimit);
	}
	
	//날짜별 리뷰 목록
	public List<ReviewVO> getReviewListByDate(int startRow, int listLimit) {
		return reviewMapper.selectReviewListByDate(startRow,listLimit);
	}
	
	//별점순 리뷰 목록
	public List<ReviewVO> getReviewListByStar(int startRow, int listLimit) {
		return reviewMapper.selectReviewListByStar(startRow,listLimit);
	}

	public List<ReviewVO> getReviewListByLike(int startRow, int listLimit) {
		return reviewMapper.selectReviewListByLike(startRow,listLimit);
	}

	public int deleteReview(String review_idx) {
		return reviewMapper.deleteReview(review_idx);
	}


}
