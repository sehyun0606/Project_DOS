package com.itwillbs.project_dos.adminService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.adminMapper.AdminMenuMapper;
import com.itwillbs.project_dos.vo.MenuVO;

@Service
public class AdminMenuService {
	@Autowired
	private AdminMenuMapper menuMapper;

	public List<MenuVO> getMenuList(String menu) {
		return menuMapper.selectMenuList(menu);
	}

	public int registMenu(MenuVO menu) {
		return menuMapper.insertMenu(menu);
	}

	public MenuVO getMenuDetail(String menu_name) {
		return menuMapper.selectMenuDetail(menu_name);
	}

	public int removeMenuFile(String menu_img) {
		return menuMapper.deleteMenuFile(menu_img);
	}

	public int editMenu(MenuVO menu) {
		return menuMapper.updateMenu(menu);
	}

}
