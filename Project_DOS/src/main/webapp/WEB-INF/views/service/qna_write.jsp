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
    	.text1 {
 			height: 700px;
 			width: 1256px;
 			resize: none;
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

        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <article class="content">
                <div class="container">
                    <div class="table-container">
                        <h2 class="text-center mb-4">문의사항 등록</h2>
                        <form action="registQna" method="post">
	                        <div class="d-flex justify-content-between mb-3">
	                            <div class="input-group me-2" style="width: 15px;" hidden>
	                                <input type="text" name="member_id" class="form-control" value="${sessionScope.sId}" hidden>
	                            </div>
	                            <!-- 제목 select -->
	                            <div class="input-group me-2" style="width: 15%;">
	                                <select class="form-control selectpicker" id="noticeselect" name="qna_type">
	                                    <option value="일반문의">일반 문의</option>
	                                    <option value="예약문의">예약 문의</option>
	                                </select>
	                            </div>
	                            <div class="input-group flex-grow-1 me-2">
	                                <input type="text" name="qna_title" class="form-control" placeholder="제목을 입력하세요." aria-label="검색어">
	                            </div>
	                            <!-- 글쓰기 버튼 -->
	                            <div style="width: 20%;">
	                                <button class="btn btn-primary w-100" type="submit">등록</button>
	                            </div>
	                        </div>
	                   		<textarea class="text1" id="text1" name="qna_content" placeholder="내용을 입력해주세요."></textarea>
                   		</form>
                    </div>
                </div>
            </article>
        </div>
    </div>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/footer.jsp"></jsp:include>
	</footer>
    <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
	</script>
</body>
</html>
