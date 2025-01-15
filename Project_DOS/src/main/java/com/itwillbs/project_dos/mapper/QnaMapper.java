package com.itwillbs.project_dos.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.vo.FAQVO;
import com.itwillbs.project_dos.vo.QuestionVO;

@Mapper
public interface QnaMapper {

	int selectQnaListCount();

	List<QuestionVO> selectQnaList(@Param("startRow") int startRow, @Param("listLimit") int listLimit);

	FAQVO selectFaq();

	int insertQnaBoard(QuestionVO qna);


	int updateQnaBoard(QuestionVO qna);

	QuestionVO selectBoard(int qna_num);

	
}


