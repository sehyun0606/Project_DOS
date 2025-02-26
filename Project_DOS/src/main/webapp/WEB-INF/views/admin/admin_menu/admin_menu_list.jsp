<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>


<c:forEach items="${menuList}" var="menu">
	<div class="menu-item">
	    <img src="/resources/upload/${menu.menu_img}" alt="메뉴 이미지">
	    <div class="menu-info">
	    	
	        <h3>
	        <c:if test="${menu.populer_menu eq 'Y'}">[인기메뉴]</c:if>
	        <c:if test="${menu.new_menu eq 'Y'}">[신메뉴]</c:if>
	        ${menu.menu_name}
	        </h3>
	        <p>${menu.menu_description}</p>
	        <div class="price">${menu.menu_price}</div>
	    </div>
	    <div class="menu-buttons">
	        <button onclick="location.href='MenuEdit?menu_name=${menu.menu_name}'">메뉴 편집 버튼</button>
	        <button onclick="location.href='MenuDelete?menu_name=${menu.menu_name}'">메뉴 삭제 버튼</button>
	    </div>
	</div>
</c:forEach>