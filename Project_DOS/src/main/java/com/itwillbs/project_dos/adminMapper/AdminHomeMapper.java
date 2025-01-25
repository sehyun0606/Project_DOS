package com.itwillbs.project_dos.adminMapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminHomeMapper {
	
	List<Map<String, Object>> selectMembershipList();

	Map<String, String> selectResrevationMap();

	String selectReviewAVG();

	String getNewReview();

	String getNewQna();

}
