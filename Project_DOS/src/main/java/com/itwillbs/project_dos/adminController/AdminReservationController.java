package com.itwillbs.project_dos.adminController;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.project_dos.adminService.AdminReservationService;
import com.itwillbs.project_dos.vo.ReservationVO;

@Controller
public class AdminReservationController {
	
	@Autowired
	private AdminReservationService reservationService;
	
	@GetMapping("AdminReservation")
	public String adminReservation() {
		
		
		
		return "admin/admin_reservation/admin_reservation";
	}
	
	
	@GetMapping("ReservationInfo")
	public String reservationInfo(int year,int month,int date, Model model) {
		
		String today  = year + "-" + month + "-" + date;
		
		int reservationCount = reservationService.getReservationCount(today);
		
		List<Object> list = new ArrayList<>();
		
		for(int i = 1; i < 10; i++) {
			int reservationCountByTable = reservationService.getReservationCountByTable(i,today);
			list.add(reservationCountByTable);
		}
		System.out.println(list);
		
		model.addAttribute("reservationCount", reservationCount);
		model.addAttribute("reservationCountByTable", list);
		
		return "admin/admin_reservation/reservation_Info";
	}
	@GetMapping("ReservationTime")
	public String reservationTime(int year, int month, int date, int table, Model model) {
		String today  = year + "-" + month + "-" + date;
		List<ReservationVO> reservationList = reservationService.getReservationByTable(today,table);
		
		model.addAttribute("reservationList", reservationList);
		
		return "admin/admin_reservation/reservation_time";
	}
	
	@GetMapping("ReservationEdit")
	public String reservationEditForm(ReservationVO reservation, Model model) {
		
		ReservationVO reservationVO = reservationService.getReservationInfo(reservation);
		
		model.addAttribute("reservation", reservationVO);
		
		return "admin/admin_reservation/reservation_edit";
	}
	
	@GetMapping("ReservationTimeEdit")
	public String reservationTimeEdit(String table,String date, Model model) {
		
		List<String> disableTimeList = reservationService.getReservationTimeByTable(table,date);
		List<String> timeList = new ArrayList<>(Arrays.asList("10:00","12:00","2:00","4:00","6:00","8:00"));
		List<String> availTimeList = new ArrayList<>();
		System.out.println(disableTimeList);
		
		if(!disableTimeList.isEmpty()) {
			outerLoop: 
			for(int i = 0; i < timeList.size(); i++) {
				String time = timeList.get(i);
				for(int j = 0; j < disableTimeList.size(); j++) {
					if(time.equals(disableTimeList.get(j))) {
						continue outerLoop;
					}
				}
				availTimeList.add(time);
			}
			model.addAttribute("timeList", availTimeList);
		}else {
			model.addAttribute("timeList", timeList);
		}
		model.addAttribute("table", table);
		
		
		return "admin/admin_reservation/reservation_time_edit";
	}
	
	@GetMapping("ReservationTableEdit")
	public String reservationTableEdit() {
		return "admin/admin_reservation/reservation_table_edit";
		
	}
	@PostMapping("ReservationEdit")
	public String reservationEdit(ReservationVO reservation, Model model) {
		
		int updateCount = reservationService.editReservation(reservation);
		
		if(updateCount > 0) {
			model.addAttribute("msg", "수정 완료!");
			model.addAttribute("targetURL", "close");
			return "result/result";
		}else {
			model.addAttribute("msg", "수정 실패..");
			return "result/result";
		}
		
	}
	
	@GetMapping("ReservationDelete")
	public String reservationDelete(String reservation_idx,Model model) {
		
		int deleteCount = reservationService.deleteReservation(reservation_idx);
		
		model.addAttribute("msg", "삭제 완료!");
		model.addAttribute("targetURL", "close");
		return "result/result";
	}
	
	
}
