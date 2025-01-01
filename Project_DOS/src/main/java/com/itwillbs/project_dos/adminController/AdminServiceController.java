package com.itwillbs.project_dos.adminController;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.project_dos.adminService.AdminServiceService;
import com.itwillbs.project_dos.vo.AdminNoticePageInfo;
import com.itwillbs.project_dos.vo.NoticeVO;

@Controller
public class AdminServiceController {
	@Autowired
	private AdminServiceService adminService;
	
	@GetMapping("AdminNotice")
	public String adminNotice(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		int listLimit = 6;
		int startRow = (pageNum - 1) * listLimit;
		int listCount = adminService.getAdminNoticeListCount();
		int pageListLimit = 5;
		
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		if(maxPage == 0) {
			maxPage = 1;
		}
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		if(pageNum < 1 || pageNum > maxPage) {
			model.addAttribute("msg", "존재하지 않는 페이지");
			model.addAttribute("targetURL","AdminNotice?pageNum=1");
			return "result/result";
		}
		
		AdminNoticePageInfo pageInfo = new AdminNoticePageInfo(listCount,pageListLimit,maxPage,startPage,endPage,pageNum);
		
		model.addAttribute("pageInfo",pageInfo);
		List<NoticeVO> noticeList = adminService.getNoticeList(startRow,listLimit);
		model.addAttribute("noticeList", noticeList);
		
		
		return "admin/admin_service/admin_notice";
	}
	
	
	@GetMapping("NoticeForm")
	public String noticeForm() {
		return "admin/admin_service/notice_form";
	}
	
	@PostMapping("NoticeForm")
	public String writeNotice(NoticeVO notice, Model model) {
		
		notice.setBoard_readcount(0);
		
		int insertCount = adminService.registBoard(notice);
		
		if(insertCount == 1) {
			model.addAttribute("msg","공지사항 등록 성공");
			return "redirect:/AdminNotice";
		}else {
			model.addAttribute("msg","등록 실패");
			return "result/result";
		}
	}
	
	@GetMapping("AdminNoticeEdit")
	public String noticeEdit(int board_num, Model model) {
		NoticeVO notice = adminService.getAdminNotice(board_num);
		if(notice == null) {
			model.addAttribute("msg", "존재하지 않는 게시물입니다");
			return "result/fail";
		}
		model.addAttribute("notice",notice);
		return "admin/admin_service/notice_edit";
	}
	
	@PostMapping("AdminNoticeEdit")
	public String editNotice(int board_num,NoticeVO notice, Model model) {
		
		notice.setBoard_num(board_num);
		
		int updateCount = adminService.editNotice(notice);
		
		if(updateCount > 0) {
			return "redirect:/AdminNotice";
		}else {
			model.addAttribute("msg", "공지사항 수정 실패!");
			return "result/result";
		}
		
	}
	@GetMapping("AdminNoticeDelete")
	public String noticeDelete(int board_num, Model model) {
		
		int deleteCount = adminService.deleteNotice(board_num);
		if(deleteCount > 0) {
			return "redirect:/AdminNotice";
		}else {
			model.addAttribute("msg", "삭제 실패..");
			return "result/result";
		}
	}
	
	@GetMapping("AdminNoticeSerch")
	public String adminNoticeSerch(@RequestParam Map<String, String> map, Model model) {
		
		if(map.get("searchType").equals("name")) {
			List<NoticeVO> noticeList = adminService.searchNoticeListByName(map.get("searchQuery"));
			model.addAttribute("noticeList", noticeList);
		}else if(map.get("searchType").equals("date")) {
			List<NoticeVO> noticeList = adminService.searchNoticeListByDate(map.get("searchQuery"));
			model.addAttribute("noticeList", noticeList);
		}else {
			model.addAttribute("msg","잘못된 접근!!");
			return "result/result";
		}
		
		return "admin/admin_service/admin_notice_serch";
	}
	
	@GetMapping("AdminQuestion")
	public String adminQuestion() {
		
		return "admin/admin_service/admin_question";
	}
	
}






