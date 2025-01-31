package com.itwillbs.project_dos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.mapper.MyPageMapper;
import com.itwillbs.project_dos.vo.MemberVO;
import com.itwillbs.project_dos.vo.NoticeVO;
import com.itwillbs.project_dos.vo.PurchaseHistoryVO;
import com.itwillbs.project_dos.vo.QuestionVO;
import com.itwillbs.project_dos.vo.ReservationVO;
import com.itwillbs.project_dos.vo.ReviewVO;

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

	public int getHistoryList() {
		return myPageMapper.selectHistoryListCount();
	}

	public List<PurchaseHistoryVO> getPurchaseList(int startRow, int listLimit, String id) {
		return myPageMapper.selectPurchaseList(startRow, listLimit, id);
	}


	public int getMyReviewListCount(String id) {
		return myPageMapper.selectMyReviewListCount(id);
	}

	public List<ReviewVO> getReviewList(int startRow, int listLimit, String id) {
		return myPageMapper.selectMyReviewList(startRow,listLimit,id);
	}

	public List<String> getIdxList(String id) {
		return myPageMapper.selectIdxList(id);
	}

	public int getMyReservationListCount(String id) {
		return myPageMapper.selectMyReservationListCount(id);
	}

	public List<ReservationVO> getReservationList(int startRow, int listLimit, String id) {
		return myPageMapper.selectReservationList(startRow,listLimit,id);
	}

}
