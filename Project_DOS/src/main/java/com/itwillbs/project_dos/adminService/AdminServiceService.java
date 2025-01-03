package com.itwillbs.project_dos.adminService;

import java.util.List;

import org.apache.ibatis.javassist.SerialVersionUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.adminMapper.AdminServiceMapper;
import com.itwillbs.project_dos.vo.FAQVO;
import com.itwillbs.project_dos.vo.NoticeVO;
import com.itwillbs.project_dos.vo.QuestionVO;

@Service
public class AdminServiceService {
	@Autowired
	private AdminServiceMapper serviceMapper;

	public int registBoard(NoticeVO notice) {
		return serviceMapper.insertNotice(notice);
	}

	public int getAdminNoticeListCount() {
		return serviceMapper.selectAdminNoticeListCount();
	}

	public List<NoticeVO> getNoticeList(int startRow, int listLimit) {
		return serviceMapper.selectAdminNoticeList(startRow,listLimit);
	}

	public NoticeVO getAdminNotice(int board_num) {
		return serviceMapper.selectAdminNotice(board_num);
	}

	public int editNotice( NoticeVO notice) {
		return serviceMapper.updateAdminNotice(notice);
	}

	public int deleteNotice(int board_num) {
		return serviceMapper.deleteAdminNotice(board_num);
	}

	public List<NoticeVO> searchNoticeListByName(String searchQuery) {
		return serviceMapper.searchNoticeByTitle(searchQuery);
	}

	public List<NoticeVO> searchNoticeListByDate(String searchQuery) {
		return serviceMapper.searchNoticeByDate(searchQuery);
	}

	public int getAdminQuestionListCount() {
		return serviceMapper.selectAdminQuestionListCount();
	}

	public List<QuestionVO> getQuestionList(int startRow, int listLimit) {
		return serviceMapper.selectAdminQuestionList(startRow,listLimit);
	}

	public List<QuestionVO> getNotAnsweredQuestionList() {
		return serviceMapper.selectNotAnsweredQuestionList();
	}


	public QuestionVO getAdminQuestion(int qna_num) {
		return serviceMapper.selectAdminQuestion(qna_num);
	}

	public int requestQuestion(String request_content, int qna_num) {
		return serviceMapper.updateAdminQuestion(request_content, qna_num);
	}

	public int deleteQuestion(int qna_num) {
		return serviceMapper.deleteAdminQuestion(qna_num);
	}

	public List<QuestionVO> searchQuestionListByName(String searchQuery) {
		return serviceMapper.selectAdminQuestionByName(searchQuery);
	}

	public List<QuestionVO> searchQuestionListByDate(String searchQuery) {
		return serviceMapper.selectAdminQuestionByDate(searchQuery);
	}

	public List<QuestionVO> searchQuestionListByID(String searchQuery) {
		return serviceMapper.selectAdminQuestionByID(searchQuery);
	}

	public List<QuestionVO> searchQuestionListByCategory(String searchQuery) {
		return serviceMapper.selectAdminQuestionByCategory(searchQuery);
	}

	public FAQVO getFAQ() {
		return serviceMapper.selectAdminFAQ();
	}

	public int updateFAQ(FAQVO faqVO) {
		return serviceMapper.updateFAQ(faqVO);
	}
	
	
}
