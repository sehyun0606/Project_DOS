package com.itwillbs.project_dos.adminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.project_dos.adminService.AdminSalesService;
import com.itwillbs.project_dos.vo.AdminPageInfo;
import com.itwillbs.project_dos.vo.PurchaseHistoryVO;
import com.itwillbs.project_dos.vo.QuestionVO;

@Controller
public class AdminSalesHistoryController {
	
	@Autowired
	private AdminSalesService salesService;
	
	@GetMapping("AdminSalesHistory")
	public String adminSalesHistory(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		int listLimit = 6;
		int startRow = (pageNum - 1) * listLimit;
		int listCount = salesService.getHistoryListCount();
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
			model.addAttribute("targetURL","MyQuestion?pageNum=1");
			return "result/result";
		}
		
		AdminPageInfo pageInfo = new AdminPageInfo(listCount,pageListLimit,maxPage,startPage,endPage,pageNum);
		
		model.addAttribute("pageInfo",pageInfo);
		
		List<PurchaseHistoryVO> historyList =  salesService.getHistoryList(startRow,listLimit);
		model.addAttribute("historyList", historyList);
		
		return "admin/admin_history/purchase_history";
	}
}
