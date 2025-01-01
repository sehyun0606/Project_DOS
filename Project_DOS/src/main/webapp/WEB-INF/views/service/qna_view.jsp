<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../inc/side.jsp" %>
<%@ include file="../inc/top.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>문의사항게시판</title>
    <link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    /* 고정 버튼 영역 */
	.fixed-buttons {
            position: static;
            bottom: auto;
            left: auto;
            transform: none;
            z-index: auto;
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
	   .board-meta3 {
	    width: 210px; /* 부모 컨테이너 너비에 맞춤 */
	    height: 50px;
	    border: 2px solid #ccc;
	    border-radius: 5px;
	    display: flex;
	    align-items: center;
	    padding: 10px;
	}


    .board-meta3 p, .board-meta3 span {
	    line-height: 1.5; /* 텍스트 행간 */
	    text-align: center; /* 텍스트 가운데 정렬 */
	}
    
    
    .board-meta2 {
	    width: 510px;       /* 버튼의 너비 */
	    height: 50px;       /* 버튼의 높이 */
        max-width	: 1500px;
        border: 2px solid #ccc;
        border-radius: 5px;
        flex-direction: column;
        align-items: center;
        justify-content: center; /* 세로 중심 정렬 */
        min-height: 0;
        box-sizing: border-box;
        padding: 10px; /* 상하단 여백 균일하게 */
        margin-left: -100px;
    }
    .board-meta2 p, .board-meta2 span {
    	margin: 0; /* 기본 외부 여백 제거 */
	    line-height: 1.5; /* 텍스트 행간 */
	    text-align: center; /* 텍스트 가운데 정렬 */
	}
    .board-meta {
	    width: 210px;       /* 버튼의 너비 */
	    height: 50px;       /* 버튼의 높이 */
        border: 2px solid #ccc;
        border-radius: 5px;
        display: flex;
        align-items: center;
        margin-left: 20px;
        min-height: 0;
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
        min-height: 300px; /* 최소 높이 */
    	min-width: 300px; /* 최소 너비 */
    }
    
    .board-content-wrapper + .board-content-wrapper {
   		margin-top: 50px; /* 이전 보드 콘텐츠와 다음 보드 콘텐츠 사이의 여백 */
	}



    /* 게시판 본문 텍스트 스타일 */
    .board-content p {
        height: auto; /* 텍스트 영역 높이 자동 */
        margin-top: 15px; /* 상단 간격 */
        font-size: 1.1rem; /* 글자 크기 */
        line-height: 1.6; /* 줄 간격 */
        color: #333; /* 글자 색상 */
    }

    /* 고정 버튼 컨테이너 */
    .fixed-buttons {
        position: absolute; /* 화면 기준 고정 위치 */
        bottom: 330px; /* 하단 거리 */
        left: 50%; /* 가로 중앙 정렬 */
        transform: translateX(-50%); /* 중앙 정렬 보정 */
        z-index: 10; /* 다른 요소 위에 배치 */
    }
    
    .footer {
    	margin:100px;
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
			<div class="col-md-3 d-flex align-items-center">
			    <select class="board-meta3" id="noticeselect">
			        <option value="">일반 문의</option>
			        <option value="">예약 문의</option>
			    </select>
			</div>
            <div class="board-meta2">
                <p>일반 문의입니다.</p> 
            </div>
            <div class="board-meta">
            	<p>작성자: <span id="author">${sessionScope.userId}</span></p>
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
                    예약 문의를 취소하고 싶은데 어떻게 하면되나요 ? 
                </p>
            </div>
        </div>
		<div class="board-meta" style="margin-left: auto;margin-top: 10px;margin-bottom: 10px;">
			<p>등록일: <span id="regDate">${sessionScope.regDate}</span></p>
		</div>
        <div class="board-content-wrapper" >
            <div class="board-content">
                <p>
                    <strong>안녕하세요 최고의 레스토랑 DOS입니다.</strong><br>
                    메뉴바의 예약하기.<br>
                    마이 페이지 상세보기에서 예약 취소를 할 수 있습니다.
                </p>
           

            </div>
        </div>
    </div>

    <div class="fixed-buttons">
        <button type="button" class="btn btn-custom">이전글</button>
        <button type="button" class="btn btn-custom">목록</button>
        <button type="button" class="btn btn-custom">다음글</button>
<%--     <c:if test="${sessionScope.userRole == 'ADMIN'}"> --%>
        <button type="button" class="btn btn-custom">수정하기</button>
<%--     </c:if> --%>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
