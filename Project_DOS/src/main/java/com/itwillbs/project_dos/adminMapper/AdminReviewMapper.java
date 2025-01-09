package com.itwillbs.project_dos.adminMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.project_dos.vo.ReviewVO;

@Mapper
public interface AdminReviewMapper {
	//리뷰목록
	List<ReviewVO> selectReviewList(
			@Param("startRow")int startRow,
			@Param("listLimit")int listLimit);
	
	//리뷰 목록 카운터
	int selectAdminReviewCount();
	
	//답변 안한 리뷰 목록 카운터
	int selecetNoRequestReviewCount();
	
	//리뷰 상세 조회
	ReviewVO selectAdminReview(int review_idx);
	
	//답변 안한 리뷰 목록
	List<ReviewVO> selectNoRequestReviewList(
			@Param("startRow")int startRow,
			@Param("listLimit")int listLimit);
	
	//날짜순 리뷰 목록
	List<ReviewVO> selectReviewListByDate(
			@Param("startRow")int startRow,
			@Param("listLimit")int listLimit);

	//별점순 리뷰 목록
	List<ReviewVO> selectReviewListByStar(
			@Param("startRow")int startRow,
			@Param("listLimit")int listLimit);
	
	//좋아요순 리뷰 목록
	List<ReviewVO> selectReviewListByLike(
			@Param("startRow")int startRow,
			@Param("listLimit")int listLimit);


}
