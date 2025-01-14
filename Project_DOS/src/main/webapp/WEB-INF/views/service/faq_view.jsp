<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../inc/top.jsp" %>
<%-- <%@ include file="../inc/side.jsp" %> --%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FAQ게시판</title>
        <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/side.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
<style>


    /* 전체 컨테이너 */
    .container2 {
        margin: 30px auto 0; /* 상단 여백 30px, 가로 중앙 정렬 */
        padding: 0 200px; /* 좌우 여백 */
    }
	.footer {
    	margin:100px;
    }
	
    /* 게시판 제목 스타일 */
    .board-title {
        font-size: 2rem; /* 글자 크기 */
        font-weight: bold; /* 글자 굵기 */
    }

    .board-meta {
	    width: 210px;       /* 버튼의 너비 */
	    height: 50px;       /* 버튼의 높이 */
        border: 2px solid #ccc;
        border-radius: 5px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center; /* 세로 중심 정렬 */
        margin-left: 30px;
       
        box-sizing: border-box;
        padding: 10px; /* 상하단 여백 균일하게 */
    }
    
    .board-meta p, .board-meta span {
        margin: 0; /* 기본 외부 여백 제거 */
        line-height: 1.5; /* 텍스트 행간 */
        text-align: center; /* 텍스트 가운데 정렬 */
    }
    
    .board-content {
        display: flex; /* 부모 컨테이너에서 자식 요소들이 나란히 배치되게 설정 */
        flex-direction: row; /* 이미지와 텍스트가 옆으로 배치되게 */
        justify-content: center; /* 수평 중앙 정렬 */
        align-items: flex-start; /* 세로 정렬 */
        width: 100%; /* 가로 최대 크기 */
        gap: 50px; /* 이미지와 텍스트 사이 여백 추가 */
    }
    
    
    .board-content p {
        margin: 0; /* 기본 여백 제거 */
        font-size: 1.1rem; /* 텍스트 크기 */
        color: #333; /* 글자 색상 */
        width: 50%; /* 텍스트의 최대 폭 */
        text-align: left; /* 텍스트 왼쪽 정렬 */
    }

    /* 게시판 본문 영역 */
    .board-content-wrapper {
        padding: 20px; /* 내부 여백 */
        text-align: center; /* 텍스트 가운데 정렬 */
        background-color: #f8f9fa; /* 배경색 */
        border: 1px solid #ccc; /* 테두리 */
        border-radius: 5px; /* 모서리 둥글게 */
        min-height: 600px; /* 최소 높이 */
    	min-width: 600px; /* 최소 너비 */
    }

    /* 게시판 본문 텍스트 스타일 */
    .board-content p {
        height: auto; /* 텍스트 영역 높이 자동 */
        margin-top: 15px; /* 상단 간격 */
        font-size: 1.1rem; /* 글자 크기 */
        line-height: 1.6; /* 줄 간격 */
        color: #333; /* 글자 색상 */
    }
	
	    /* 고정 버튼 영역 */
	.fixed-buttons {
	    position: fixed;   /* 고정된 위치 */
	    bottom: 20px;      /* 하단에서 거리 조정 */
	    right: 900px;       /* 우측에서 거리 조정 */
	    z-index: 10;       /* 다른 요소 위에 배치 */
	    width: auto;       /* 컨테이너의 폭 자동 설정 */
	    display: flex;    /* 버튼들이 나란히 배치되도록 */
	    justify-content: space-between; /* 버튼들 간 간격 */
	}



    /* 고정 버튼 스타일 */
    .fixed-buttons button {
        width: 150px; /* 버튼 너비 */
        margin-bottom: 10px; /* 버튼 간 간격 */
    }
	
    /* 고정 버튼 컨테이너 */


    /* 공통 버튼 스타일 */
    .btn-list, .btn-custom {
        border: 2px solid #ccc; /* 테두리 색상 및 두께 */
        border-radius: 5px; /* 모서리 둥글게 */
        padding: 10px 20px; /* 내부 여백 */
        font-size: 1rem; /* 글자 크기 */
        background-color: white; /* 배경색 */
        color: black; /* 글자색 */
    }
    
    /* 버튼의 포커스 상태에서 파란색 테두리 제거 */
        button:focus, .btn:focus {
            outline: none;
            box-shadow: none;
        }
        
        /* 버튼의 hover 상태에서 테두리 유지 */
        button:hover, .btn:hover {
            border: 2px solid #ccc;
        }
</style>

</head>
<body>
    <div class="container2">
        <div class="row mb-4">
            <div class="col-md-3">
                <button type="button" class="btn btn-custom btn-block">FAQ</button>
            </div>
            <div class="col-md-5">
                <input type="text" id="search1" class="btn btn-custom btn-block" value="자주 묻는 질문 모음입니다." readonly> 
            </div>
            <div class="board-meta">
            	<p>조회수: <span id="views">${sessionScope.views}</span></p>
            </div>
            <div class="board-meta">
            	<p>등록일: <span id="regDate">${sessionScope.regDate}</span></p>
            </div>
        </div>

        <div class="board-content-wrapper">
            <div class="board-content">
                <p>
				Q : 예약 문의는 어떻게 하나요?<br>
				A : 예약 문의는 홈페이지 가운데 예약하기를 이용하시거나 전화로 가능합니다.<br>
				<br>
				Q : 이용 시간이 궁금해요.<br>
				A : 월~금 10:00~17:00 점심시간 12:00~13:00 토~일, 공휴일은 휴무입니다.<br>
				<br>
				Q : 기프티콘 종류가 어떻게 되나요?<br>
				A : 1만원권, 2만원권, 3만원권 이렇게 3종류가 있습니다.<br>
				<br>
				Q : 이벤트 참여는 어떻게 하나요?.<br>
				A : 이벤트 내용마다 다르며 상세한건 이벤트 페이지에서 확인 가능합니다.<br>
				<br>
				Q : 이용 시간이 궁금해요.<br>
				A : 월~금 10:00~17:00 점심시간 12:00~13:00 토~일, 공휴일은 휴무입니다.<br>
				<br>
				Q : 홈페이지에 메뉴가 사라졌어요.<br>
				A : 당일 소진된것으로 당일에는 이용이 불가능합니다. <br>
                </p>
            </div>
        </div>
    </div>

    <div class="fixed-buttons">
        <button type="button" class="btn btn-custom" onclick = "history.back()">목록</button>
	<c:if test="${sessionScope.userRole == 'ADMIN'}">
        <button type="button" class="btn btn-custom">수정하기</button>
    </c:if>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>