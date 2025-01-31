package com.itwillbs.project_dos.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.core.appender.rewrite.MapRewritePolicy.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.project_dos.service.QnaService;
import com.itwillbs.project_dos.vo.FAQVO;
import com.itwillbs.project_dos.vo.PageInfo;
import com.itwillbs.project_dos.vo.QuestionVO;

@Controller
public class QnaController {
		@Autowired
		private QnaService qnaservice;
		@GetMapping("Question")
		public String QuestionList(
				@RequestParam(defaultValue = "") String searchType,
				@RequestParam(defaultValue = "") String searchKeyword,
				@RequestParam(defaultValue = "1") int pageNum,
				Model model) {
		//	System.out.println("페이지번호 : " + pageNum);
//			System.out.println("검색타입: " + searchType);
//			System.out.println("검색타입: " + searchKeyword);
			
			// ------------------------------------------------------
			// [ 페이징 처리 ]
			// 1. 페이징 처리를 위해 조회 목록 갯수 조절에 사용할 변수 선언
			int listLimit = 10; // 한 페이지 당 표시할 게시물 수(임시로 3개로 지정)
			int startRow = (pageNum - 1) * listLimit; // 조회할 게시물의 DB 행 번호(= row 값)
			
			// 2. 실제 뷰페이지에서 페이징 처리를 수행하는데 필요한 계산 작업
			// 1) BoardService - getBoardListCount() 메서드 호출하여 전체 게시물 갯수 조회 요청
			//    => 파라미터 : 없음   리턴타입 : int(listCount)
			int listCount = qnaservice.getQnaListCount(searchType,searchKeyword);
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
			List<QuestionVO> qnaList = qnaservice.getQnaList(searchType, searchKeyword, startRow, listLimit);
			
			// ------------------------------------------------------
			// 조회된 게시물 목록 정보(List 객체)를 Model 객체에 저장
			model.addAttribute("qnaList", qnaList);
			
			return "service/qna_board";
		}

		@GetMapping("FAQ")
		public String faqView(Model model) {
			FAQVO faq = qnaservice.getfaq();
			System.out.println(faq);
			model.addAttribute("faqList",faq);
			
			return "service/faq_view2";
		}
		
		@GetMapping("qnaWrite")
		public String qnaWriteForm(HttpSession session, Model model) {
			String id = (String)session.getAttribute("sId");
			
			if(id == null) {
				model.addAttribute("msg", "접근 권한이 없습니다!");
				// 로그인 페이지로 강제 이동시키기 위해 targetURL 속성값으로 "MemberLogin" 추가
				model.addAttribute("targetURL", "MemberLogin");
				
				return "result/result";
			}
			return "service/qna_write";
		}
		
		@PostMapping("registQna")
		public String registQna(Model model, HttpSession session, QuestionVO qna) {
			
			String id = (String)session.getAttribute("sId");
			
			if(id == null) {
				model.addAttribute("msg", "접근 권한이 없습니다!");
				// 로그인 페이지로 강제 이동시키기 위해 targetURL 속성값으로 "MemberLogin" 추가
				model.addAttribute("targetURL", "MemberLogin");
				
				return "result/result";
			}
			
			int insertCount = qnaservice.insertQnaBoard(qna);
//			System.out.println(insertCount);
			if(insertCount > 0) {
					return "redirect:/Question";
			} else {
				model.addAttribute("msg", "등록 실패!");
				return "result/result";
			}
			
		}
		
		@GetMapping("QnaDetail")
		public String QnaDetail(Model model, int qna_num) {
			
			QuestionVO qna = qnaservice.getBoard(qna_num, true);
			System.out.println(qna);
			
			model.addAttribute("qna",qna);
			
			return "service/qna_view";
		}
		
		@GetMapping("QnaModify")
		public String QnaModifyForm(Model model, HttpSession session, @RequestParam Map<String, String> map, int qna_num) {
			QuestionVO qna = qnaservice.getBoard(qna_num);
			System.out.println(qna);
			
			model.addAttribute("qna",qna);
			return "service/qna_modify";
		}
		
		@PostMapping("successModify")
		public String successModify(QuestionVO qna, @RequestParam(defaultValue = "1") int pageNum,
				HttpSession session, Model model) {
			
			int updateCount = qnaservice.qnaModify(qna);
			
			if(updateCount > 0) {
				return "redirect:/QnaDetail?qna_num=" + qna.getQna_num() + "&pageNum=" + pageNum;
			} else {
				model.addAttribute("msg", "등록 실패!");
				return "result/result";
			}
		}
		
		@GetMapping("QnaDelete")
		public String QnaDelete(int qna_num, Model model) {
			int deleteCount = qnaservice.deleteQna(qna_num);
			if(deleteCount > 0) {
				model.addAttribute("msg", "삭제 성공!");
				model.addAttribute("targetURL", "Question");
				return "result/result";
			} else {
				model.addAttribute("msg", "등록 실패!");
				return "result/result";
			}
			
		}
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}