package com.itwillbs.project_dos.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.vo.NoticeVO;
import com.itwillbs.project_dos.vo.QuestionVO;

@Mapper
public interface NoticeMapper {

	int selectBoardListCount(
			@Param("searchType") String searchType, 
			@Param("searchKeyword") String searchKeyword);

	List<NoticeVO> selectNoticeList(
			@Param("searchType") String searchType, 
			@Param("searchKeyword") String searchKeyword,
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	NoticeVO selectBoardList(int board_num);

	void updateReadCount(NoticeVO noticeBoard);


	
}


