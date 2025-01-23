package com.itwillbs.project_dos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.mapper.MyPageMapper;
import com.itwillbs.project_dos.vo.MemberVO;
import com.itwillbs.project_dos.vo.NoticeVO;
import com.itwillbs.project_dos.vo.QuestionVO;
import com.itwillbs.project_dos.vo.ReservationVO;

@Service
public class MyPageService {

	@Autowired 
	private MyPageMapper myPageMapper;

	public MemberVO getMyProfile(String id) {
		return myPageMapper.selectmtProfile(id);
	}

	public List<ReservationVO> getMyReservationlist(String id) {
		return myPageMapper.selectMyReservationList(id);
	}

	public ReservationVO getMyReservation(String reservation_idx) {
		return myPageMapper.selectMyreservation(reservation_idx);
	}

	public int getMyNoticeListCount(String id) {
		return myPageMapper.selectMyNoticeListCount(id);
	}

	public List<QuestionVO> getQuestionList(int startRow, int listLimit, String id) {
		return myPageMapper.selectQuestionList(startRow,listLimit,id);
	}

	public QuestionVO getMyQuestionDetail(int qna_num) {
		return myPageMapper.selectMyQuestionDetail(qna_num);
	}

	public int editMyQuestion(QuestionVO question) {
		return myPageMapper.updateMyQuestion(question);
	}
}
