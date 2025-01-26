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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
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
        	height: 100vh;
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
        .qna_title {
        cursor: pointer; /* 커서가 손가락 모양으로 변경 */
        transition: background-color 0.3s, font-weight 0.3s; /* 부드러운 전환 효과 */
  	  	}

    /* 제목에 호버 효과 */
  		.qna_title:hover {
        background-color: #f0f0f0; /* 배경색 변경 */
        font-weight: bold; /* 글씨 두껍게 */
        color: #007bff; /* 글자색 변경 (파란색) */
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
        <form action="Question" method="get">
            <article class="content">
                <div class="container">
                    <div class="table-container">
                        <h2 class="text-center mb-4">문의사항</h2>
                        <div class="d-flex justify-content-between mb-3">
                            <!-- 제목 select -->
                            <div class="input-group me-2" style="width: 15%;">
                               <c:if test="${param.searchType eq 'subject'}"></c:if>
									<select class="form-control selectpicker" id="QnaSelect" name="searchType">
										<option value="subject" <c:if test="${param.searchType eq 'subject'}">selected</c:if>>제목</option>
										<option value="content" <c:if test="${param.searchType eq 'content'}">selected</c:if>>내용</option>
										<option value="subject_content" <c:if test="${param.searchType eq 'subject_content'}">selected</c:if>>제목&amp;내용</option>
										<option value="writer" <c:if test="${param.searchType eq 'writer'}">selected</c:if>>작성자</option>
										
									</select>
                            </div>
                            <!-- 검색 텍스트 -->
                            <div class="input-group flex-grow-1 me-2">
                                <input type="text" class="form-control"  placeholder="검색어를 입력하세요." name="searchKeyword" value="${param.searchKeyword}" required>
                                <input class="btn btn-outline-secondary" type="submit" style="width: 15%" value="검색">
                            </div>
                            <!-- 글쓰기 버튼 -->
                            <div style="width: 15%;">
                                <button class="btn btn-primary w-100" type="button" onclick="location.href='qnaWrite?$sessionScope.sId=${sessionScope.sId }'" >글쓰기</button>
                            </div>
                        </div>
                        <table class="table table-bordered text-center">
                            <thead class="table-light">
                            <tr>
                                <th style="width: 5%;">번호</th>
                                <th style="width: 65%;">제목</th>
                                <th style="width: 10%;">작성자</th>
                                <th style="width: 10%;">등록일</th>
                                <th style="width: 15%;">조회수</th>
                            </tr>
                            </thead>
                            <c:choose>
                                <c:when test="${empty qnaList}">
                                    <tr><td colspan="5">게시물이 존재하지 않습니다</td></tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="qna" items="${qnaList}" varStatus="status">
                                        <tr>
                                            <td class="qna_num">${qna.qna_num}</td>
                                            <td class="qna_title">${qna.qna_title}</td>
                                            <td>${qna.member_id}</td>
                                            <td>
                                                <fmt:formatDate value="${qna.qna_date}" pattern="yy-MM-dd HH:mm"/>
                                            </td>
                                            <td>${qna.qna_readcount}</td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </table>
                        <nav class="d-flex justify-content-center">
                            <ul class="pagination">
	                            <c:if test="${not empty param.searchKeyword}">
	                            		<c:set var="searchParam" value="&serachType=${param.searchType}&serachKeyword=${param.searchKeyword}"></c:set>
	                           	</c:if>
                                <li class="page-item">
                                	<input type="button" class="page-link" value="&#9664;" onclick="location.href='Question?pageNum=${pageInfo.pageNum - 1}${searchParam}'" 
								    <c:if test="${pageInfo.pageNum eq 1}">disabled</c:if> />
                                </li>
                                <c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                                    <c:choose>
                                        <c:when test="${i eq pageInfo.pageNum}">
                                            <a class="page-link"><b>${i}</b></a>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link" href="Question?pageNum=${i}${searchParam}">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <li class="page-item">
                                    <input type="button" class="page-link" value="&#9654;" onclick="location.href='Question?pageNum=${pageInfo.pageNum + 1}${searchParam}'" 
                                   	<c:if test="${pageInfo.pageNum eq pageInfo.maxPage}" >disabled</c:if>/>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </article>
        </form>
        </div>
    </div>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/footer.jsp"></jsp:include>
	</footer>
    <!-- 부트스트랩 JS -->
    <script type="text/javascript">
		// 게시물 제목열 클릭 이벤트 핸들링
		$(".qna_title").on("click", function(event) {
// 			console.log(event.target);
			
			// [ 클릭된 제목에 해당하는 게시물의 글 번호 가져오기 ]
			// 1) 클릭 대상 요소의 부모 탐색하여 해당 부모의 자식들 중 
			//    클래스 선택자가 "board_num" 인 요소 탐색
// 			let parent = $(event.target).parent(); // 클릭 대상 요소의 부모 요소 탐색
// 			console.log(parent.html());
			
			// 부모 요소의 내부 요소(자식)들 중에서 클래스 선택자 "board_num" 탐색 = find()
// 			let board_num = $(parent).find(".board_num").text(); // 요소내의 텍스트 노드만 가져오기
// 			console.log(board_num); // 클릭된 게시물의 글번호 출력됨
			// -----------------------------------
			// 2) 클릭 대상 요소의 형제 노드 탐색
			let qna_num = $(event.target).siblings(".qna_num").text();
// 			console.log("siblings : " + board_num); // 클릭된 게시물의 글번호 출력됨
			// -----------------------------------
			
			// "BoardDetail" 서블릿 주소 요청
			// => 파라미터 : 글번호(위에서 탐색한 번호), 페이지번호(PageInfo 객체의 pageNum 속성값)
			location.href = "QnaDetail?qna_num=" + qna_num + "&pageNum=${pageInfo.pageNum}";
		});
	</script>
</body>
</html>
