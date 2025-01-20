package com.itwillbs.project_dos.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.mapper.QnaMapper;
import com.itwillbs.project_dos.vo.FAQVO;
import com.itwillbs.project_dos.vo.QuestionVO;

@Service
public class QnaService {
	@Autowired
	private QnaMapper mapper;

	public int getQnaListCount(String searchType, String searchKeyword) {
		return mapper.selectQnaListCount(searchType,searchKeyword);
	}

	public List<QuestionVO> getQnaList(String searchType, String searchKeyword, int startRow, int listLimit) {
		return mapper.selectQnaList(searchType, searchKeyword, startRow, listLimit);
	}

	public FAQVO getfaq() {
		return mapper.selectFaq();
	}


	public int insertQnaBoard(QuestionVO qna) {
		return mapper.insertQnaBoard(qna);
	}


	public int qnaModify(QuestionVO qna) {
		return mapper.updateQnaBoard(qna);
	}

	public QuestionVO getBoard(int qna_num) {
		return mapper.selectBoard(qna_num);
	}

	
}

