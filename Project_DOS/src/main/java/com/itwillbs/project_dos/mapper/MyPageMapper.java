package com.itwillbs.project_dos.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.project_dos.vo.MemberVO;
import com.itwillbs.project_dos.vo.NoticeVO;
import com.itwillbs.project_dos.vo.PurchaseHistoryVO;
import com.itwillbs.project_dos.vo.QuestionVO;
import com.itwillbs.project_dos.vo.ReservationVO;

@Mapper
public interface MyPageMapper {

	MemberVO selectmtProfile(String id);

	List<ReservationVO> selectMyReservationList(String id);

	ReservationVO selectMyreservation(String reservation_idx);

	int selectMyNoticeListCount(String id);

	List<QuestionVO> selectQuestionList(
								@Param("startRow")int startRow,
								@Param("listLimit")int listLimit,
								@Param("id")String id
								);

	QuestionVO selectMyQuestionDetail(int qna_num);

	int updateMyQuestion(QuestionVO question);

	int selectHistoryListCount();

	List<PurchaseHistoryVO> selectPurchaseList(
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit, 
			@Param("id") String id);

						
}
