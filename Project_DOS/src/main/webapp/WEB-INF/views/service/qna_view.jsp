<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <!-- 부트스트랩 CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/side2.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
        }
        .layout-container {
            display: flex;
            flex-direction: row;
            min-height: 100vh;
        }
        .sidebar {
        	height: auto;
            width: auto;
            background-color: #f8f9fa;
            color: #fff;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
        }
        .sidebar h5 {
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .sidebar ul li {
            margin-bottom: 10px;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: #333;
            font-size: 16px;
            display: block;
            padding: 10px;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .sidebar ul li a:hover {
            background-color: #495057;
        }
        .main-content {
            flex-grow: 1;
            padding: 20px;
            background-color: #f9f9f9;
        }
        .table-container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .board_title {
        cursor: pointer; /* 커서가 손가락 모양으로 변경 */
        transition: background-color 0.3s, font-weight 0.3s; /* 부드러운 전환 효과 */
  	  	}

    /* 제목에 호버 효과 */
  		.board_title:hover {
        background-color: #f0f0f0; /* 배경색 변경 */
        font-weight: bold; /* 글씨 두껍게 */
        color: #007bff; /* 글자색 변경 (파란색) */
    	}
    	.board-content-wrapper {
        padding: 20px; /* 내부 여백 */
        text-align: start; /* 텍스트 가운데 정렬 */
        background-color: #f8f9fa; /* 배경색 */
        border: 1px solid #ccc; /* 테두리 */
        border-radius: 5px; /* 모서리 둥글게 */
    	min-width: 600px; /* 최소 너비 */
    	min-height: 150px;
   	 	}

	    .inline-button-container {
		    text-align: center; /* 중앙 정렬 */
		    padding: 20px; /* 패딩 */
		}
		
		.btn {
		    display: inline-block; /* 인라인 블록으로 설정 */
		    padding: 10px 20px; /* 버튼 패딩 */
		    font-size: 16px; /* 글자 크기 */
		    border: none; /* 테두리 제거 */
		    border-radius: 5px; /* 모서리 둥글게 */
		    cursor: pointer; /* 마우스 커서 변경 */
		    margin: 5px; /* 버튼 간 간격 */
		}
		
		.btn:hover {
		    background-color: #0056b3; /* 호버 시 색상 변경 */
		}

    </style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
    <!-- 상단 네비게이션 -->
    <nav>
        <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </nav>
    <!-- 사이드바와 메인 콘텐츠 레이아웃 -->
    <div class="layout-container">
        <!-- 고정 사이드바 -->
        <div id="side-menu">
			<jsp:include page="/WEB-INF/views/inc/service_side.jsp"></jsp:include>
		</div>
        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <article class="content">
                <div class="container">
                    <div class="table-container">
                       	<div class="d-flex justify-content-between mb-3">
                            <!-- 제목 select -->
                            <!-- 검색 텍스트 -->
                            <div class="input-group flex-grow-1 me-2" style="width: 60%;">
                                <input type="text" class="form-control" style="font-size: 16px;" value="제목: ${qna.qna_title }" readonly>
                            </div>
                            <div class="input-group flex-grow-1 me-2" style="width: 10%;">
                                <input type="text" class="form-control" name="qna_num" value="${param.qna_num }" hidden>
                                <input type="text" class="form-control" style="font-size: 12px;" value="작성자: ${qna.member_id}" readonly>
                            </div>
                            <div class="input-group flex-grow-1 me-2"style="width: 10%;">
                                <input type="text" class="form-control" style="font-size: 12px;" value="${qna.qna_type}" readonly>
                            </div>
                            <div class="input-group flex-grow-1 me-2"style="width: 10%;">
                                <input type="text" class="form-control" style="font-size: 12px;" value="조회수: ${qna.qna_readcount}" readonly>
                            </div>
                            <div class="input-group flex-grow-1 me-2"style="width: 10%;">
                                <input type="text" class="form-control" style="font-size: 12px;" value="게시일: <fmt:formatDate value='${qna.qna_date}' pattern='yy-MM-dd'/>" readonly>
                            </div>
                       	</div>
                        <h4>문의</h4>
                        <div class="board-content-wrapper">
				            <div class="board-content">
				            	${qna.qna_content}
				            </div>
				        </div>
				        <br>
						<c:if test="${not empty qna.request_content}">
					        <div class="d-flex justify-content-between mb-3">
	                        	<div class="input-group flex-grow-1 me-2"style="width: 90%;"><h4>답변</h4></div>
	                        	<div class="input-group flex-grow-1 me-2"style="width: 10%;">
	                                <input type="text" class="form-control" style="font-size: 12px;" value="답변일: <fmt:formatDate value='${qna.request_date}' pattern='yy-MM-dd'/>" readonly>
	                            </div>
							</div>				        
	                        <div class="board-content-wrapper">
					            <div class="board-content">
					            	${qna.request_content}
					            </div>
					        </div>
				        </c:if>
	                    <div class="inline-button-container">
	                    	<c:if test="${not empty sessionScope.sId}">
	                    		<c:if test="${sessionScope.sId eq qna.member_id or sessionScope.sId eq 'admin' }">
								    <button class="btn btn-primary" onclick="location.href='QnaModify?qna_num=${qna.qna_num}&page_num=${param.pageNum }'">수정</button>
								    <button class="btn btn-primary" onclick="location.href='QnaDelete?qna_num=${qna.qna_num}'">삭제</button>
	                    		</c:if>
							</c:if>	
							<button class="btn btn-primary" onclick="location.href='Question'">목록</button>
						</div>

                    </div>
                </div>
            </article>
        </div>
    </div>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/footer.jsp"></jsp:include>
	</footer>
    <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
    <script src="resources/js/scripts_main.js"></script>
    <script type="text/javascript">
		// 게시물 제목열 클릭 이벤트 핸들링
		
	</script>
</body>
</html>
