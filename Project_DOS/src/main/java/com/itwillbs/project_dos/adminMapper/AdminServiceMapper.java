package com.itwillbs.project_dos.adminMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.project_dos.vo.NoticeVO;

@Mapper
public interface AdminServiceMapper {

	int insertNotice(NoticeVO notice);

	int selectAdminNoticeListCount();

	List<NoticeVO> selectAdminNoticeList(
			@Param("startRow")int startRow,
			@Param("listLimit")int listLimit);

	NoticeVO selectAdminNotice(int board_num);

	int updateAdminNotice(NoticeVO notice);

	int deleteAdminNotice(int board_num);

	List<NoticeVO> searchNoticeByTitle(String searchQuery);

	List<NoticeVO> searchNoticeByDate(String searchQuery);
	
}
