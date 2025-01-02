package com.itwillbs.project_dos.adminMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.project_dos.vo.NoticeVO;
import com.itwillbs.project_dos.vo.QuestionVO;

@Mapper
public interface AdminServiceMapper {

	int insertNotice(NoticeVO notice);

	int selectAdminNoticeListCount();

	List<NoticeVO> selectAdminNoticeList(
			@Param("startRow")int startRow,
			@Param("listLimit")int listLimit);

	NoticeVO selectAdminNotice(int board_num);

	int updateAdminNotice(NoticeVO notice);

	int deleteAdminNotice(int board_num);

	List<NoticeVO> searchNoticeByTitle(String searchQuery);

	List<NoticeVO> searchNoticeByDate(String searchQuery);

	int selectAdminQuestionListCount();

	List<QuestionVO> selectAdminQuestionList(@Param("startRow")int startRow, @Param("listLimit")int listLimit);

	List<QuestionVO> selectNotAnsweredQuestionList();

	QuestionVO selectAdminQuestion(int qna_num);

	int updateAdminQuestion(@Param("request_content")String request_content, @Param("qna_num")int qna_num);

}
