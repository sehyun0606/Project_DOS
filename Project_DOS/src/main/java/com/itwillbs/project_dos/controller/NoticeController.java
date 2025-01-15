package com.itwillbs.project_dos.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.project_dos.service.NoticeService;
import com.itwillbs.project_dos.vo.NoticeVO;
import com.itwillbs.project_dos.vo.PageInfo;
import com.itwillbs.project_dos.vo.QuestionVO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeservice;
	@GetMapping("Notice")
	public String noticeboard(
			@RequestParam(defaultValue = "1") int pageNum,
			Model model) {
		
		// ------------------------------------------------------
		// [ 페이징 처리 ]
		// 1. 페이징 처리를 위해 조회 목록 갯수 조절에 사용할 변수 선언
		int listLimit = 10; // 한 페이지 당 표시할 게시물 수(임시로 3개로 지정)
		int startRow = (pageNum - 1) * listLimit; // 조회할 게시물의 DB 행 번호(= row 값)
		
		// 2. 실제 뷰페이지에서 페이징 처리를 수행하는데 필요한 계산 작업
		// 1) BoardService - getBoardListCount() 메서드 호출하여 전체 게시물 갯수 조회 요청
		//    => 파라미터 : 없음   리턴타입 : int(listCount)
		int listCount = noticeservice.getBoardListCount();
		System.out.println("전체 게시물 수 : " + listCount);
		
		// 2) 한 페이지에서 표시할 목록(페이지 당 페이지 번호) 갯수 설정
		int pageListLimit = 3; // 임시) 페이지 당 페이지 번호 갯수를 3으로 설정(1 2 3 or 4 5 6)
		
		// 3) 최대 페이지번호 계산
		//    => 전체 게시물 수(listCount)를 페이지 당 게시물 수(listLimit)로 나눔
		//       이 때, 나머지가 0보다 크면 페이지 수 + 1 추가
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		// 단, 최대 페이지번호가 0 일 경우 기본값으로 1 설정
		if(maxPage == 0) {
			maxPage = 1;
		}
		
		// 4) 현재 페이지에서 보여줄 시작 페이지 번호 계산(페이지 목록의 맨 앞 페이지번호)
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		// 5) 현재 페이지에서 보여줄 마지막 페이지 번호 계산(페이지 목록의 맨 뒤 페이지번호)
		int endPage = startPage + pageListLimit - 1;
		
		// 6) 단, 마지막 페이지 번호(endPage) 값이 최대 페이지 번호(maxPage) 보다 클 경우
		//    마지막 페이지 번호를 최대 페이지 번호로 교체
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// -----------------------------------------------
		// 전달받은 페이지번호가 1보다 작거나 최대 페이지번호보다 클 경우
		// "fail.jsp" 페이지 포워딩을 통해 "해당 페이지는 존재하지 않습니다!" 출력하고
		// 1 페이지 목록으로 이동하도록 처리
		if(pageNum < 1 || pageNum > maxPage) {
			model.addAttribute("msg", "해당 페이지는 존재하지 않습니다!");
			model.addAttribute("targetURL", "Question?pageNum=1");
			return "result/result";
		}
		// -----------------------------------------------
		
		// 3. 페이징 정보를 관리하는 PageInfo 객체 생성 및 계산 결과 저장
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage, pageNum);
		
		// Model 객체에 페이징 정보 저장
		model.addAttribute("pageInfo", pageInfo);
		// ------------------------------------------------------
		// BoardService - getBoardList() 메서드를 호출하여 전체 게시물 목록 조회 요청
		// => 파라미터 : 시작행번호, 페이지 당 게시물 수   
		//    리턴타입 : List<BoardVO>(boardList)
		List<NoticeVO> noticeBoard = noticeservice.getNoticeList(startRow, listLimit);
		
		// ------------------------------------------------------
		// 조회된 게시물 목록 정보(List 객체)를 Model 객체에 저장
		model.addAttribute("noticeBoard", noticeBoard);
					
		return "service/notice_board";
	}
	
	
	@GetMapping("BoardDetail")
	public String BoardDetail(int board_num, Model model) {
		
		NoticeVO notice = noticeservice.getBoardList(board_num);
		model.addAttribute("notice", notice);
		return "service/notice_detail";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

