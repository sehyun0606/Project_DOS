package com.itwillbs.project_dos.adminMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.project_dos.vo.PurchaseHistoryVO;

@Mapper
public interface AdminSalesMapper {

	List<PurchaseHistoryVO> selectHistoryList(@Param("startRow") int startRow,@Param("listLimit") int listLimit);

	int selectHistoryListCount();

}
