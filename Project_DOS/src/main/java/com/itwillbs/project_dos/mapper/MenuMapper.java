package com.itwillbs.project_dos.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.project_dos.vo.MenuVO;

@Mapper
public interface MenuMapper {

    // 1. 메뉴 리스트 조회
    List<MenuVO> getMenuList();

    // 2. 메뉴 상세 조회
    MenuVO getMenuDetail(int menuId);
}