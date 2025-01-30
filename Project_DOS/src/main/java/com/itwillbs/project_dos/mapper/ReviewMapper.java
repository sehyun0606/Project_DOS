package com.itwillbs.project_dos.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.project_dos.vo.ReviewVO;

@Mapper
public interface ReviewMapper {

	int insertReviewLike(@Param("id") String id,@Param("review_idx") String review_idx);

	void updateReviewLike(@Param("review_idx") String review_idx, @Param("sign") String sign);

	List<String> selectIdxList(String id);

	int deleteReviewLike(@Param("id") String id,@Param("review_idx") String review_idx);

	List<java.util.Date> selectReservationHistory(String id);

	int insertReview(ReviewVO review);

	int updateReservationReviewStatus(@Param("oldestDate") java.util.Date oldestDate, @Param("id") String id);

}
