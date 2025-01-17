package com.itwillbs.project_dos.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.project_dos.vo.ReservationVO;

@Mapper
public interface ReservationMapper {

	List<String> selectTimeList(@Param("date") String date,@Param("table") String table);

	int insertReservation(ReservationVO reservation);

	String selectPhoneNum(String member_id);

	int selectReservationNum(ReservationVO reservation);

	ReservationVO selectMyReservation(int reservationNum);

}
