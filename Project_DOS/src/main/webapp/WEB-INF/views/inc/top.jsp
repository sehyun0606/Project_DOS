<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
	    <a href="./"><img class="logo-img" src="${pageContext.request.contextPath}/resources/images/logo.png"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
               <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">정보</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">가게 정보</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">찾아오시는 길</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">메뉴</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">세트메뉴</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">스테이크</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">셀러드</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">파스타</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">리조또&필라프</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="#!">예약하기</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="#!">멤버쉽</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="Review">리뷰</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="GiftCard" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="GiftCard">기프티콘</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="Merch">굿즈</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="MealKit">밀키트</a></li>
                    </ul>
                </li>
            </ul>
            <div id="top_menu">
				
					<c:choose>
						<c:when test="${empty sessionScope.sId}"> <%-- 미 로그인 시 --%>
							<a class="login-item" href="MemberLogin">로그인</a> | 
							<a class="login-item" href="MemberJoin">회원가입</a>
						</c:when>
						<c:otherwise> <%-- 로그인 한 사용자일 경우 --%>
							<a class="login-item" href="MemberInfo">${sessionScope.sId}</a> 님 | 
							<a class="login-item" href="javascript:void(0)" onclick="logout()">로그아웃</a>
							
							<%-- 만약, 세션 아이디가 "admin" 일 경우 [관리자페이지] 링크 추가 --%>
							<c:if test="${sessionScope.sId eq 'admin'}">
								| <a class="login-item" href="">관리자페이지</a>
							</c:if>
						</c:otherwise>
					</c:choose>
				
			</div>
        </div>
    </div>
</nav>