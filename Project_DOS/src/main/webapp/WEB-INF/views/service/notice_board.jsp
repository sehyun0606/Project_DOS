<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%-- <%@ include file="../inc/side.jsp" %> --%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 모바일에서 화면 크기에 맞게 표시하도록 설정 -->
    <title>공지사항게시판</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/side.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .table {
            table-layout: fixed;
            width: 100%;
        }

        .table th, .table td {
            word-wrap: break-word;
            overflow: hidden;
        }

        .table th:nth-child(1), .table td:nth-child(1) { width: 10%; } /* 번호 열 */
        .table th:nth-child(2), .table td:nth-child(2) { width: 40%; } /* 제목 열 */
        .table th:nth-child(3), .table td:nth-child(3) { width: 20%; } /* 작성자 열 */
        .table th:nth-child(4), .table td:nth-child(4) { width: 15%; } /* 등록일 열 */
        .table th:nth-child(5), .table td:nth-child(5) { width: 15%; } /* 조회수 열 */

        .table td:nth-child(1) {
            text-align: center;
        }

        .table td:nth-child(2) {
            text-align: left;
        }

        .table td:nth-child(3) {
            text-align: center;
        }

        .table td:nth-child(4) {
            text-align: center;
        }

        .table td:nth-child(5) {
            text-align: center;
        }

        .btn-custom {
            background-color: white;
            color: black;
            border: 1px solid #ccc;
        }

        .btn-custom:hover {
            background-color: #f8f9fa;
            border-color: #ddd;
            color: black;
        }

        .pagination {
            justify-content: center;
        }

        .pagination .page-item {
            border: 1px solid #ddd;
        }

        .pagination .page-link {
            padding: 10px 15px;
            color: black;
            text-decoration: none;
        }

        .pagination .page-link:hover {
            background-color: #f8f9fa;
            color: black;
        }

        .pagination .active .page-link {
            background-color: #007bff;
            border-color: #007bff;
            color: white;
        }
        
		.footer {
			margin-top:100px;
		}

        .fixed-buttons {
            position: fixed;
            right: 200px;
            bottom: 220px;
            z-index: 10;
        }

        .fixed-buttons button {
            width: 150px;
            margin-bottom: 10px;
        }

        /* 글쓰기 버튼 스타일 */
        .btn-write {
            background-color: white;
            color: black;
            border: 1px solid #ccc;
        }

        .btn-write:hover {
            background-color: #f8f9fa;
            border-color: #ddd;
            color: black;
        }

        .container2 {
            margin-top: 20px;
            margin-left: 200px;
            margin-right: 200px;
        }
    </style>
</head>
<body>
    <div class="container2">
        <!-- 검색 바 -->
        <div class="row mb-4">
            <div class="col-md-3">
                <select class="form-control selectpicker" id="noticeselect">
                    <option value="">제목</option>
                    <option value="">내용</option>
                    <option value="">ID</option>
                </select>
            </div>
            <div class="col-md-6">
                <input type="text" id="search" class="form-control" placeholder="검색어를 입력하세요">
            </div>
            <div class="col-md-3">
                <button type="button" class="btn btn-custom btn-block" onclick="">검색</button>
            </div>
        </div>

        <!-- 테이블 -->
        <div class="table-container">
            <table class="table table-hover table-striped text-center">
                <tr style="font-weight: bold; color: #007bff; background-color: #f1f1f1;">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>등록일</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>홈페이지가 새로 단장했습니다!</td>
                            <td>관리자</td>
                            <td>2024-12-20</td>
                            <td>15</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>홈페이지가 새로 단장했습니다!</td>
                            <td>관리자</td>
                            <td>2024-12-20</td>
                            <td>15</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>홈페이지가 새로 단장했습니다!</td>
                            <td>관리자</td>
                            <td>2024-12-20</td>
                            <td>15</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>홈페이지가 새로 단장했습니다!</td>
                            <td>관리자</td>
                            <td>2024-12-20</td>
                            <td>15</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>홈페이지가 새로 단장했습니다!</td>
                            <td>관리자</td>
                            <td>2024-12-20</td>
                            <td>15</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>홈페이지가 새로 단장했습니다!</td>
                            <td>관리자</td>
                            <td>2024-12-20</td>
                            <td>15</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>홈페이지가 새로 단장했습니다!</td>
                            <td>관리자</td>
                            <td>2024-12-20</td>
                            <td>15</td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>홈페이지가 새로 단장했습니다!</td>
                            <td>관리자</td>
                            <td>2024-12-20</td>
                            <td>15</td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td>홈페이지가 새로 단장했습니다!</td>
                            <td>관리자</td>
                            <td>2024-12-20</td>
                            <td>15</td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td>홈페이지가 새로 단장했습니다!</td>
                            <td>관리자</td>
                            <td>2024-12-20</td>
                            <td>15</td>
                        </tr>
                    </tbody>
                </table>
            </div>

        <!-- 페이지 네비게이션 -->
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">◀</span>
                    </a>
                </li>
                <li class="page-item active">
                    <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">4</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">▶</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

    <!-- Bootstrap JS 및 jQuery (CDN) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html> 