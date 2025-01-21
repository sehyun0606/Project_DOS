package com.itwillbs.project_dos.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.project_dos.vo.MemberVO;
import com.itwillbs.project_dos.vo.ReservationVO;

@Mapper
public interface MyPageMapper {

	MemberVO selectmtProfile(String id);

	List<ReservationVO> selectMyReservationList(String id);

	ReservationVO selectMyreservation(String reservation_idx);

}
