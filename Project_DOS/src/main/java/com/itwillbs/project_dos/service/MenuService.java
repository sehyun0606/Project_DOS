package com.itwillbs.project_dos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_dos.mapper.MenuMapper;
import com.itwillbs.project_dos.vo.MenuVO;

@Service  // 서비스 클래스 선언
public class MenuService {

    @Autowired
    private MenuMapper menuMapper;  // 매퍼 주입

    // 1. 메뉴 리스트 조회 (사용자 페이지)
    public List<MenuVO> getMenuList() {
        return menuMapper.getMenuList();  // 매퍼에서 메뉴 리스트 가져오기
    }

    // 2. 메뉴 상세 조회 (사용자 페이지)
    public MenuVO getMenuDetail(int menuId) {
        return menuMapper.getMenuDetail(menuId);  // 매퍼에서 특정 메뉴 정보 가져오기
    }
}