package com.itwillbs.project_dos.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.project_dos.service.ReservationService;
import com.itwillbs.project_dos.vo.ReservationVO;

@Controller
public class ReservationController {
	@Autowired
	private ReservationService reservationService;
	
	@GetMapping("Reservation")
	public String reservation() {
		
		return "menu/reservation";
	}
	
	//테이블 별 유효한 시간 선택
	@GetMapping("ReservationTimeSelect")
	public String reservationTime(String date, String table, Model model) {
		List<String> disableTimeList = reservationService.getTimeList(date,table);
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
		return "menu/reservation_time";
	}
	
	@PostMapping("Reservation")
	public String checkReservation(ReservationVO reservation,Model model) {
		
		
		
		
		
		String phoneNum = reservationService.getPhoneNum(reservation.getMember_id());
		
		model.addAttribute("phone", phoneNum);
		
		return "menu/check";
	}
	
	@GetMapping("ReservationConfirm")
	public String reservationConfirm(ReservationVO reservation,Model model) {
		
		int insertCount = reservationService.insertReservation(reservation);
		ReservationVO myReservation = reservationService.getMyReservation(reservation);
		
		model.addAttribute("myReservation", myReservation);
		
		return "menu/confirm";
	}
	
}









