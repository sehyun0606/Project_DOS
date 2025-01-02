package com.itwillbs.project_dos.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.mapper.QnaMapper;
import com.itwillbs.project_dos.vo.QnaVO;

@Service
public class QnaService {
	@Autowired
	private QnaMapper mapper;
	
	public int registBoard(QnaVO qna) {
		return mapper.insertQna(qna);
	}
}

