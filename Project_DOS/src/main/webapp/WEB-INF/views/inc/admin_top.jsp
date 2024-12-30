<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
	    <a href="./"><img class="logo-img" src="${pageContext.request.contextPath}/resources/images/logo.png"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link" aria-current="page" href="AdminReservation">예약관리</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="AdminMenu">메뉴관리</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="AdminUser">고객관리</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="AdminNotice">고객센터관리</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="AdminSalesHistory">판매내역</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="AdminEvent">이벤트관리</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="AdminReview">리뷰관리</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="AdminiCoupon">쿠폰관리</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="AdminMerch">상품관리</a></li>
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