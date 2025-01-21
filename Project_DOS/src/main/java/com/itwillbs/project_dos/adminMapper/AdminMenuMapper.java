package com.itwillbs.project_dos.adminMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.project_dos.vo.MenuVO;

@Mapper
public interface AdminMenuMapper {

	List<MenuVO> selectMenuList(String menu);

	int insertMenu(MenuVO menu);

	MenuVO selectMenuDetail(String menu_name);

	int deleteMenuFile(String menu_img);

	int updateMenu(MenuVO menu);

	String selectMenuImg(String menu_name);

	int deleteMenu(String menu_name);

}
