package com.itwillbs.project_dos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.mapper.ReviewMapper;
import com.itwillbs.project_dos.vo.ReviewVO;

@Service
public class ReviewService {
	@Autowired
	private ReviewMapper reviewMapper;

	public int insertReviewLike(String id, String review_idx) {
		return reviewMapper.insertReviewLike(id,review_idx);
	}

	public void updateReviewLike(String review_idx, String sign) {
		reviewMapper.updateReviewLike(review_idx,sign);
	}

	public List<String> getIdxList(String id) {
		return reviewMapper.selectIdxList(id);
	}

	public int deleteReviewLike(String review_idx, String id) {
		return reviewMapper.deleteReviewLike(id,review_idx);
	}

	public List<String> getReservationHistory(String id) {
		return reviewMapper.selectReservationHistory(id);
	}

	public int insertReview(ReviewVO review) {
		return reviewMapper.insertReview(review);
	}

}
