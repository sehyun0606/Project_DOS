package com.itwillbs.project_dos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.mapper.NoticeMapper;
import com.itwillbs.project_dos.mapper.QnaMapper;
import com.itwillbs.project_dos.vo.NoticeVO;
import com.itwillbs.project_dos.vo.QuestionVO;

@Service
public class NoticeService {
	@Autowired
	private NoticeMapper mapper;

	public int getBoardListCount(String searchType, String searchKeyword) {
		return mapper.selectBoardListCount(searchType,searchKeyword);
	}

	public List<NoticeVO> getNoticeList(String searchType, String searchKeyword, int startRow, int listLimit) {
		return mapper.selectNoticeList(searchType, searchKeyword, startRow, listLimit);
	}

	public NoticeVO getBoardList(int board_num, boolean readCount) {
		NoticeVO noticeBoard = mapper.selectBoardList(board_num);
		
		//조회 결과가 존재하고, 조회수 증가를 수행해야할 경우
		if(noticeBoard != null && readCount) {
			mapper.updateReadCount(noticeBoard);
		}
		return noticeBoard; 
	}


	
}

