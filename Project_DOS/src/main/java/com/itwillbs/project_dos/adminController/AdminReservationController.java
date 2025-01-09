package com.itwillbs.project_dos.adminController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.project_dos.adminService.AdminReviewService;

@Controller
public class AdminReservationController {
	
	@Autowired
	private AdminReviewService reviewService;
	
	@GetMapping("AdminReservation")
	public String adminReservation() {
		
		
		
		return "admin/admin_reservation/admin_reservation";
	}
	
	
	@GetMapping("ReservationInfo")
	public String reservationInfo(int month,int date) {
		
		return "admin/admin_reservation/reservation_Info";
	}
	
	
	@GetMapping("ReservationEdit")
	public String reservationEdit() {
		return "admin/admin_reservation/reservation_edit";
	}
	
	
}
