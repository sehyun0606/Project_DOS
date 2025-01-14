package com.itwillbs.project_dos.adminMapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.project_dos.vo.ReservationVO;

@Mapper
public interface AdminReservationMapper {

	int selectReservationCount(String today);

	List<ReservationVO> selectReservationByTable(@Param("today")String today,@Param("table") int table);

	int selectReservationCountByTable(@Param("i") int i, @Param("today")String today);


	ReservationVO selectReservationInfo(ReservationVO reservation);

	List<String> selectReservationTimeByTable(
			@Param("table") String table,
			@Param("date") String date);

	String selectAdminPassword();

	int updateReservation(ReservationVO reservation);

	int deleteReservation(String reservation_idx);


}
