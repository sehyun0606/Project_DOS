package com.itwillbs.project_dos.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.vo.QuestionVO;

@Mapper
public interface QnaMapper {

	int insertQna(QuestionVO qna); 

	
}


