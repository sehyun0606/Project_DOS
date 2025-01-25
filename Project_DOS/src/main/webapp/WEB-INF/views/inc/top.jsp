<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
	    <a href="./"><img class="logo-img" src="${pageContext.request.contextPath}/resources/images/logo.png"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
               <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="Brand" role="button" data-bs-toggle="dropdown" aria-expanded="false">정보</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="Brand">가게 정보</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="Directions">찾아오시는 길</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="Menu">메뉴</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="#!" id="reservation">예약하기</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="MemberShip">멤버쉽</a></li>
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
                <li class="nav-item"><a class="nav-link" aria-current="page" href="Question">문의사항</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="Notice">공지사항</a></li>
            </ul>
            <div id="top_menu">
				<c:choose>
					<c:when test="${empty sessionScope.sId}"> <%-- 미 로그인 시 --%>
						<a class="login-item" href="MemberLogin">로그인</a> | 
						<a class="login-item" href="MemberJoin">회원가입</a>
					</c:when>
					<c:when test="${sessionScope.sId eq 'admin'}">
						<p class="login-item" >${sessionScope.sId}</p> 님 | 
						<a class="login-item" href="javascript:void(0)" onclick="logout()">로그아웃</a> |
						<%-- 만약, 세션 아이디가 "admin" 일 경우 [관리자페이지] 링크 추가 --%>
						<a class="login-item" href="AdminHome">관리자페이지</a>
					</c:when>
					<c:otherwise> <%-- 로그인 한 사용자일 경우 --%>
						<a class="login-item" href="Mypage">${sessionScope.sId}</a> 님 | 
						<a class="login-item" href="javascript:void(0)" onclick="logout()">로그아웃</a>
						
					</c:otherwise>
				</c:choose>
			</div>
        </div>
    </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script>
	function logout() {
		// confirm() 함수 활용하여 "로그아웃하시겠습니까?" 질문을 통해
		// 확인 버튼 클릭 시 "MemberLogout" 페이지로 이동 처리
		if(confirm("로그아웃하시겠습니까?")) {
			location.href = "MemberLogout";
		}
	}
	$(document).ready(function () {
	    $("#reservation").on("click", function (event) {
	        event.preventDefault();

	      	const popupURL = 'Reservation';

        	window.open(popupURL, '_blank', 'width=550,height=800');
	    });
	});
	
</script>