<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../inc/side.jsp" %>
<%@ include file="../inc/top.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>이벤트 게시판</title>
    <link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
    /* 고정 버튼 영역 */
    .fixed-buttons {
        position: absolute; /* 부모 컨테이너 기준으로 위치 고정 */
        bottom: 330px; /* 하단에서의 거리 */
        left: 50%; /* 가로 중앙 정렬 */
        transform: translateX(-50%); /* 가운데 정렬 보정 */
        z-index: 10; /* 다른 요소 위에 배치 */
    }

    /* 고정 버튼 스타일 */
    .fixed-buttons button {
        width: 150px; /* 버튼 너비 */
        margin-bottom: 10px; /* 버튼 간 간격 */
    }

    /* 전체 컨테이너 */
    .container2 {
        margin: 30px auto 0; /* 상단 여백 30px, 가로 중앙 정렬 */
        padding: 0 200px; /* 좌우 여백 */
    }

    /* 게시판 제목 스타일 */
    .board-title {
        font-size: 2rem; /* 글자 크기 */
        font-weight: bold; /* 글자 굵기 */
    }
    .col-md-5 {
    	margin-left: 40px;
   		width: 1200px;       /* 버튼의 너비 */
	    height: 50px;       /* 버튼의 높이 */
        border: 2px solid #ccc;
        border-radius: 5px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center; /* 세로 중심 정렬 */
        min-height: 0;
        box-sizing: border-box;
        padding: 10px; /* 상하단 여백 균일하게 */
    }

	.board-meta p, .board-meta span {
    	margin: 0; /* 기본 외부 여백 제거 */
	    line-height: 1.5; /* 텍스트 행간 */
	    text-align: center; /* 텍스트 가운데 정렬 */
    }
    .board-meta2 {
	    width: 910px;       /* 버튼의 너비 */
	    height: 50px;       /* 버튼의 높이 */
        max-width	: 1500px;
        border: 2px solid #ccc;
        border-radius: 5px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center; /* 세로 중심 정렬 */
        margin-left: 20PX;
        min-height: 0;
        box-sizing: border-box;
        padding: 10px; /* 상하단 여백 균일하게 */
    }
    .board-meta2 p, .board-meta2 span {
    	margin: 0; /* 기본 외부 여백 제거 */
	    line-height: 1.5; /* 텍스트 행간 */
	    text-align: center; /* 텍스트 가운데 정렬 */
	}
    
    
    .board-meta {
	    width: 250px;       /* 버튼의 너비 */
	    height: 50px;       /* 버튼의 높이 */
        max-width: 500px;
        border: 2px solid #ccc;
        border-radius: 5px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center; /* 세로 중심 정렬 */
        margin-left: 20PX;
        min-height: 0;
        box-sizing: border-box;
        padding: 10px; /* 상하단 여백 균일하게 */
    }

	.board-meta p, .board-meta span {
    	margin: 0; /* 기본 외부 여백 제거 */
	    line-height: 1.5; /* 텍스트 행간 */
	    text-align: center; /* 텍스트 가운데 정렬 */
	}



    /* 게시판 본문 영역 */
    .board-content-wrapper {
        padding: 20px; /* 내부 여백 */
        text-align: center; /* 텍스트 가운데 정렬 */
        background-color: #f8f9fa; /* 배경색 */
        border: 1px solid #ccc; /* 테두리 */
        border-radius: 5px; /* 모서리 둥글게 */
    }

    /* 게시판 이미지 스타일 */
    .board-content img {
        max-height: 200px; /* 이미지 최대 높이 */
        object-fit: cover; /* 이미지 비율 유지하며 컨테이너에 맞춤 */
    }

    /* 게시판 본문 텍스트 스타일 */
    .board-content p {
        height: 350px; /* 텍스트 영역 높이 */
        margin-top: 15px; /* 상단 간격 */
        font-size: 1.1rem; /* 글자 크기 */
        line-height: 1.6; /* 줄 간격 */
        color: #333; /* 글자 색상 */
    }
    
	.footer {
    	margin-top:100px;
    }

    /* 버튼 컨테이너 */
    .fixed-btn-container {
        position: fixed; /* 화면 기준 고정 위치 */
        bottom: 200px; /* 하단 거리 */
        left: 50%; /* 가로 중앙 정렬 */
        transform: translateX(-50%); /* 중앙 정렬 보정 */
        display: flex; /* 버튼을 가로로 배치 */
        justify-content: center; /* 가로 중앙 정렬 */
        gap: 10px; /* 버튼 간 간격 */
    }

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
            <div class="board-meta2">
                <p><기간 이벤트>2024-12-24 DOS에서 새로운 메뉴 할인 이벤트!> </p>
            </div>
            <div class="board-meta">
            	<p>조회수: <span id="views">15</span></p>
            </div>
<%--             ${sessionScope.views} --%>
            <div class="board-meta">
            	<p>등록일: <span id="regDate">2024-12-24 15:00</span></p>
            </div>
<%--             ${sessionScope.regDate} --%>
        </div>

        <div class="board-content-wrapper">
            <div class="board-content">
                <img src="path/to/your/image.jpg" alt="이벤트 이미지" class="img-fluid mt-3">
                <p>
                    <strong><기간 이벤트></strong><br>
                    한달에 한번 할인 쿠폰을 드립니다.<br>
                    많은 이용 부탁드립니다.<br>
                </p>
                 <button type="button" class="btn btn-custom">이벤트 관련 버튼</button>
            </div>
        </div>
    </div>

    <div class="fixed-buttons">
        <button type="button" class="btn btn-custom">이전글</button>
        <button type="button" class="btn btn-custom">목록</button>
        <button type="button" class="btn btn-custom">다음글</button>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>