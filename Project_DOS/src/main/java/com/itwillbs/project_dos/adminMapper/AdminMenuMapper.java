package com.itwillbs.project_dos.adminMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.project_dos.vo.MenuVO;

@Mapper
public interface AdminMenuMapper {

	List<MenuVO> selectMenuList(String menu);

}
