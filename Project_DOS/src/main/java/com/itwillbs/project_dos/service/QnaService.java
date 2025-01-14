package com.itwillbs.project_dos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.mapper.QnaMapper;
import com.itwillbs.project_dos.vo.FAQVO;
import com.itwillbs.project_dos.vo.QuestionVO;

@Service
public class QnaService {
	@Autowired
	private QnaMapper mapper;

	public int getQnaListCount() {
		return mapper.selectQnaListCount();
	}

	public List<QuestionVO> getQnaList(int startRow, int listLimit) {
//		// 임시) @Value 어노테이션으로 포함시킨 속성값 확인
//		System.out.println("test_data(service) : " + test_data);
		// -------------------------------------------------
		
		// BoardMapper - selectQnaList()
		return mapper.selectQnaList(startRow, listLimit);
	}

	public FAQVO getfaq() {
		return mapper.selectFaq();
	}

	
}

