package com.itwillbs.project_dos.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ReviewMapper {

	int insertReviewLike(@Param("id") String id,@Param("review_idx") String review_idx);

	void updateReviewLike(@Param("review_idx") String review_idx, @Param("sign") String sign);

	List<String> selectIdxList(String id);

	int deleteReviewLike(@Param("id") String id,@Param("review_idx") String review_idx);

	List<String> selectReservationHistory(String id);

}
