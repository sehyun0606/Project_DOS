package com.itwillbs.project_dos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.mapper.ReservationMapper;
import com.itwillbs.project_dos.vo.ReservationVO;

@Service
public class ReservationService {
	@Autowired
	private ReservationMapper reservationMapper;

	public List<String> getTimeList(String date, String table) {
		return reservationMapper.selectTimeList(date,table);
	}

	public int insertReservation(ReservationVO reservation) {
		return reservationMapper.insertReservation(reservation);
	}

	public String getPhoneNum(String member_id) {
		return reservationMapper.selectPhoneNum(member_id);
	}

	

	public ReservationVO getMyReservation(ReservationVO reservation) {
		
		int reservationNum = reservationMapper.selectReservationNum(reservation);
		
		return reservationMapper.selectMyReservation(reservationNum);
	}
	
}
