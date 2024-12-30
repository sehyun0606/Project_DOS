package com.itwillbs.project_dos.adminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminReservationController {

	@GetMapping("AdminReservation")
	public String adminReservation() {
		return "admin/admin_reservation/admin_reservation";
	}
	
	
	@GetMapping("ReservationInfo")
	public String reservationInfo() {
		return "admin/admin_reservation/reservation_Info";
	}
	
	
	@GetMapping("ReservationEdit")
	public String reservationEdit() {
		return "admin/admin_reservation/reservation_edit";
	}
	
	
}
