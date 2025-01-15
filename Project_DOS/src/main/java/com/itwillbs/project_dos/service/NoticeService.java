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

	public int getBoardListCount() {
		return mapper.selectBoardListCount();
	}

	public List<NoticeVO> getNoticeList(int startRow, int listLimit) {
		return mapper.selectNoteceList(startRow, listLimit);
	}

	public NoticeVO getBoardList(int board_num) {
		return mapper.selectBoardList(board_num);
	}


	
}

