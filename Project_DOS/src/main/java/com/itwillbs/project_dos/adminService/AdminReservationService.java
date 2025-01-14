package com.itwillbs.project_dos.adminService;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.adminMapper.AdminReservationMapper;
import com.itwillbs.project_dos.vo.ReservationVO;

@Service
public class AdminReservationService {
	@Autowired
	private AdminReservationMapper reservationMapper;
	public int getReservationCount(String today) {
		return reservationMapper.selectReservationCount(today);
	}
	public List<ReservationVO> getReservationByTable(String today, int table) {
		return reservationMapper.selectReservationByTable(today,table);
	}
	public int getReservationCountByTable(int i, String today) {
		return reservationMapper.selectReservationCountByTable(i,today);
	}
	public ReservationVO getReservationInfo(ReservationVO reservation) {
		return reservationMapper.selectReservationInfo(reservation);
	}
	public List<String> getReservationTimeByTable(String table, String date) {
		return reservationMapper.selectReservationTimeByTable(table, date);
	}
	public String getAdminPassword() {
		return reservationMapper.selectAdminPassword();
	}
	public int editReservation(ReservationVO reservation) {
		return reservationMapper.updateReservation(reservation);
	}
	public int deleteReservation(String reservation_idx) {
		return reservationMapper.deleteReservation(reservation_idx);
	}

}
